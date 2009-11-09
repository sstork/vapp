// -*- Mode : C++ ; c-basic-offset : 4 -*- x
/*
 * Copyright (c) 2009, Anthony Gitter, Sven Stork
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 */

#include <iostream>
#include "AssociativeCache.h"
#include "Global.h"

AssociativeCache::AssociativeCache(int cacheSize,
                                   int lineSize,
                                   int cacheMissLatency,
                                   int memoryRepeatRate,
                                   int associativity,
                                   int prefetch)
    : Cache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, associativity, prefetch)
{
    // fix cache lines
    int i = cacheAssociativity - 1;
    while ( i ) {
        cacheLines = cacheLines >> 1;
        i = i>>1;
    }

    // allocate cache structure
    cacheSet = new CacheLine *[cacheLines];
    for ( int i = 0; i < cacheLines ; i++ ) {
        cacheSet[i] = new CacheLine[cacheAssociativity];
    }
}

AssociativeCache::~AssociativeCache()
{
    for ( int i = 0; i< cacheAssociativity; i++ ) {
        delete cacheSet[i];
    }
    delete cacheSet;
}


long AssociativeCache::getIndex(long addr) {
    int i     = 0 ;
    long mask = cacheSize - 1;

    // adept mask to remove bits that indicate the set elements
    i = cacheAssociativity - 1;
    while ( i ) {
        mask = mask >> 1;
        i = i >> 1;
    }
    // clean leading bits
    long index = addr & mask;

    // cacheline bits
    i = lineSize - 1;
    for ( ; i > 0 ; i = i >> 1) {
        index = index >> 1;
    }

    // take associativity into account
    return index;
}



CacheStats AssociativeCache::read(long addr, int size)
{
    return access(addr, size, false);
}


CacheStats AssociativeCache::write(long addr, int size)
{
    return access(addr, size, true);
}

CacheStats AssociativeCache::accessPrefetch(long addr, int size, bool write)
{
    return access(addr, size, write);
}


CacheStats AssociativeCache::access(long addr, int size, bool write)
{
    int misses = 0;
    int hits   = 0;
    CacheLine *replace = NULL;

    long index = getIndex(addr);

    CacheLine *cs = cacheSet[index];
    for ( int i = 0; i < cacheAssociativity ; i++ ) {
        // check if we have an valid entry in the cache
        if ( cs[i].isValid() ) {
            if ( cs[i].getTag() != getTag(addr) ) {
                if ( replace != NULL ) {
                    if ( cs[i].getLRU() < replace->getLRU() ) {
                        replace = &cs[i];
                    }
                } else {
                    replace = &cs[i];
                }
            } else {
                // we have a hit
                cs[i].setLRU( RDTSC() );
                if ( write ) {
                    cs[i].setDirty(true);
                }
                replace = NULL;
                break;
            }
        } else {
            // cache not valid -> always least recently used
            replace = &cs[i];
        }

    }

    if ( NULL != replace ) {
        // we had not hit and candidate points to the line that needs to be replaced
        misses = 1;
        replace->setTag( getTag(addr) );
        replace->setLRU( RDTSC() );
        replace->setValid(true);
        replace->setDirty(write);
    } else {
        hits = 1;
    }

    return CacheStats(misses, hits, misses * cacheMissLatency);
}



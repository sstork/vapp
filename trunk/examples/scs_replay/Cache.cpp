// -*- Mode : C++ ; c-basic-offset : 4 -*-
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

#include "Cache.h"

#include <iostream>
#include <iomanip>

using namespace std;

Cache::Cache(int cacheSize,
             int lineSize,
             int cacheMissLatency,
             int memoryRepeatRate,
             int associativity,
             int prefetch)
{
    this->cacheSize          = cacheSize;
    this->lineSize           = lineSize;
    this->cacheMissLatency   = cacheMissLatency;
    this->memoryRepeatRate   = memoryRepeatRate;
    this->cacheAssociativity = associativity;
    this->cachePrefetch      = prefetch;

    this->cacheLines = cacheSize / lineSize;
}


void Cache::doReport(std::ostream &report)
{
    report << endl;
    report << " Configuration: size = " << (cacheSize/1024) << "KB, line size = " << lineSize << "B, associativity = " << cacheAssociativity << "-way," << endl <<
        "   miss latency = " << cacheMissLatency << " cycles, prefetch repeat rate = " << memoryRepeatRate << " cycles" << endl;
}


long Cache::getIndex(long addr) {
    int i = lineSize-1;
    long mask = cacheSize-1;
    long index = addr & mask;
    for ( ; i > 0 ; i = i>>1) {
        index = index >> 1;
    }
    return index;
}


long int Cache::getTag(long addr) {
    int i = cacheSize;

    int tag = addr;
    for ( ; i > 0 ; i = i>>1) {
        tag = tag>>1;
    }
    return tag;
}

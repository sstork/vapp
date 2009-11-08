// -*- Mode : C++ ; c-basic-offset : 4 -*- x

#include <iostream>
#include <list>
#include "FinitePrefetchAssociativeCache.h"
#include "Global.h"

using namespace std;

FinitePrefetchAssociativeCache::FinitePrefetchAssociativeCache(int cacheSize,
                                                               int lineSize,
                                                               int cacheMissLatency,
                                                               int memoryRepeatRate,
                                                               int associativity,
                                                               int prefetch)
    : Cache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, associativity, prefetch)
{   
    // fix cache lines 
    int i = cacheAssociativity-1;
    while ( i ) {
        cacheLines = cacheLines >> 1;
        i = i>>1;
    }

    // allocate cache structure 
    cacheSet = new CacheLine *[cacheLines];
    for ( int i = 0; i < cacheLines ; i++ ) {
        cacheSet[i] = new CacheLine[associativity];
    }
}

FinitePrefetchAssociativeCache::~FinitePrefetchAssociativeCache()
{ 
    for ( int i = 0; i< cacheAssociativity; i++ ) {
        delete cacheSet[i];
    }
    delete cacheSet;
}


long FinitePrefetchAssociativeCache::getIndex(long addr) {
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


    
CacheStats FinitePrefetchAssociativeCache::read(long addr, int size)
{
    return accessPrefetch(addr, size, false);
}


CacheStats FinitePrefetchAssociativeCache::write(long addr, int size)
{
    return accessPrefetch(addr, size, true);
}


CacheStats FinitePrefetchAssociativeCache::accessPrefetch(long addr, int size, bool write)
{
    CacheStats stats;
    list<Request>::iterator it = prefetchQueue.begin();

    if ( inCache(addr)  || 0 == prefetchQueue.size() ) {
        // hit in the cache or no outstanding requests
        stats = access(addr, size, write);
    } else {
        // the value is not in the cache / no 
        // check if the cacheline already has been requested 
        bool requested = false;
        for ( ; it != prefetchQueue.end() ; it++ ) {
            if ( (*it).getAddress() == addr ) {
                requested = true;
            }
        }
        
        if ( !requested ) {
            // append to list of outstanding objects 
            // add this request to append this request to the queue
            prefetchQueue.push_back(Request(addr, RDTSC(), size));
            
        } 
        
        // operate on outstanding request until the current request has been satisfied 
        int cycles = 0;
        bool done = false;
        do {
            if ( addr == prefetchQueue.front().getAddress() ) {
                // finally 
                access(prefetchQueue.front().getAddress(),
                       prefetchQueue.front().getSize(),
                       write);
                done = true;
            } else {
                // process other elements
                access(prefetchQueue.front().getAddress(),
                       prefetchQueue.front().getSize(),
                       false);
                           
            }
            cycles += memoryRepeatRate;  // update cycles
            prefetchQueue.pop_front();   // remove processed element
        } while ( !done );
            
        stats = CacheStats(1, 0, cycles);
    }
    
    // prefetch k cache lines
    if ( prefetchQueue.size() == 0 ) {
        for ( int i = 0 ; i < cachePrefetch ; i++ ) {
            long prefetchAddr = addr + ( (i+1) * lineSize);
            prefetchQueue.push_back(Request(prefetchAddr, RDTSC(), size));
        }
    }
    return stats;
}

CacheStats FinitePrefetchAssociativeCache::access(long addr, int size, bool write)
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

    return CacheStats(misses, hits, misses*cacheMissLatency);
}

bool FinitePrefetchAssociativeCache::inCache(long addr)
{
    long index = getIndex(addr);
   
    CacheLine *cs = cacheSet[index];
    for ( int i = 0; i < cacheAssociativity ; i++ ) {
        if ( cs[i].isValid() &&  cs[i].getTag() == getTag(addr) ) {
            return true;
        }        
    }
    return false;
}




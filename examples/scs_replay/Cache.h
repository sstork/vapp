// -*- Mode : C++ ; c-basic-offset : 4 -*- 
/*
 * Copyright (c) 2009, Antony Gitter, Sven Stork
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

#ifndef CACHE_H
#define CACHE_H

#include <fstream>
#include <math.h>


class CacheStats {
 private:
    int cacheMisses;
    int cacheHits;    
    int cacheCycles;

 public:
    CacheStats() : cacheMisses(0), cacheHits(0), cacheCycles(0) {}
    CacheStats(int misses, int hits, int cycles) : cacheMisses(misses), cacheHits(hits), cacheCycles(cycles) {}
    
    int getMisses()  { return cacheMisses; } 
    int getHits() { return cacheHits; }
    int getCycles() { return cacheCycles; }
};



class Cache {
 protected:
    int cacheSize;
    int lineSize;
    int cacheMissLatency;
    int memoryRepeatRate;
    int cacheAssociativity;
    int cachePrefetch;

    int cacheLines;

 public:
    Cache(int cacheSize,
          int lineSize,
          int cacheMissLatency,
          int memoryRepeatRate,
          int associativity,
          int prefech);

    virtual ~Cache() {}
    
    int getCacheSize() { return cacheSize; }
    int getLineSize() { return lineSize; }
    int getCacheMissRate() { return cacheMissLatency; }
    int getMemoryRepeatRate() { return memoryRepeatRate; }

    virtual CacheStats read(long addr, int size) = 0;
    virtual CacheStats write(long addr, int size) = 0;

    virtual void doReport(std::ostream &report);
    
    virtual long getIndex(long addr);
    virtual long int getTag(long addr);
};
 

class CacheLine {
 protected:
    long tag;
    bool valid;
    bool dirty;
    long lru;

 public:
 CacheLine() : tag(0), valid(false), dirty(false), lru(0) {}

    long getTag() { return tag; } 
    void setTag(long v) { tag = v; }

    bool isValid() { return valid; } 
    void setValid(bool v) { valid = v; }

    bool isDirty() { return dirty; }
    void setDirty(bool v) { dirty = v; }

    long getLRU() { return lru; }
    void setLRU(long v) { lru = v; } 
};

#endif // CACHE_H

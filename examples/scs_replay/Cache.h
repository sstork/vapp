// -*- Mode : C++ ; c-basic-offset : 4 -*- 

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

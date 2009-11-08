// -*- Mode : C++ ; c-basic-offset : 4 -*- 

#ifndef FINITE_PREFETCH_ASSOCIATIVE_CACHE_H
#define FINITE_PREFETCH_ASSOCIATIVE_CACHE_H

#include "Cache.h"

#include <list>

class Request {
 private:
    long address;
    long tsc;     // the tsc when this request was issues 
    int size;
    
 public:
 Request(long address, long tsc, int size) : address(address), tsc(tsc), size(size) {}
 Request() : address(0), tsc(0), size(0) {}
    Request(const Request &other) {
        address = other.address;
        tsc     = other.tsc;
        size    = other.size;
    }
    
    long getAddress() { return address; }
    long getTSC() { return address; }
    int getSize() { return size; }
};



class FinitePrefetchAssociativeCache : public Cache 
{
 protected:
    CacheLine **cacheSet;
    std::list<Request> prefetchQueue;
   

 public:
    FinitePrefetchAssociativeCache(int cacheSize,
                                   int lineSize,
                                   int cacheMissLatency,
                                   int memoryRepeatRate,
                                   int associativity,
                                   int prefefetch);
    virtual ~FinitePrefetchAssociativeCache();
    
    virtual CacheStats read(long addr, int size);
    virtual CacheStats write(long addr, int size);

    virtual long getIndex(long addr);

 protected:
    CacheStats accessPrefetch(long addr, int size, bool write);
    CacheStats access(long addr, int size, bool write);

    bool inCache(long addr);

};

#endif // FINITE_PREFETCH_ASSOCIATIVE_CACHE_H

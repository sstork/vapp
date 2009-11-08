// -*- Mode : C++ ; c-basic-offset : 4 -*- 

#ifndef INFINITE_PREFETCH_ASSOCIATIVE_CACHE_H
#define INFINITE_PREFETCH_ASSOCIATIVE_CACHE_H

#include "Cache.h"

class InfinitePrefetchAssociativeCache : public Cache 
{
 protected:
    CacheLine **cacheSet;
  
 public:
    InfinitePrefetchAssociativeCache(int cacheSize,
                                     int lineSize,
                                     int cacheMissLatency,
                                     int memoryRepeatRate,
                                     int associativity,
                                     int prefefetch);
    virtual ~InfinitePrefetchAssociativeCache();
    
    virtual CacheStats read(long addr, int size);
    virtual CacheStats write(long addr, int size);

    virtual long getIndex(long addr);

 protected:
    CacheStats accessPrefetch(long addr, int size, bool write);
    CacheStats access(long addr, int size, bool write);
};

#endif // INFINITE_PREFETCH_ASSOCIATIVE_CACHE_H

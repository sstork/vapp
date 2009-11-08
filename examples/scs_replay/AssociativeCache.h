// -*- Mode : C++ ; c-basic-offset : 4 -*- 

#ifndef ASSOCIATIVE_CACHE_H
#define ASSOCIATIVE_CACHE_H

#include "Cache.h"

class AssociativeCache  : public Cache 
{
 protected:
    CacheLine **cacheSet;
  
 public:
    AssociativeCache(int cacheSize,
                     int lineSize,
                     int cacheMissLatency,
                     int memoryRepeatRate,
                     int associativity,
                     int prefefetch);
    virtual ~AssociativeCache();
    
    virtual CacheStats read(long addr, int size);
    virtual CacheStats write(long addr, int size);

    virtual long getIndex(long addr);

 protected:
    virtual CacheStats accessPrefetch(long addr, int size, bool write);
    virtual CacheStats access(long addr, int size, bool write);
};

#endif // ASSOCIATIVE_CACHE_H

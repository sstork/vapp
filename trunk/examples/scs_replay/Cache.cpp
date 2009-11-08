// -*- Mode : C++ ; c-basic-offset : 4 -*- 

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

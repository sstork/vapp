#ifndef PART_H
#define PART_H


#include <string>
#include "Executor.h"

#include "Cache.h"
#include "Profiler.h"



typedef enum  {
  NO_PREFETCH          = 0,
  PREFETCH_INFINITE_BW = 1,
  PREFETCH_FINITE_BW   = 2
} PrefetchMode;



class Part : public Executor {
 protected:
    int cacheSize;
    int lineSize;
    int cacheMissLatency;
    int memoryRepeatRate;
    int cacheAssociativity;
    int cachePrefetch;

    long totalInstructions;
    long totalCycles;
    Cache *instrCache;
    Cache *dataCache;
    Profiler *instrProfiler;
    Profiler *dataProfiler;

 public:
    Part(int cacheSize,
         int lineSize,
         int cacheMissLatency,
         int memoryRepeatRate,
         int associativity,
         int prefetch,
         PrefetchMode mode);

    virtual ~Part();

    // is called for instructions that read one memory location
    virtual void memRead(long ip, long addr, int size);
    
    // is called for instructions that read two memory location
    virtual void memRead(long ip, long addr1, long addr2, int size);
    
    // is called for instructions that write to memory
    virtual void memWrite(long ip, long addr, int size);

    // called for all other instructions
    virtual void instruction(long ip);

    // is called when the simulation ends to generate the final report
    virtual void doReport(std::ostream & os);
};


#endif // PART_H

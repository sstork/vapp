// -*- Mode : C++ ; c-basic-offset : 4 -*- 

#include <iostream>
#include <iomanip>
#include <fstream>

#include <stdlib.h>

#include "Part.h"
#include "Global.h"
#include "AssociativeCache.h"
#include "InfinitePrefetchAssociativeCache.h"
#include "FinitePrefetchAssociativeCache.h"


using namespace std;


Part::Part(int cacheSize,
           int lineSize,
           int cacheMissLatency,
           int memoryRepeatRate,
           int associativity,
           int prefetch,
           PrefetchMode mode)
  : cacheSize(cacheSize), lineSize(lineSize), cacheMissLatency(cacheMissLatency),
    memoryRepeatRate(memoryRepeatRate), cacheAssociativity(associativity), cachePrefetch(prefetch), 
    instrCache(NULL), dataCache(NULL)
{
    switch (mode) {
    case NO_PREFETCH:
        instrCache = new AssociativeCache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, cacheAssociativity, cachePrefetch);
        dataCache  = new AssociativeCache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, cacheAssociativity, cachePrefetch);
        break;
    case PREFETCH_INFINITE_BW:
        instrCache = new InfinitePrefetchAssociativeCache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, cacheAssociativity, cachePrefetch);
        dataCache  = new InfinitePrefetchAssociativeCache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, cacheAssociativity, cachePrefetch);
        break;
    case PREFETCH_FINITE_BW:
        instrCache = new FinitePrefetchAssociativeCache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, cacheAssociativity, cachePrefetch);
        dataCache  = new FinitePrefetchAssociativeCache(cacheSize, lineSize, cacheMissLatency, memoryRepeatRate, cacheAssociativity, cachePrefetch);
        break;
    default:
        std::cout << "Invalid mode :" << mode << endl;
        exit(0);
    }

    instrProfiler = new Profiler();
    dataProfiler = new Profiler();
}


Part::~Part()
{
    delete instrCache;
    delete dataCache;
    delete instrProfiler;
    delete dataProfiler;
}


void Part::memRead(long ip, long addr, int size)
{
    int cycles = 1; // for the instruction itself
    CacheStats stats;
    
    // check if the instruction causes an miss
    stats = instrCache->read(ip, 1);
    instrProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();
    
    // check if the memory reference causes a miss
    stats = dataCache->read(addr, size);
    dataProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();

    // update statistics
    instrProfiler->addToUsage(ip, 1);
    dataProfiler->addToUsage(ip, 1);
    totalInstructions++;
    totalCycles += cycles;
    advanceTSC(cycles);
}


void Part::memRead(long ip, long addr1, long addr2, int size)
{
    int cycles = 1; // for the instruction itself
    CacheStats stats;

    // check if the instruction causes an miss
    stats = instrCache->read(ip, 1);
    instrProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();

    // check if the memory reference causes a miss
    stats = dataCache->read(addr1, 1);
    dataProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();

    // check if the memory reference causes a miss
    stats = dataCache->read(addr2, 1);
    dataProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();

    // update statistics
    instrProfiler->addToUsage(ip, 1);
    dataProfiler->addToUsage(ip, 1);
    totalInstructions++;
    totalCycles += cycles;
    advanceTSC(cycles);
}


void Part::memWrite(long ip, long addr, int size)
{
    int cycles = 1; // for the instruction itself
    CacheStats stats;
    
    // check if the instruction causes an miss
    stats = instrCache->read(ip, 1);
    instrProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();

    // check if the memory reference causes a miss
    stats = dataCache->write(addr, 1);
    dataProfiler->addToWrite(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();
    
    // update statistics
    instrProfiler->addToUsage(ip, 1);
    dataProfiler->addToUsage(ip, 1);
    totalInstructions++;
    totalCycles += cycles;
    advanceTSC(cycles);
}


void Part::instruction(long ip)
{
    // just keep total instruction counter up to date
    int cycles = 1;
    CacheStats stats;
    
    stats = instrCache->read(ip, 1);
    instrProfiler->addToRead(ip, stats.getHits(), stats.getMisses(), stats.getCycles());
    cycles += stats.getCycles();

    instrProfiler->addToUsage(ip, 1);
    totalInstructions++;
    totalCycles += cycles;
    advanceTSC(cycles);
}


void Part::doReport(ostream &report)
{
    report << "==============================================================================" << endl;
    report << "==                      SCS - Super Cache Simulator                         ==" << endl;
    report << "==============================================================================" << endl;
    report << endl;
    report << "Overall Performance Breakdown: " << endl;
    report << "==============================================================================" << endl;
    report << "  Instruction Execution:     " << setw(10) << (totalInstructions * 1) << " cycles (" << setw(6) << setprecision(2) << showpoint << fixed <<  (totalInstructions/(0.01*totalCycles)) <<  "%)" << endl; 
    report << "  Data Cache Stalls:         " << setw(10) << dataProfiler->getTotalStallCycles() << " cycles (" << setw(6) << setprecision(2) << showpoint << fixed <<  (dataProfiler->getTotalStallCycles()/(0.01*totalCycles)) <<  "%)" << endl; 
    report << "  Instruction Cache Stalls:  " << setw(10) << instrProfiler->getTotalStallCycles() << " cycles (" << setw(6) << setprecision(2) << showpoint <<  fixed << (instrProfiler->getTotalStallCycles()/(0.01*totalCycles)) <<  "%)" << endl; 
    report << " ----------------------------------------------------------------------------" << endl;
    report << "  Total Execution Time :     " << setw(10) << totalCycles << " cycles (100.00%)" << endl; 
    report << endl ;
    report << endl;
    report << "Data Cache:" << endl;
    report << "==============================================================================" << endl;
    dataCache->doReport(report);
    report << endl;
    dataProfiler->doReport(report);
    report << endl;
    report << endl;
    report << "Instruction Cache:" << endl;
    report << "==============================================================================" << endl;
    instrCache->doReport(report);
    report << endl;
    instrProfiler->doReport(report);
    report << endl << endl;
}

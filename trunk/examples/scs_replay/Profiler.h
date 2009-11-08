// -*- Mode : C++ ; c-basic-offset : 4 -*- 

#ifndef PROFILER_H
#define PROFILER_H


#include <fstream>
#include <map>
#include <list>

class Entry {
 private:
    long address;
    long usage;
    long readCacheMisses;
    long writeCacheMisses;
    long readCacheHits;
    long writeCacheHits;
    long readMissCycles;
    long writeMissCycles;

 public:
   Entry(long ip) 
     : address(ip), usage(0), readCacheMisses(0), writeCacheMisses(0), 
        readCacheHits(0), writeCacheHits(0), 
        readMissCycles(0), writeMissCycles(0) {}
    
    long getAddress() { return address; }
    long getUsage() { return usage; }
    long getReadCacheMisses() { return readCacheMisses; }
    long getWriteCacheMisses() { return writeCacheMisses; }
    long getReadCacheHits() { return readCacheHits; }
    long getWriteCacheHits() { return writeCacheHits; }
    long getReadMissCycles() { return readMissCycles; }
    long getWriteMissCycles() { return writeMissCycles; }

    void addToUsage(long v) { usage += v; }
    void addToReadCacheMisses(long v) { readCacheMisses += v; }
    void addToWriteCacheMisses(long v) { writeCacheMisses += v; }
    void addToReadCacheHits(long v) { readCacheHits += v; }
    void addToWriteCacheHits(long v) { writeCacheHits += v; }
    void addToReadMissCycles(long v) { readMissCycles += v; }    
    void addToWriteMissCycles(long v) { writeMissCycles += v; }    
};


class Profiler {
 private:
    std::map<long, Entry*> database;
    /* int cacheMissLatency; */
    /* int memoryRepeatRate; */

    
 public:
    /* Profiler(int cacheMissLatency, int memoryRepeatRate); */
    /* ~Profiler(); */

    void addToRead(long ip, long cacheHits, long cacheMisses, long missCycles);
    void addToWrite(long ip, long cacheHits, long cacheMisses, long missCycles);
    void addToUsage(long ip, long value);
    void doReport(std::ostream &report);

    long getTotalStallCycles();

 protected:
    void reportEntires(std::ostream &report, 
                       std::list<Entry*> &entires, 
                       long totalReadMisses, 
                       long totalReadHits, 
                       long totalWriteMisses,
                       long totalWriteHits);

};

#endif // PROFILER_H

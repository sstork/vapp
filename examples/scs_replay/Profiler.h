// -*- Mode : C++ ; c-basic-offset : 4 -*-
/*
 * Copyright (c) 2009, Anthony Gitter, Sven Stork
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

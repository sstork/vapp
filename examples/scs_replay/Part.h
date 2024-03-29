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

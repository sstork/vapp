// -*- c-basic-offset : 4 -*-
/*
 * Copyright (c) 2009, Antony Gitter, Sven Stork
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

#include <iostream> 
#include <Executor.h>
#include <VAPPReplay.h>

using namespace std;

class InstrCounter : public Executor {
public:
    int instCount;

    InstrCounter() : instCount(0) {}

    virtual ~InstrCounter() {}

    // is called for instructions that read one memory location
    virtual void memRead(long ip, long addr, int size)
    {
        instCount++;
    }

    // is called for instructions that read two memory location
    virtual void memRead(long ip, long addr1, long addr2, int size)
    {
        instCount++;
    }
    
    // is called for instructions that write to memory
    virtual void memWrite(long ip, long addr, int size) 
    {
        instCount++;
    }

    // called for all other instructions
    virtual void instruction(long ip) 
    {
        instCount++;
    }

    // is called when the simulation ends to generate the final report
    virtual void doReport(std::ostream &os)
    {
        os << "instruction count = " << instCount << endl;
    }
};


int main (int argc, char *argv[]) 
{
    if ( argc < 2 ) {
        cout << "usage : simple_replay [FILENAME]" << endl;
        return -1;
    }

    // initialize database
    if ( false == vappr_init(argv[1]) ) {
        cerr << "Failed to open : " << argv[1] << endl;
        return -1;
    }

    // add instruction counter
    vappr_add_executor(new InstrCounter());

    // run memory accesses
    vappr_run_memory_accesses();
    
    // cleanup 
    vappr_finalize();

    return 0;
}

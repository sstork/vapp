// -*- c-basic-offset : 4 -*-
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
#include "Part.h"

#include <fstream>
#include <iostream>

#include <VAPPReplay.h>

using namespace std;

int main(int argc, char *argv[])
{
    //    Executor *ex = NULL;
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
    vappr_add_executor(new Part(128*1024 /* cache size */,
                                64 /* line size */,
                                20 /* cacheMissLatency */,
                                100 /* memoryRepeatRate */,
                                4 /* associativity */,
                                2 /* prefetch */,
                                PREFETCH_FINITE_BW /* prefecth mode */)
                       );

    // run memory accesses
    vappr_run_memory_accesses();

    // cleanup
    vappr_finalize();

    return 0;
}

// -*- c-basic-offset : 4 -*-
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

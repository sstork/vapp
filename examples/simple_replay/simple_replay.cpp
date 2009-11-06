// -*- c-basic-offset : 4 -*-

#include <iostream> 
#include <Executor.h>
#include <VAPPReplay.h>

using namespace std;



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

    // run memory accesses
    vappr_run_memory_accesses();
    
    // cleanup 
    vappr_finalize();

    return 0;
}

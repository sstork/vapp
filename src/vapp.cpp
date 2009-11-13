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

#include "pin.H"

#include "callbacks.h"
#include "database.h"

#include <libgen.h>
#include <fstream>
#include <iostream>

#include <map>

/*
 * Name of the output file
 */
KNOB<string> KnobOutputFile(KNOB_MODE_WRITEONCE,         "pintool", "output",        "data", "output file");


/**
 * Database with image/id mappings
 */
static map<string, int> image_map;


// Pin calls this function every time a new instruction is encountered
void VAPPInstrumentInstruction(INS ins, VOID *v)
{
  if (INS_IsMemoryRead(ins)){
    UINT32 size =  INS_MemoryReadSize(ins);
    if (INS_HasMemoryRead2(ins)) {
      INS_InsertPredicatedCall(ins,
                               IPOINT_BEFORE,
                               (AFUNPTR)VAPPMemRead2,
                               IARG_PTR, v,
                               IARG_INST_PTR,
                               IARG_MEMORYREAD_EA,
                               IARG_MEMORYREAD2_EA,
                               IARG_UINT32, size, // IARG_MEMORYREAD_SIZE
                               IARG_THREAD_ID,
                               IARG_END);
    } else {
      INS_InsertPredicatedCall(ins,
                               IPOINT_BEFORE,
                               (AFUNPTR)VAPPMemRead,
                               IARG_PTR, v,
                               IARG_INST_PTR,
                               IARG_MEMORYREAD_EA,
                               IARG_UINT32, size, // IARG_MEMORYREAD_SIZE
                               IARG_THREAD_ID,
                               IARG_END);
    }
  } else if (INS_IsMemoryWrite(ins)){
    UINT32 size = INS_MemoryWriteSize(ins);
    INS_InsertPredicatedCall(ins,
                             IPOINT_BEFORE,
                             (AFUNPTR)VAPPMemWrite,
                             IARG_PTR, v,
                             IARG_INST_PTR,
                             IARG_MEMORYWRITE_EA,
                             IARG_UINT32, size, // IARG_MEMORYWRITE_SIZE
                             IARG_THREAD_ID,
                             IARG_END);
  } else {
    INS_InsertCall(ins,
                   IPOINT_BEFORE,
                   (AFUNPTR)VAPPInstruction,
                   IARG_PTR, v,
                   IARG_INST_PTR,
                   IARG_THREAD_ID,
                   IARG_END);
  }
}

VOID VAPPInstrumentImage(IMG img, VOID *v)
{
    RTN rtn;

    rtn =  RTN_FindByName(img, "malloc");
    if ( RTN_Valid(rtn) ) {
        RTN_Open(rtn);
        // callback after we returned from call
        RTN_InsertCall(rtn,
                       IPOINT_BEFORE,
                       (AFUNPTR)VAPPMallocEnter,
                       IARG_PTR, rtn,
                       IARG_FUNCARG_ENTRYPOINT_VALUE, 0,
                       IARG_THREAD_ID,
                       IARG_END);
        RTN_InsertCall(rtn,
                       IPOINT_AFTER,
                       (AFUNPTR)VAPPMallocLeave,
                       IARG_PTR, rtn,
                       IARG_FUNCRET_EXITPOINT_VALUE,
                       IARG_THREAD_ID,
                       IARG_END);
        RTN_Close(rtn);
    }

    rtn =  RTN_FindByName(img, "free");
    if ( RTN_Valid(rtn) ) {
        RTN_Open(rtn);
        // callback after we returned from call
        RTN_InsertCall(rtn,
                       IPOINT_BEFORE,
                       (AFUNPTR)VAPPFree,
                       IARG_PTR, rtn,
                       IARG_FUNCARG_ENTRYPOINT_VALUE, 0,
                       IARG_END);
        RTN_Close(rtn);
    }
    

    rtn =  RTN_FindByName(img, "pthread_mutex_lock");
    if ( RTN_Valid(rtn) ) {
        RTN_Open(rtn);
        RTN_InsertCall(rtn,
                       IPOINT_BEFORE,
                       (AFUNPTR)VAPPLockEnter,
                       IARG_PTR, rtn,
                       IARG_FUNCARG_ENTRYPOINT_VALUE, 0,
                       IARG_THREAD_ID,
                       IARG_END);
        RTN_InsertCall(rtn,
                       IPOINT_AFTER,
                       (AFUNPTR)VAPPLockLeave,
                       IARG_PTR, rtn,
                       IARG_FUNCRET_EXITPOINT_VALUE,
                       IARG_THREAD_ID,
                       IARG_END);
        RTN_Close(rtn);
    }

    rtn =  RTN_FindByName(img, "pthread_mutex_unlock");
    if ( RTN_Valid(rtn) ) {
        RTN_Open(rtn);
        RTN_InsertCall(rtn,
                       IPOINT_BEFORE,
                       (AFUNPTR)VAPPUnLockEnter,
                       IARG_PTR, rtn,
                       IARG_FUNCARG_ENTRYPOINT_VALUE, 0,
                       IARG_THREAD_ID,
                       IARG_END);
        RTN_InsertCall(rtn,
                       IPOINT_AFTER,
                       (AFUNPTR)VAPPUnLockLeave,
                       IARG_PTR, rtn,
                       IARG_FUNCRET_EXITPOINT_VALUE,
                       IARG_THREAD_ID,
                       IARG_END);
        RTN_Close(rtn);
    }
}

// This function is called when the application exits
void VAPPFini(INT32 code, VOID *v)
{
    // Shutdown database
    db_finalize();
}

int main(int argc, char *argv[])
{

    // Initialize pin
    PIN_Init(argc, argv);

    // Initialize symbols
    PIN_InitSymbols();

    // Initialize database and callback functions
    db_init(KnobOutputFile.Value());

    // Register Image to be called to instrument functions.
    IMG_AddInstrumentFunction(VAPPInstrumentImage, 0);

    // Register scs_nstruction to be called to instrument instructions
    INS_AddInstrumentFunction(VAPPInstrumentInstruction, NULL);

    // Register scs_fini to be called when the application exits
    PIN_AddFiniFunction(VAPPFini, NULL);

    // Register thread functions
    PIN_AddThreadStartFunction(VAPPThreadStart, 0);
    PIN_AddThreadFiniFunction(VAPPThreadStop, 0);

    VAPPInit();

    // Start the program, never returns
    PIN_StartProgram();

    return 0;
}

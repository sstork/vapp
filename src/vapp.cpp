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
                               IARG_END);
    } else {
      INS_InsertPredicatedCall(ins, 
                               IPOINT_BEFORE, 
                               (AFUNPTR)VAPPMemRead,
                               IARG_PTR, v,
                               IARG_INST_PTR,
                               IARG_MEMORYREAD_EA,
                               IARG_UINT32, size, // IARG_MEMORYREAD_SIZE
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
                             IARG_END);
  } else {
    INS_InsertCall(ins, 
                   IPOINT_BEFORE, 
                   (AFUNPTR)VAPPInstruction,
                   IARG_PTR, v,
                   IARG_INST_PTR,
                   IARG_END);
  }

}

VOID VAPPInstrumentRoutine(RTN rtn, VOID *v)
{ 
    // add method to database 
    string img_name = basename((char*)IMG_Name(SEC_Img(RTN_Sec(rtn))).c_str());
    if ( image_map[img_name] == 0 ) {
        image_map[img_name] = IMG_Id(SEC_Img(RTN_Sec(rtn)));
        db_add_image(image_map[img_name], img_name);
    }
    int img_id = image_map[img_name];
    string name = RTN_Name(rtn);
    unsigned long int start =  RTN_Address(rtn);
    unsigned long int end = start +  RTN_Size(rtn);
    
    db_add_method(name, img_id, start, end);


    RTN_Open(rtn);
    // callback before we call function
    RTN_InsertCall(rtn, 
                   IPOINT_BEFORE,
                   (AFUNPTR)VAPPRoutineEnter,
                   IARG_PTR, rtn,
                   IARG_END);
    // callback after we returned from call
    RTN_InsertCall(rtn, 
                   IPOINT_AFTER,
                   (AFUNPTR)VAPPRoutineLeave,
                   IARG_PTR, rtn,
                   IARG_END);
    RTN_Close(rtn);
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

    // Initialize database
    db_init(KnobOutputFile.Value());
    
    // Register Routine to be called to instrument rtn
    RTN_AddInstrumentFunction(VAPPInstrumentRoutine, 0);
    
    // Register scs_nstruction to be called to instrument instructions
    INS_AddInstrumentFunction(VAPPInstrumentInstruction, NULL);

    // Register scs_fini to be called when the application exits
    PIN_AddFiniFunction(VAPPFini, NULL);

    // Start the program, never returns
    PIN_StartProgram();
    
    return 0;
}

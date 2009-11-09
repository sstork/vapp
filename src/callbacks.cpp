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

#include "callbacks.h"
#include "database.h"

#include <stdlib.h>
#include <libgen.h>

#include <string>
#include <iostream>

using namespace std;


static long int VCLOCK = 0;
static vapp_flags_t  VAPPTracing = VAPP_NONE;
static PIN_LOCK cb_lock;

// This function is called for every instruction reads from memory.
void VAPPMemRead(void *ex, ADDRINT ip, ADDRINT raddr1, UINT32 rsize) {
    OS_THREAD_ID tid = PIN_GetTid();

    if ( VAPPTracing & VAPP_MEM_ACCESS) {
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)ip, (unsigned long int)ip, tid, 0);
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)raddr1, (unsigned long int)ip, tid, 0);
    }

    GetLock(&cb_lock, tid+1);
    VCLOCK++;
    ReleaseLock(&cb_lock);
}


// This function is called for every instruction reads from memory.
void VAPPMemRead2(void *ex, ADDRINT ip, ADDRINT raddr1, ADDRINT raddr2, UINT32 rsize) {
    OS_THREAD_ID tid = PIN_GetTid();

    if ( VAPPTracing  & VAPP_MEM_ACCESS ) {
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)ip, (unsigned long int)ip, tid, 0);
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)raddr1, (unsigned long int)ip, tid, 0);
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)raddr2, (unsigned long int)ip, tid, 0);
    }

    GetLock(&cb_lock, tid+1);
    VCLOCK++;
    ReleaseLock(&cb_lock);
}


// This function is called for every instruction write from memory.
void VAPPMemWrite(void *ex, ADDRINT ip, ADDRINT waddr1, INT32 wsize) {
    OS_THREAD_ID tid = PIN_GetTid();

    if ( VAPPTracing  & VAPP_MEM_ACCESS  ) {
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)ip, (unsigned long int)ip, tid, 0);
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)waddr1, (unsigned long int)ip, tid, 1);
    }

    GetLock(&cb_lock, tid+1);
    VCLOCK++;
    ReleaseLock(&cb_lock);
}


// This function is called for all non memory access instructions.
// We need this function for a correct instruction cache simulation.
void VAPPInstruction(void *ex, void *ip) {
    OS_THREAD_ID tid = PIN_GetTid();

    if ( VAPPTracing  & VAPP_MEM_ACCESS ) {
        db_add_mem_access((unsigned long int)VCLOCK, (unsigned long int)ip, (unsigned long int)ip, tid, 0);
    }
    GetLock(&cb_lock, tid+1);
    VCLOCK++;
    ReleaseLock(&cb_lock);
}


void VAPPRoutineEnter(RTN rtn)
{
    if ( VAPPTracing & VAPP_FN_CALL) {
        db_add_method_call(VCLOCK, RTN_Address(rtn), 1);
    }
}

void VAPPRoutineLeave(RTN rtn)
{
    if ( VAPPTracing & VAPP_FN_CALL) {
        db_add_method_call(VCLOCK, RTN_Address(rtn), 0);
    }
}

void VAPPMalloc(RTN rtn, ADDRINT size, ADDRINT *buf)
{
    if ( VAPPTracing & VAPP_ALLOC_FREE ) {
        db_add_malloc(VCLOCK, size, (unsigned long int)buf);
    }
}

void VAPPFree(RTN rtn, ADDRINT *buf)
{
    if ( VAPPTracing & VAPP_ALLOC_FREE ) {
        db_add_free(VCLOCK, (unsigned long int)buf);
    }
}


void VAPPControlTraceOn(RTN rtn, ADDRINT param0)
{
    GetLock(&cb_lock, PIN_GetTid()+1);

    VAPPTracing = (vapp_flags_t)(VAPPTracing | param0);

    ReleaseLock(&cb_lock);
}


void VAPPControlTraceOff(RTN rtn, ADDRINT param0)
{
    GetLock(&cb_lock, PIN_GetTid()+1);

    VAPPTracing = (vapp_flags_t)(VAPPTracing & (~(param0)));

    ReleaseLock(&cb_lock);
}

void cb_init()
{
    // Initialize the pin lock
    InitLock(&cb_lock);
}


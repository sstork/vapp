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

#ifndef CALLBACKS_H
#define CALLBACKS_H

#include "pin.H"

// This function is called for every instruction reads from memory.
void VAPPMemRead(void *ex, ADDRINT ip, ADDRINT raddr1, UINT32 rsize);


// This function is called for every instruction reads from memory.
void VAPPMemRead2(void *ex, ADDRINT ip, ADDRINT raddr1, ADDRINT raddr2, UINT32 rsize);


// This function is called for every instruction write from memory.
void VAPPMemWrite(void *ex, ADDRINT ip, ADDRINT waddr1, INT32 wsize);


// This function is called for all non memory access instructions.
// We need this function for a correct instruction cache simulation.
void VAPPInstruction(void *ex, void *ip);


void VAPPImageLoad(IMG img, VOID *v);

VOID VAPPRoutine(RTN rtn, VOID *v);


#endif // 

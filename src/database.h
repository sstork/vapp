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
#ifndef DATABASE_H
#define DATABASE_H

#include "pin.H"

#include <string>

// This function must be called before any other function can be called
void db_init(std::string name);

// This function must be called before the application terminates
void db_finalize();

void db_add_image(int id, std::string name);

void db_add_method(std::string name, int image_id, unsigned long int start, unsigned long int end);

void db_add_method_call(unsigned long int vclk, unsigned long int start, char enter);

void db_add_mem_access(unsigned long int vclk, unsigned long int MemAddr, unsigned long int InstrAddr, OS_THREAD_ID tid, char Write);

void db_add_malloc(unsigned long int vclk, int size, unsigned long int address);

void db_add_free(unsigned long int vclk, unsigned long int address);


#endif // DATABASE_H

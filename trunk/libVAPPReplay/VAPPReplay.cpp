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
#include "VAPPReplay.h"
#include "Executor.h"

#include <sqlite3.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <iostream>

#include <list>

using namespace std;

static sqlite3 *db = NULL;
static list<Executor*> executors;

struct mem_stack_t {
    int count;
    struct {
        unsigned long VCLK;
        unsigned long MemAddress;
        unsigned long InstrAddress;
        unsigned int ThreadId;
        bool Write;
    } stack[4];
};


static int callback(void *vmem_stack, int argc, char **argv, char **azColName){
  mem_stack_t *mem_stack = (mem_stack_t*)vmem_stack;
  enum {
      VCLK = 0,
      MemAddress = 1,
      InstrAddress = 2,
      ThreadId = 3,
      Write = 4
  };


  if ( 0 == mem_stack->count ) {
      // add to stack and continue
      mem_stack->stack[0].VCLK = strtoll(argv[VCLK], NULL, 10);
      mem_stack->stack[0].MemAddress = strtoll(argv[MemAddress], NULL, 10);
      mem_stack->stack[0].InstrAddress = strtoll(argv[InstrAddress], NULL, 10);
      mem_stack->stack[0].ThreadId = atoi(argv[ThreadId]);
      if ( strtol(argv[Write], NULL, 10)  ) {
          mem_stack->stack[0].Write = true;
      } else {
          mem_stack->stack[0].Write = false;
      }
      mem_stack->count++;
      return 0;
  } else {
      int count = mem_stack->count;
      if ( mem_stack->stack[count-1].VCLK == (unsigned long long)strtoll(argv[VCLK], NULL, 10) ) {
          // add next part of the instruction to the stack
          mem_stack->stack[count].VCLK = strtoll(argv[VCLK], NULL, 10);
          mem_stack->stack[count].MemAddress = strtoll(argv[MemAddress], NULL, 10);
          mem_stack->stack[count].InstrAddress = strtoll(argv[InstrAddress], NULL, 10);
          mem_stack->stack[count].ThreadId = atoi(argv[ThreadId]);
          if ( strtol(argv[Write], NULL, 10)  ) {
              mem_stack->stack[count].Write = true;
          } else {
              mem_stack->stack[count].Write = false;
          }
          mem_stack->count++;
          return 0;
      } else {
          // replay old instruction

          for ( list<Executor*>::iterator it = executors.begin() ;
                it != executors.end() ;
                it++ ) {
              Executor *ex = *it;
              //ex->doReport(cout);
              switch(mem_stack->count) {
              case 1:
                  ex->instruction(mem_stack->stack[0].InstrAddress);
                  break;
              case 2:
                  if ( mem_stack->stack[1].Write ) {
                      ex->memWrite(mem_stack->stack[1].InstrAddress,
                                   mem_stack->stack[1].MemAddress,
                                   0);
                  } else {
                      ex->memRead(mem_stack->stack[1].InstrAddress,
                                  mem_stack->stack[1].MemAddress,
                                  0);
                  }
                  break;
              case 3:
                  ex->memRead(mem_stack->stack[1].InstrAddress,
                              mem_stack->stack[1].MemAddress,
                              mem_stack->stack[2].MemAddress,
                              0);
                  break;
              }
          }

          mem_stack->count = 0;

          // start adding next instruction to stack
          mem_stack->stack[0].VCLK = strtoll(argv[VCLK], NULL, 10);
          mem_stack->stack[0].MemAddress = strtoll(argv[MemAddress], NULL, 10);
          mem_stack->stack[0].InstrAddress = strtoll(argv[InstrAddress], NULL, 10);
          mem_stack->stack[0].ThreadId = atoi(argv[ThreadId]);
          if ( strtol(argv[Write], NULL, 10)  ) {
          mem_stack->stack[0].Write = true;
          } else {
              mem_stack->stack[0].Write = false;
          }
          mem_stack->count++;
          return 0;
      }
  }
  return 0;
}


bool vappr_init(std::string filename)
{
    int rc = sqlite3_open(filename.c_str(), &db);
    if ( rc != SQLITE_OK ) {
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        return false;
    }

    if ( sqlite3_exec(db, "PRAGMA synchronous=OFF", NULL, NULL, NULL) != SQLITE_OK ) {
        fprintf(stderr, "Can't execute command:  %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        exit(1);
    }

    if ( sqlite3_exec(db, "PRAGMA cache_size=1000000", NULL, NULL, NULL) != SQLITE_OK ) {
        fprintf(stderr, "Can't execute command:  %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        exit(1);
    }
    

    return true;
}

bool vappr_finalize()
{
    if ( db == NULL ) return false;
    sqlite3_close(db);
    db = NULL;

    // trigger doReport method
    for ( list<Executor*>::iterator it = executors.begin() ;
          it != executors.end() ;
          it++ ) {
        Executor *ex = *it;
        ex->doReport(cout);
    }

    return true;
}

bool vappr_add_executor(Executor* ex)
{
    if ( db == NULL ) return false;
    executors.push_back(ex);
    return true;
}

bool vappr_run_memory_accesses()
{
    char *zErrMsg = 0;
    mem_stack_t mem_stack;
    if ( db == NULL ) return false;

    memset(&mem_stack, 0x0, sizeof(mem_stack_t));

    int rc = sqlite3_exec(db, "SELECT * FROM MemoryAccesses", callback, &mem_stack, &zErrMsg);
    if( rc!=SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return false;
    }

    return true;
}

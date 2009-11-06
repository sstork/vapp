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
#include "VAPPReplay.h"
#include "Executor.h"

#include <sqlite3.h>
#include <stdio.h>
#include <string.h>

#include <list>

using namespace std;

static sqlite3 *db = NULL;
static list<Executor*> executors;

struct mem_access_t {
    unsigned long VCLK;
    unsigned long MemAddress;
    unsigned long InstrAddress;
    bool Write;
};


static int callback(void *NotUsed, int argc, char **argv, char **azColName){
  int i;
  enum {
      VCLK = 0,
      MemAddress = 1,
      InstrAddress = 2,
      Write = 3
  };

  for(i=0; i<argc; i++){
    printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
  }
  printf("\n");
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
    
    return true;
}

bool vappr_finalize()
{
    if ( db == NULL ) return false;
    sqlite3_close(db);
    db = NULL;
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
    mem_access_t mem_stack[3];
    if ( db == NULL ) return false;

    memset(mem_stack, 0x0, 3*sizeof(mem_access_t));

    int rc = sqlite3_exec(db, "SELECT * FROM MemoryAccesses", callback, 0, &zErrMsg);
    if( rc!=SQLITE_OK ){
        fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return false;
    }
    
    return true;
}

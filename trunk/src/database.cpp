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
#include "database.h"

#include <stdlib.h>
#include <stdio.h>
#include <sqlite3.h>

#include <sstream>
#include <iostream>
#include <list>

using namespace std;

static sqlite3 *db = NULL;
static list<string> db_buf;
static PIN_LOCK db_lock;  // sqlite db can only be used by one thread at a time


// This function is always inside the critical section.  It is assumed that
// the calling thread already has the db_lock
static void db_exec_direct(string cmd)
{
    if ( sqlite3_exec(db, cmd.c_str(), NULL, NULL, NULL) != SQLITE_OK ) {
        fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
        sqlite3_close(db);
        exit(1);
    }
}

static inline void db_exec(string cmd)
{
    GetLock(&db_lock, PIN_GetTid()+1);

    db_buf.push_back(cmd);

    if ( db_buf.size() >= 20000 ) {
        db_exec_direct("BEGIN;");
        for ( list<string>::iterator it = db_buf.begin() ; it != db_buf.end(); it++) {
            db_exec_direct(*it);
        }
        db_exec_direct("END;");
        db_buf.clear();
    }

    ReleaseLock(&db_lock);
}

void db_init(std::string name)
{
    // Initialize the pin lock
    InitLock(&db_lock);

    // No need to lock this code.  It executes before the call to PIN_StartProgram()
    // and is therefore single-threaded
    int rc;
    if ( NULL == db ) {
        std::string filename = name + ".vapp";
        rc = sqlite3_open(filename.c_str(), &db);
        if ( rc != SQLITE_OK ) {
            fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
            sqlite3_close(db);
            exit(1);
        }
    }

    db_exec_direct("PRAGMA synchronous=OFF");
    db_exec_direct("PRAGMA cache_size=50000");

    // create Malloc tables
    db_exec_direct("CREATE TABLE Mallocs (VCLK big int, Size int, Base big int, TID big int)");

    // create Free tables
    db_exec_direct("CREATE TABLE Frees (VCLK big int, Base big int, TID big int)");

    // create Lock tables
    db_exec_direct("CREATE TABLE Locks (VCLK big int, Lock big int, TID big int)");

    // create UnLock tables
    db_exec_direct("CREATE TABLE UnLocks (VCLK big int, Lock big int, TID big int)");

    // create Access tables
    db_exec_direct("CREATE TABLE Accesses (Start big int, End big int, TID big int, Buffer big int)");

    // create Thread tables
    db_exec_direct("CREATE TABLE Threads (Start big int, End big int, TID big int)");

}

void db_finalize()
{
    GetLock(&db_lock, PIN_GetTid()+1);

    if ( db != NULL ) {
        if ( db_buf.size() > 0 ) {
            db_exec_direct("BEGIN;");
            for ( list<string>::iterator it = db_buf.begin() ; it != db_buf.end(); it++) {
                db_exec_direct(*it);
            }
            db_exec_direct("END;");
            db_buf.clear();
        }
        sqlite3_close(db);
        db = NULL;
    }

    ReleaseLock(&db_lock);
}

void db_add_malloc(unsigned long int vclk, int size, unsigned long int base, long int tid)
{
    stringstream ss;
    ss << "INSERT INTO Mallocs VALUES(" << vclk << "," << size << "," << base << "," << tid << ")";
    db_exec(ss.str());
}

void db_add_free(unsigned long int vclk, unsigned long int base, long int tid)
{
    stringstream ss;
    ss << "INSERT INTO Frees VALUES(" << vclk << "," << base << "," << tid << ")";
    db_exec(ss.str());
}

void db_add_lock(unsigned long int vclk, unsigned long int base, long int tid)
{
    stringstream ss;
    ss << "INSERT INTO Locks VALUES(" << vclk << "," <<base << "," << tid << ")";
    db_exec(ss.str());
}

void db_add_unlock(unsigned long int vclk, unsigned long int base, long int tid)
{
    stringstream ss;
    ss << "INSERT INTO UnLocks VALUES(" << vclk << "," <<base << "," << tid << ")";
    db_exec(ss.str());
}

void db_add_thread(unsigned long int start, unsigned long int end, long int tid)
{
    stringstream ss;
    ss << "INSERT INTO Threads VALUES(" << start << "," << end << "," << tid << ")" ;
    db_exec(ss.str());
}

void db_add_access(unsigned long int start, unsigned long int end, long int tid, set<long int> &buffers)
{
    for ( set<long int>::iterator it = buffers.begin() ; it != buffers.end() ; it++ ) {
        stringstream ss;
        ss << "INSERT INTO Accesses VALUES(" << start << "," << end << "," << tid << "," << (*it) << ")";
        db_exec(ss.str());
    }    
}


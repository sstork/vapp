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
    db_buf.push_back(cmd);

    if ( db_buf.size() >= 20000 ) {
        db_exec_direct("BEGIN;");
        for ( list<string>::iterator it = db_buf.begin() ; it != db_buf.end(); it++) {
            db_exec_direct(*it);
        }
        db_exec_direct("END;");
        db_buf.clear();
    }
}


void db_init(std::string name)
{
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

    // create image tables
    db_exec_direct("CREATE TABLE Images (Id int, ImgName varchar(64))");

    // create methods tables
    db_exec_direct("CREATE TABLE Methods (MethName varchar(64), ImgId int, MethStart big int , MethEnd big int)");

    // create image tables
    db_exec_direct("CREATE TABLE Calls (VCLK big int, Method big int, Enter tiny int)");

    // create image tables
    db_exec_direct("CREATE TABLE MemoryAccesses (VCLK big int, MemAddress big int, InstrAddress big int, Write tiny int)");

    // create Malloc tables
    db_exec_direct("CREATE TABLE Mallocs (VCLK big int, Size int, Address big int)");

    // create Free tables
    db_exec_direct("CREATE TABLE Frees (VCLK big int, Address big int)");

}


void db_finalize()
{
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
}



void db_add_image(int id, string name)
{
    stringstream ss;
    ss << "INSERT INTO Images VALUES(";
    ss << id << ",\"" << name << "\")";
    db_exec(ss.str());
}

void db_add_method(std::string name , int image_id, unsigned long int start, unsigned long int end)
{
    stringstream ss;
    ss << "INSERT INTO Methods VALUES(";
    ss << "\"" << name << "\"," ;
    ss << image_id << "," << start << "," << end << ")";
    db_exec(ss.str());
}

void db_add_method_call(unsigned long int vclk, unsigned long int start, char enter)
{
    stringstream ss;
    ss << "INSERT INTO Calls VALUES(" << vclk << "," << start << "," << (int)enter << ")";
    db_exec(ss.str());
}


void db_add_mem_access(unsigned long int vclk, unsigned long int MemAddr, unsigned long int InstrAddr, char Write)
{
    stringstream ss;
    ss << "INSERT INTO MemoryAccesses VALUES(" << vclk << "," << MemAddr << "," << InstrAddr << "," << (int)Write << ")";
    db_exec(ss.str());
}


void db_add_malloc(unsigned long int vclk, int size, unsigned long int address)
{
    stringstream ss;
    ss << "INSERT INTO Mallocs VALUES(" << vclk << "," << size << "," << address << ")";
    db_exec(ss.str());
}

void db_add_free(unsigned long int vclk, unsigned long int address)
{
    stringstream ss;
    ss << "INSERT INTO Frees VALUES(" << vclk << "," << address << ")";
    db_exec(ss.str());
}

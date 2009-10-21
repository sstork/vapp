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

#include <sqlite3.h>

#include <sstream>
#include <iostream>

using namespace std;

static sqlite3 *db = NULL;


static void db_exec(string cmd)
{
    if ( sqlite3_exec(db, cmd.c_str(), NULL, NULL, NULL) != SQLITE_OK ) {
            fprintf(stderr, "Can't open database: %s\n", sqlite3_errmsg(db));
            sqlite3_close(db);
            exit(1);
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

    db_exec("PRAGMA synchronous=OFF");

    // create image tables
    db_exec("CREATE TABLE Images (Id int, ImgName varchar(64))");

    // create image tables
    db_exec("CREATE TABLE Methods (MethName varchar(64), ImgId int, MethStart big int , MethEnd big int)");
}


void db_finalize()
{
    if ( db != NULL ) {
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

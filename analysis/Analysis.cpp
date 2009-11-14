// -*- c-basic-offset : 4 -*-

#include "Analysis.h"

#include <iostream>

#include <sqlite3.h>
#include <stdlib.h>


using namespace std;

static int threads_cb(void *threadsDB, int argc, char **argv, char **azColName){
    list<Thread*> *threads = (list<Thread*>*) threadsDB;
    Thread *t = new Thread(strtol(argv[0], NULL, 10),
                          strtol(argv[1], NULL, 10),
                          strtol(argv[2], NULL, 10));
    threads->push_front(t);
    return 0;
}

static int methodcall_cb(void *methDB, int argc, char **argv, char **azColName){
    list<MethodCall*> *meths = (list<MethodCall*>*) methDB;
    MethodCall *m = new MethodCall(strtol(argv[0], NULL, 10),
                                   strtol(argv[1], NULL, 10),
                                   strtol(argv[2], NULL, 10));
    meths->push_front(m);
    return 0;
}

static int access_cb(void *accessDB, int argc, char **argv, char **azColName){
    list<Access*> *accesses = (list<Access*>*) accessDB;
    Access *a = NULL;

    for( list<Access*>::iterator it = accesses->begin() ; it != accesses->end() ; it++) {
        if ( (*it)->getStart() == strtol(argv[0], NULL, 10)  &&
             (*it)->getEnd() == strtol(argv[1], NULL, 10) &&
             (*it)->getTID() == strtol(argv[2], NULL, 10) ){
            a = *it;
        }
    }

    if ( NULL == a ) {
        a = new Access(strtol(argv[0], NULL, 10),
                       strtol(argv[1], NULL, 10),
                       strtol(argv[2], NULL, 10));
        accesses->push_front(a);
    } 
    
    a->addToBuffers(strtol(argv[3], NULL, 10));
    
    
    return 0;
}


Analysis::Analysis(std::string filename)
    : filename(filename)
{
    sqlite3 *db;
    char *zErrMsg = 0;

    int rc = sqlite3_open(filename.c_str(), &db);
    if ( rc != SQLITE_OK ) {
        cerr <<  "Can't open database: " << sqlite3_errmsg(db) << endl;
        sqlite3_close(db);
        return;
    }
    
    rc = sqlite3_exec(db, "SELECT * FROM Threads", threads_cb, &this->threads, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
  
    rc = sqlite3_exec(db, "SELECT * FROM Mallocs", methodcall_cb, &this->mallocs, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }

    rc = sqlite3_exec(db, "SELECT * FROM Frees", methodcall_cb, &this->frees, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
  
    rc = sqlite3_exec(db, "SELECT * FROM Locks", methodcall_cb, &this->locks, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
  
    rc = sqlite3_exec(db, "SELECT * FROM UnLocks", methodcall_cb, &this->unlocks, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
  
    rc = sqlite3_exec(db, "SELECT * FROM Accesses", access_cb, &this->accesses, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
        
    sqlite3_close(db);
}

Analysis::~Analysis()
{}

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
                                   atoll(argv[1]),
                                   strtol(argv[2], NULL, 10));
    meths->push_front(m);

    return 0;
}

// Doesn't store the size
static int malloc_cb(void *methDB, int argc, char **argv, char **azColName){
    list<MethodCall*> *meths = (list<MethodCall*>*) methDB;
    MethodCall *m = new MethodCall(strtol(argv[0], NULL, 10),
                                   strtol(argv[2], NULL, 10),
                                   strtol(argv[3], NULL, 10));
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

    rc = sqlite3_exec(db, "SELECT * FROM Mallocs", malloc_cb, &this->mallocs, &zErrMsg);
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

    // After the list of lock and unlock calls are stored, populate the list
    // of periods when a lock is held and which lock holds it.
    initLockPeriods();
}

Analysis::~Analysis()
{}

void Analysis::initLockPeriods(){
    // Assume that every lock is later unlocked by the same thread
    // before that thread calls lock again using the same lock
    for(list<MethodCall*>::iterator itLock = (&this->locks)->begin();
        itLock != (&this->locks)->end(); itLock++) {
            long int start = (*itLock)->getVClk();
            long long lock = (*itLock)->getBase();
            long int tid = (*itLock)->getTID();
            long int end = LONG_MAX;

        // Search all unlock calls to find the one for this thread and lock
        // that occurred soonest after the lock call
        for(list<MethodCall*>::iterator itUnlock = (&this->unlocks)->begin();
            itUnlock != (&this->unlocks)->end(); itUnlock++) {
                if((*itUnlock)->getBase() == lock && (*itUnlock)->getTID() == tid &&
                    (*itUnlock)->getVClk() >= start && (*itUnlock)->getVClk() < end) {
                    end = (*itUnlock)->getVClk();
                }
        }
        LockHeld *p = new LockHeld(start, end, lock, tid);
        (&this->lockPeriods)->push_front(p);
    }
}

void Analysis::calcBufferStats(){
    // Store the set of all locks used by any thread in the application
    set<long long> allLocks;
    for(list<MethodCall*>::iterator it = (&this->locks)->begin(); it != (&this->locks)->end(); it++) {
        allLocks.insert((*it)->getBase());
    }

// Test lockset
/*
    cout << "Distinct locks: " << allLocks.size() << endl;
    for(set<long long>::iterator it = allLocks.begin(); it != allLocks.end(); it++) {
        cout << (*it) << endl;
    }

    set<long long> def;
    def.insert(1);
    def.insert(2);
    def.insert(3);
    Buffer *b1 = new Buffer(1, 1, def);
    Buffer *b2 = new Buffer(2, 2, def);

    set<long long> test;
    test.insert(2);
    test.insert(1);
    cout << b1->toString() << endl;
    b1->updateLockset(test);
    cout << b1->toString() << endl;
    b1->setEnd(20000);
    cout << b1->toString() << endl;

    test.clear();
    b2->updateLockset(test);
    cout << b2->toString() << endl;
*/


    // Create a lockset for each buffer allocated
    for(list<MethodCall*>::iterator it = (&this->mallocs)->begin(); it != (&this->mallocs)->end(); it++) {
        Buffer *b = new Buffer((*it)->getVClk(), (*it)->getBase(), allLocks);
        (&this->buffers)->push_front(b);
    }

    // Set the time the buffer is free if it is freed at all
    // Need to find the Buffer that is allocated most recently before
    // the free that has the same base
    for(list<MethodCall*>::iterator it = (&this->frees)->begin(); it != (&this->frees)->end(); it++) {
        long int vclk = (*it)->getVClk();
        long long base = (*it)->getBase();
        Buffer *mostRecent = NULL;

        for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
            itBuf != (&this->buffers)->end(); itBuf++) {
            // Make sure the Buffer has the same base and was allocated before the free
            if((*itBuf)->getBase() == base && (*itBuf)->getStart() < vclk) {
                // If this is the first Buffer with the same base, it is paired with the free
                if(mostRecent == NULL) {
                    mostRecent = *itBuf;
                }
                // Check if we found a Buffer with the same base that was allocated after
                // the Buffer we currently have paired with the free
                else if(mostRecent->getStart() < (*itBuf)->getStart()) {
                    mostRecent = *itBuf;
                }
            }
        }

        mostRecent->setEnd(vclk);
    }

/*
    for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
        itBuf != (&this->buffers)->end(); itBuf++) {
        cout << (*itBuf)->longToString() << endl;
    }
*/


    // Step through the execution (accesses)
    for(list<Access*>::iterator it = (&this->accesses)->begin();
        it != (&this->accesses)->end(); it++) {

        // Calculate the set of locks held during each access
        set<long long> held;
        for(list<LockHeld*>::iterator itLock = (&this->lockPeriods)->begin();
            itLock != (&this->lockPeriods)->end(); itLock++) {
            if((*it)->isLockHeld(*itLock)) {
                held.insert((*itLock)->getLock());
            }
        }

        // Determine which Buffers were a part of this access
        // and update their locksets
        int tid = (*it)->getTID();
        for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
            itBuf != (&this->buffers)->end(); itBuf++) {
            // Only an active Buffer (one that has been allocated and not yet freed)
            // is of interest for this Access
            if((*itBuf)->isActive((*it)->getStart()) && (*itBuf)->isActive((*it)->getEnd())) {
                for(list<long int>::iterator itAccBuf = ((*it)->getBuffers()).begin();
                    itAccBuf != ((*it)->getBuffers()).end(); itAccBuf++) {
                    // Check if the Buffer has the same base as the item in the list of accessed buffers
                    // in the Access
                    if((*itAccBuf) == (*itBuf)->getBase()) {
                        (*itBuf)->updateLockset(held);
                        (*itBuf)->addThread(tid);
                    }
                }
            }
        }
    }

/*
    for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
        itBuf != (&this->buffers)->end(); itBuf++) {
        cout << (*itBuf)->longToString() << endl;
    }
*/
}

// Display those Buffers that are never accessed during program execution
void Analysis::reportUnaccessed() {
    cout << "Unaccessed Buffers:" << endl;
    for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
        itBuf != (&this->buffers)->end(); itBuf++) {
        if((*itBuf)->numThreads() == 0) {
            cout << (*itBuf)->toString() << endl;
        }
    }
    cout << endl;
}

// Display those Buffers that are only accessed by one thread during program execution
void Analysis::reportUnshared() {
    cout << "Unshared Buffers:" << endl;
    for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
        itBuf != (&this->buffers)->end(); itBuf++) {
        if((*itBuf)->numThreads() == 1) {
            cout << (*itBuf)->toString() << endl;
        }
    }
    cout << endl;
}

// Display those Buffers that are not correctly protected by locks
// (their lockset is empty)
void Analysis::reportUnprotected() {
    cout << "Unprotected Buffers:" << endl;
    for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
        itBuf != (&this->buffers)->end(); itBuf++) {
        if(!(*itBuf)->isProtected()) {
            cout << (*itBuf)->toString() << endl;
        }
    }
    cout << endl;
}

// Display those Buffers that are not freed
void Analysis::reportUnfreed() {
    cout << "Unfreed Buffers:" << endl;
    for(list<Buffer*>::iterator itBuf = (&this->buffers)->begin();
        itBuf != (&this->buffers)->end(); itBuf++) {
        if(!(*itBuf)->wasFreed()) {
            cout << (*itBuf)->toString() << endl;
        }
    }
    cout << endl;
}

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

static bool comp_method_calls(MethodCall *a, MethodCall *b)
{
    return a->getVClk() < b->getVClk() ;
}

static bool comp_accesses(Access *a, Access *b)
{
    return a->getStart() < b->getStart() ;
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
    mallocs.sort(comp_method_calls);

    rc = sqlite3_exec(db, "SELECT * FROM Frees", methodcall_cb, &this->frees, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
    frees.sort(comp_method_calls);

    rc = sqlite3_exec(db, "SELECT * FROM Locks", methodcall_cb, &this->locks, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
    locks.sort(comp_method_calls);

    rc = sqlite3_exec(db, "SELECT * FROM UnLocks", methodcall_cb, &this->unlocks, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
    unlocks.sort(comp_method_calls);

    rc = sqlite3_exec(db, "SELECT * FROM Accesses", access_cb, &this->accesses, &zErrMsg);
    if( rc!=SQLITE_OK ){
        cerr <<  "SQL error: %s\n" << zErrMsg << endl;
        sqlite3_free(zErrMsg);
        return;
    }
    accesses.sort(comp_accesses);

    sqlite3_close(db);
}

Analysis::~Analysis()
{}



void Analysis::compute()
{
    cout << "== REPLAY =============================================" << endl;
    for ( list<Thread*>::iterator tit = threads.begin() ; tit != threads.end() ; tit++ ) {
        list<MethodCall*>::iterator lit = locks.begin();
        list<MethodCall*>::iterator unlit = unlocks.begin();
        list<Access*>::iterator ait = accesses.begin();
        Thread *t = *tit;
        
        cout << "replay thread " << t->getId() << endl;

        while ( lit != locks.end() && unlit != unlocks.end() && ait != accesses.end() ) {
            cout << " thread lockset -> " << t->toStringLockSet() << endl;
            switch ( getNextStep(lit, unlit, ait, t->getId() ) ) {
            case NONE:
                cout << "finished replay for thread " << t->getId() << endl;
                break;
            case LOCK:
                t->addToLockSet((*lit)->getBase());
                cout << "LOCK "  << (*lit)->getBase() << " @ " << (*lit)->getVClk() << " -> " << t->toStringLockSet()  << endl;
                lit++;
                break;
            case UNLOCK:
                t->delFromLockSet((*unlit)->getBase());
                cout << "UNLOCK " << (*unlit)->getBase() <<  " @ " << (*unlit)->getVClk() << " -> " << t->toStringLockSet()  << endl;
                unlit++;
                break;
            case ACCESS:
                Access *access = *ait;
                //cout << "ACCESS @ " << (*ait)->getStart() << endl;
                for ( list<long int>::iterator bit = (access->getBuffers()).begin() ; bit != (access->getBuffers()).end() ; bit++ ) {
                    Buffer *b = t->getBuffer(*bit);
                    if ( b->isAccessed() == false ) {
                        b->setLockSet(t->getLockSet());
                    } else {
                        b->intersectLockSet(t->getLockSet());
                        b->addAlllocks(t->getLockSet());
                    }
                    cout << " buffer " << b->getStart() << " lockset -> " << b->toStringLockSet() << endl;
                    cout << " buffer " << b->getStart() << " allocks -> " << b->toStringAlllocks() << endl;
                }
                ait++;
                break;
            }
        }
    }
}




void Analysis::analyse() {
    cout << "== ANALYSE ============================================" << endl;

    Thread* t[threads.size()];
    int i = 0;
    for ( list<Thread*>::iterator it = threads.begin() ; it != threads.end() ; it++ ) {
        t[i] = *it;
        i++;
    }

    for ( unsigned int x = 0; x < threads.size()-1; x++ ) {
        for ( unsigned int y = x+1; y < threads.size(); y++ ) {
            Thread *t1 = t[x];
            Thread *t2 = t[y];
            list<Buffer*> result;

            cout << "Thread " << x << " -> " << t1->toStringBuffers() << endl; 
            cout << "Thread " << y << " -> " << t2->toStringBuffers() << endl; 
            
            set_intersection(t1->getBuffers().begin(), t1->getBuffers().end(),
                             t2->getBuffers().begin(), t2->getBuffers().end(),
                             inserter(result, result.begin()),
                             comp_buffer);
            
            for ( list<Buffer*>::iterator it = result.begin() ; it != result.end() ; it++ ) {
                Buffer *b1 = t1->getBuffer((*it)->getStart());
                Buffer *b2 = t2->getBuffer((*it)->getStart());
                
                cout << "shared buffer " << b1->getStart() << endl; 
                // cout << "  t1 " << b1->toStringAlllocks() <<endl;
                // cout << "  t2 " << b2->toStringAlllocks() <<endl;
                cout << "  t1 " << b1->toStringLockSet() <<endl;
                cout << "  t2 " << b2->toStringLockSet() <<endl;

                // if ( b1->getLockSet().size() == 0 || b2->getLockSet().size() == 0 ) {
                    
                // } else {
                //     // compare if the lock set are the same
                //     if ( b1->getLockSet().size() ==  b2->getLockSet().size()  ) {
                //         list<Buffer*> comp;
                //         set_intersection(t1->getBuffers().begin(), t1->getBuffers().end(),
                //              t2->getBuffers().begin(), t2->getBuffers().end(),
                //              inserter(comp, comp.begin()),
                //              comp_buffer);
                //         if ( comp.size() != 0 ) {
                //         }
                //     } else {
                    
                //     }
                // }
            }
        }
    }
}



Analysis::step Analysis::getNextStep(list<MethodCall*>::iterator &lit, 
                                     list<MethodCall*>::iterator &unlit, 
                                     list<Access*>::iterator &ait,
                                     long int tid)
{
    long int vclk = LONG_MAX;
    Analysis::step next_step = NONE;
    
    if ( lit != locks.end() ) {
        while ( lit != locks.end() && (*lit)->getTID() != tid ) lit++;
        if ( lit != locks.end() ) {
            vclk = (*lit)->getVClk(); 
            next_step = LOCK;
        }
    }
    
    if ( unlit != unlocks.end() ) {
        while ( unlit != unlocks.end() && (*unlit)->getTID() != tid ) unlit++;
        if ( unlit != unlocks.end() && (*unlit)->getVClk() < vclk ) {
            vclk = (*unlit)->getVClk(); 
            next_step = UNLOCK;
        }
    }

    if ( ait != accesses.end() ) {
        while ( ait != accesses.end() && (*ait)->getTID() != tid ) {
            ait++;
        }
        if ( ait != accesses.end() && (*ait)->getStart() < vclk ) {
            vclk = (*ait)->getStart(); 
            next_step = ACCESS;
        }
    }
    
    return next_step;;
}

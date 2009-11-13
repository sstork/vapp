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

#include "callbacks.h"
#include "database.h"

#include <stdlib.h>
#include <libgen.h>


#include <sstream>
#include <string>
#include <iostream>
#include <list>
#include <set>

using namespace std;


class buffer_t
{
public:
    long int vclk;
    char* base;
    int size;
    ADDRINT tid;

    buffer_t(long int vclk, char *base, int size, ADDRINT tid) 
        : vclk(vclk), base(base), size(size), tid(tid)
    {}
    
    bool contains(void *addr) 
    {
        if ( base <= addr && addr < (base+size) ) {
            return true;
        } else {
            return false;
        }
    }

    string toString() {
        stringstream ss;
        ss << "buffer(" << vclk << "," << (void*)base << "," <<  size << "," << tid << ")";
        return ss.str();
    }
    
};


static long int VCLOCK = 0;
static PIN_LOCK vapp_lock;
static TLS_KEY tls_key;
static list<buffer_t*> vapp_buffers;

class thread_data_t
{
public:
    long int start;

    pthread_mutex_t *lock;
    bool inLock;    
    bool inTryLock;
    
    bool inMalloc;
    int mallocSize;

    volatile bool checkAccess;
    long int epoch_start;
    set<long int> buffers;

    
    thread_data_t(long int start) :
        start(start),lock(NULL), inLock(false), inTryLock(false),
        inMalloc(false), mallocSize(0), checkAccess(true), epoch_start(start)
    {}

    void reset(long int start) {
        epoch_start = start;
        buffers.clear();
    }

    void enterMalloc(int size) {
        mallocSize = size;
        inMalloc = true;
        checkAccess = false;
    }

    void leaveMalloc() {
        mallocSize = 0;
        inMalloc = false;
        checkAccess = true;
    }

    void enterLock(pthread_mutex_t *l) {
        lock = l;
        inLock = true;
        checkAccess = false;
    }

    void leaveLock() {
        inLock = false;;
        checkAccess = true;
    }

    void enterUnLock(pthread_mutex_t *l) {
        lock = l;
        inLock = true;
        checkAccess = false;
    }

    void leaveUnLock() {
        inLock = false;;
        checkAccess = true;
    }

};


// function to access thread-specific data
static thread_data_t* get_tls(THREADID threadid)
{
    thread_data_t* tdata = 
          static_cast<thread_data_t*>(PIN_GetThreadData(tls_key, threadid));
    return tdata;
}

static void add_new_buffer(void *buf, int size, ADDRINT tid) 
{
    GetLock(&vapp_lock, tid+1);
    buffer_t * b = new buffer_t(VCLOCK, (char*)buf, size, tid);
    vapp_buffers.push_front(b);
    
    ReleaseLock(&vapp_lock);
}

static void* addr_in_buffer(void *addr, ADDRINT tid)
{
    void *buf = NULL;
    GetLock(&vapp_lock, tid+1);
    for ( list<buffer_t*>::iterator it = vapp_buffers.begin();
          it != vapp_buffers.end(); it++ ) {
        if ( (*it)->contains(addr) ) {
            buf = (*it)->base;
        }
    }          
    ReleaseLock(&vapp_lock);
    return buf;
}

static inline long int getClk() {
    return VCLOCK;
}

static inline void incrClk() {
    GetLock(&vapp_lock, -1);
    VCLOCK++;
    ReleaseLock(&vapp_lock);
}


// This function is called for every instruction reads from memory.
void VAPPMemRead(void *ex, ADDRINT ip, ADDRINT raddr1, UINT32 rsize, ADDRINT tid) {
    thread_data_t *tdata = get_tls(tid);
    //long int vclk = getClk();

    if ( tdata->checkAccess ) {
        void * base =  addr_in_buffer((void*)raddr1, tid);
        if ( NULL != base ) {
            //cout << (void*) ip << " MemRead access to " << base << " from thread " << tid << endl;
            tdata->buffers.insert((long int)base);
        }
    }

    incrClk();
}

// This function is called for every instruction reads from memory.
void VAPPMemRead2(void *ex, ADDRINT ip, ADDRINT raddr1, ADDRINT raddr2, UINT32 rsize, ADDRINT tid) {
    thread_data_t *tdata = get_tls(tid);
    //long int vclk = getClk();

    if ( tdata->checkAccess ) {
        void * base =  addr_in_buffer((void*)raddr1, tid);
        if ( NULL != base ) {
            //cout << (void*) ip << " MemRead2 access to " << base << " from thread " << tid << endl;
            tdata->buffers.insert((long int)base);
        }
        base =  addr_in_buffer((void*)raddr2, tid);
        if ( NULL != base ) {
            //cout << (void*) ip << " MemRead2 access to " << base << " from thread " << tid << endl;
            tdata->buffers.insert((long int)base);
        }
    }

    incrClk();
}

// This function is called for every instruction write from memory.
void VAPPMemWrite(void *ex, ADDRINT ip, ADDRINT waddr1, INT32 wsize, ADDRINT tid) {
    thread_data_t *tdata = get_tls(tid);

    if ( tdata->checkAccess ) {
        void * base =  addr_in_buffer((void*)waddr1, tid);
        // //long int vclk = getClk();
        if ( NULL != base ) {
            //cout << (void*) ip << " MemWrite access to " << base << " from thread " << tid << endl;
            tdata->buffers.insert((long int)base);
        }
    }
    incrClk();
}

// This function is called for all non memory access instructions.
// We need this function for a correct instruction cache simulation.
void VAPPInstruction(void *ex, void *ip, ADDRINT tid) {
    incrClk();
}

void VAPPMallocEnter(RTN rtn, ADDRINT size, ADDRINT tid)
{
    //cout << "malloc(" << size << ") @ " << tid << endl;
    thread_data_t *tdata = get_tls(tid);
    tdata->enterMalloc(size);    
}

void VAPPMallocLeave(RTN rtn, ADDRINT result, ADDRINT tid)
{
    //cout << (void*)result << endl;
    thread_data_t *tdata = get_tls(tid);
    if ( result != 0 ) {
        //cout << "malloc(" << tdata->mallocSize << ") = " << (void*)result << " @ " << tid << endl;
        add_new_buffer((void*)result, tdata->mallocSize, tid);
        db_add_malloc(getClk(), tdata->mallocSize, result, tid);
    }
    tdata->leaveMalloc();
}

void VAPPFree(RTN rtn, ADDRINT buf, ADDRINT tid)
{
    //cout << "free(" << (void*)buf << ") @ " << tid  << endl;
    db_add_free(getClk(), buf, tid);
}

void VAPPLockEnter(RTN rtn, ADDRINT lock, ADDRINT tid) 
{
    //cout << " pthread_mutex_lock("  << (void*)lock << ") = @ " << tid << endl;
    thread_data_t *tdata = get_tls(tid);
    tdata->enterLock((pthread_mutex_t*)lock);
}

void VAPPLockLeave(RTN rtn, ADDRINT result, ADDRINT tid) 
{
    //cout << "  leave lock " << result << " @ " << tid << endl;
    thread_data_t *tdata = get_tls(tid);
    db_add_access(tdata->epoch_start, getClk(), tid, tdata->buffers);
    db_add_lock(getClk(), (long int)tdata->lock, tid);
    tdata->leaveLock();
    tdata->reset(getClk());
}

void VAPPUnLockEnter(RTN rtn, ADDRINT lock, ADDRINT tid) 
{
    //cout << "pthread_mutex_unlock("  << (void*)lock << ") = @ " << tid << endl;
    thread_data_t *tdata = get_tls(tid);
    tdata->enterUnLock((pthread_mutex_t*)lock);
}

void VAPPUnLockLeave(RTN rtn, ADDRINT result, ADDRINT tid) 
{
    //cout << "   " << result << " @ " << tid << endl;
    thread_data_t *tdata = get_tls(tid);
    db_add_access(tdata->epoch_start, getClk(), tid, tdata->buffers);
    db_add_unlock(getClk(), (long int)tdata->lock, tid);
    tdata->leaveUnLock();
    tdata->reset(getClk());
}

void VAPPThreadStart(THREADID threadid, CONTEXT *ctxt, INT32 flags, VOID *v)
{
    //cout << "start thread " << threadid << endl;
    thread_data_t *tdata = new thread_data_t(getClk());
    PIN_SetThreadData(tls_key, tdata, threadid);
}

void VAPPThreadStop(THREADID threadid, const CONTEXT *ctxt, INT32 flags, VOID *v)
{
    //cout << "stop thread " << threadid << endl;
    thread_data_t *tdata = get_tls(threadid);

    db_add_access(tdata->epoch_start, getClk(), threadid, tdata->buffers);
    db_add_thread(tdata->start, getClk(), threadid);
   
    delete tdata;
}

void VAPPInit() {
    InitLock(&vapp_lock);

    // Obtain  a key for TLS storage.
    tls_key = PIN_CreateThreadDataKey(0);
}

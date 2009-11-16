// -*- c-basic-offset : 4 -*-

#ifndef ANALYSIS_H
#define ANALYSIS_H

#include <sstream>
#include <string>
#include <list>
#include <set>
#include "limits.h"

class Thread {
 public:
    Thread(long int start, long int end, long int id)
        : start(start), end(end), id(id) {}

    long int getId() { return id; }
    long int getStart() { return start; }
    long int getEnd() { return end; }

    std::string toString() {
        std::stringstream ss;
        ss << "Thread<" << start << "," << end << "," << id << ">";
        return ss.str();
    }
 protected:
    long int start;
    long int end;
    long int id;
};

class MethodCall {
 public:
    MethodCall(long int vclk, long long base, long int tid)
        : vclk(vclk), base(base), tid(tid) {}

    long int getVClk() { return vclk; }
    long long getBase() { return base; }
    long int getTID()  { return tid; }

    std::string toString(std::string name) {
        std::stringstream ss;
        ss <<  name << "<" << vclk << "," << base << "," << tid << ">";
        return ss.str();
    }
 protected:
    long int vclk;
    long long base;
    long int tid;
};

class LockHeld {
 public:
    LockHeld (long int start, long int end, long long lock, long int tid)
        : start(start), end(end), lock(lock), tid(tid) {}

    long int getStart() { return start; }
    long int getEnd()   { return end; }
    long long getLock() { return lock; }
    long int getTID()   { return tid; }

    std::string toString() {
        std::stringstream ss;
        ss <<  "LockHeld<" << start << "," << end << "," << lock << "," << tid << ">";
        return ss.str();
    }

 protected:
    long int start;
    long int end;
    long long lock;
    long int tid;

};

class Buffer {
 public:
    Buffer (long int start, long int base, std::set<long long> allLocks)
        : start(start), end(LONG_MAX), base(base), freed(false) {
            setLockset(allLocks);
        }

    long int getStart() { return start; }
    long int getEnd() { return end; }
    long long getBase() { return base; }
    bool wasFreed() { return freed; }
    std::set<long long>& getLockset()  { return lockset; }
    std::set<long int>& getThreads() { return threads; }

    void setEnd(long int newEnd) { end = newEnd; freed = true; }

    void addThread(long int tid) { threads.insert(tid); }

    int numThreads() { return threads.size(); }

    // Set intersection with current lockset
    void updateLockset(std::set<long long> heldLocks) {
        std::set<long long> result;
        set_intersection(lockset.begin(), lockset.end(),
            heldLocks.begin(), heldLocks.end(),
            inserter(result, result.begin()));

        setLockset(result);
    }


    // Used to distinguish which Buffer is being protected
    // if the same base is assigned to multiple Buffers during
    // calls to malloc
    bool isActive(long int vclk) {
        if(start <= vclk && end > vclk) {
            return true;
        }
        else {
            return false;
        }
    }

    bool isProtected() {
        if(lockset.size() > 0) {
            return true;
        }
        else {
            return false;
        }
    }

    std::string toString() {
        std::stringstream ss;
        ss <<  "Buffer<" << start << "," << base << ">";
        return ss.str();
    }

    std::string longToString() {
        std::stringstream ss;
        ss <<  "Buffer<" << start << "," << end << "," << base  << ",[";
        for( std::set<long long>::iterator it = lockset.begin() ; it != lockset.end() ; it++) {
            ss << *it << ",";
        }
        if(lockset.size() > 0){
            ss << "\b";
        }
        ss << "],[";
        for( std::set<long int>::iterator it = threads.begin() ; it != threads.end() ; it++) {
            ss << *it << ",";
        }
        if(threads.size() > 0){
            ss << "\b";
        }
        ss << "]>";
        return ss.str();
    }

 protected:
    long int start;
    long int end;
    long int base;
    bool freed;
    std::set<long long> lockset;
    std::set<long int> threads;

    void setLockset(std::set<long long> allLocks) {
        lockset.clear();
        lockset.insert(allLocks.begin(), allLocks.end());
    }
};

class Access {
 public:
    Access(long int start, long int end, long int tid)
        : start(start), end(end), tid(tid) {}

    long int getStart() { return start; }
    long int getEnd()   { return end; }
    long int getTID()   { return tid; }
    std::list<long int>& getBuffers() { return buffers; }

    void addToBuffers(long int buffer) { buffers.push_back(buffer); }

    std::string toString() {
        std::stringstream ss;
        ss <<  "Access<" << start << "," << end << "," << tid << ",[";
        for( std::list<long int>::iterator it = buffers.begin() ; it != buffers.end() ; it++) {
            ss << *it << ",";
        }
        ss << "\b]>";
        return ss.str();
    }

    bool isLockHeld(LockHeld *lock) {
        if(lock->getTID() == tid && lock->getStart() <= start && lock->getEnd() >= end) {
            return true;
        }
        else {
            return false;
        }
    }

 protected:
    long int start;
    long int end;
    long int tid;
    std::list<long int> buffers;
};

class Analysis {
 public:
    Analysis(std::string filename);
    virtual ~Analysis();
    void calcBufferStats();
    void reportUnaccessed();
    void reportUnshared();
    void reportUnprotected();
    void reportUnfreed();

 protected:
    std::string filename;
    std::list<Thread*> threads;
    std::list<MethodCall*> mallocs;
    std::list<MethodCall*> frees;
    std::list<MethodCall*> locks;
    std::list<MethodCall*> unlocks;
    std::list<Access*> accesses;
    std::list<LockHeld*> lockPeriods;
    std::list<Buffer*> buffers;
    void initLockPeriods();
};

#endif /* ANALYSIS_H */

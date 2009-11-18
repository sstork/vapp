// -*- c-basic-offset : 4 -*-

#ifndef ANALYSIS_H
#define ANALYSIS_H

#include <sstream>
#include <string>
#include <list>
#include <algorithm>
#include <set>
#include "limits.h"

#include <iostream>

class Buffer;

inline static bool comp_buffer(Buffer *a, Buffer *b);


class Buffer {
 public:
   Buffer(long int start )
       : start(start), accessed(false) {};
    
    bool isAccessed() { return accessed; }
    void setAccessed() { accessed = true; }

    long int getStart() { return start; }

    
    void setLockSet(std::list<long int> lset) { 
        lset.sort();
        lockset = lset;  
        alllocks = lset;
        setAccessed();
    }
    std::list<long int>& getLockSet() { return lockset; }
    
    void intersectLockSet(std::list<long int> lset) {
        std::list<long int> result;
        set_intersection(lset.begin(), lset.end(),
                         lockset.begin(), lockset.end(),
                         inserter(result, result.begin()) );
        lockset = result;
        lockset.sort();
    }


    void addAlllocks(std::list<long int> lset) {
        alllocks.insert(alllocks.begin(), lset.begin(), lset.end());
    }
    std::list<long int>& getAlllocks() { return alllocks; }
    
    std::string toStringLockSet() {
        std::stringstream ss;
        if ( lockset.size() != 0 ) {
            ss <<  "[";
            for( std::list<long int>::iterator it = lockset.begin() ; it != lockset.end() ; it++) {
            ss << *it << ",";
            }
            ss << "\b]>";
        } else {
            ss << "[]";
        }
        return ss.str();        
    }

    std::string toStringAlllocks() {
        std::stringstream ss;
        if ( alllocks.size() != 0 ) {
            ss <<  "[";
            for( std::list<long int>::iterator it = alllocks.begin() ; it != alllocks.end() ; it++) {
            ss << *it << ",";
            }
            ss << "\b]>";
        } else {
            ss << "[]";
        }
        return ss.str();
        
    }


 protected:
    long int start;
    bool accessed;
    std::list<long int> lockset;
    std::list<long int> alllocks;
};

inline static bool comp_buffer(Buffer *a, Buffer *b) {
    return a->getStart() < b->getStart();
}


class Thread {
 public:
    Thread(long int start, long int end, long int id)
        : start(start), end(end), id(id) {}

    long int getId() { return id; }
    long int getStart() { return start; }
    long int getEnd() { return end; }

    void addToLockSet(long int lock) { 
        lockset.push_front(lock);
        lockset.sort();
    }
    void delFromLockSet(long int lock) { 
        lockset.remove(lock);
        lockset.sort();
    }
    std::list<long int>& getLockSet() { return lockset; }

    std::string toStringLockSet() {
        std::stringstream ss;
        if ( lockset.size() != 0 ) {
            ss <<  "[";
            for( std::list<long int>::iterator it = lockset.begin() ; it != lockset.end() ; it++) {
                ss << *it << ",";
            }
            ss << "\b]>";
        } else {
            ss << "[]";
        }
        return ss.str();
    }

    std::string toStringBuffers() {
        std::stringstream ss;
        if ( buffers.size() != 0 ) {
            ss <<  "[";
            for( std::list<Buffer*>::iterator it = buffers.begin() ; it != buffers.end() ; it++) {
                ss << (*it)->getStart() << ",";
            }
            ss << "\b]>";
        } else {
            ss << "[]";
        }
        return ss.str();
    }


    Buffer* getBuffer(long int start) {
        Buffer *b = NULL;
        for ( std::list<Buffer*>::iterator it = buffers.begin() ; it != buffers.end() ; it++ ) {
            if ( (*it)->getStart() == start ) {
                b = *it;
            }
        }
        if ( NULL == b ) {
            b = new Buffer(start);
            buffers.push_front(b);
            buffers.sort(comp_buffer);
        }
        
        return b;
    }

    std::list<Buffer*>& getBuffers() {
        return buffers;
    }

    std::string toString() {
        std::stringstream ss;
        ss << "Thread<" << start << "," << end << "," << id << ">";
        return ss.str();
    }
 protected:
    long int start;
    long int end;
    long int id;
    std::list<long int> lockset;
    std::list<Buffer*> buffers;
};

class MethodCall {
 public:
    MethodCall(long int vclk, long long base, long int tid)
        : vclk(vclk), base(base), tid(tid) {}

    long int getVClk() { return vclk; }
    long int getBase() { return base; }
    long int getTID()  { return tid; }

    std::string toString(std::string name) {
        std::stringstream ss;
        ss <<  name << "<" << vclk << "," << base << "," << tid << ">";
        return ss.str();
    }
 protected:
    long int vclk;
    long int base;
    long int tid;
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

 protected:
    long int start;
    long int end;
    long int tid;
    std::list<long int>buffers;
};

class Analysis {

 public:
    Analysis(std::string filename);
    virtual ~Analysis();

    void compute();
    void analyse();

    enum step {NONE, LOCK,UNLOCK,ACCESS};
 protected:
    std::string filename;
    std::list<Thread*> threads;
    std::list<MethodCall*> mallocs;
    std::list<MethodCall*> frees;
    std::list<MethodCall*> locks;
    std::list<MethodCall*> unlocks;
    std::list<Access*> accesses;


    Analysis::step getNextStep(std::list<MethodCall*>::iterator &locks, 
                               std::list<MethodCall*>::iterator &unlocks, 
                               std::list<Access*>::iterator &accesses,
                               long int tid);
};

#endif /* ANALYSIS_H */

// -*- c-basic-offset : 4 -*-

#ifndef ANALYSIS_H
#define ANALYSIS_H

#include <sstream>
#include <string>
#include <list>

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
    MethodCall(long int vclk, long int base, long int tid)
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
    std::list<long int> buffers;
};

class Analysis {
 public:
    Analysis(std::string filename);
    virtual ~Analysis();

 protected:
    std::string filename;
    std::list<Thread*> threads;
    std::list<MethodCall*> mallocs;
    std::list<MethodCall*> frees;
    std::list<MethodCall*> locks;
    std::list<MethodCall*> unlocks;
    std::list<Access*> accesses;
};

#endif /* ANALYSIS_H */

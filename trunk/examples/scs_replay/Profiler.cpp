// -*- Mode : C++ ; c-basic-offset : 4 -*- 

#include "Profiler.h"

#include <list>
#include <iomanip>

using namespace std;


void Profiler::addToRead(long ip, long cacheHits, long cacheMisses, long missCycles)
{
    Entry *e = database[ip];
    if ( NULL == e ) {
        // create a new one 
        e = new Entry(ip);
        database[ip] = e;
    }
    
    e->addToReadCacheHits(cacheHits);
    e->addToReadCacheMisses(cacheMisses);
    e->addToReadMissCycles(missCycles);
}

void Profiler::addToWrite(long ip, long cacheHits, long cacheMisses, long missCycles)
{
    Entry *e = database[ip];
    if ( NULL == e ) {
        // create a new one 
        e = new Entry(ip);
        database[ip] = e;
    }
    
    e->addToWriteCacheHits(cacheHits);
    e->addToWriteCacheMisses(cacheMisses);    
    e->addToWriteMissCycles(missCycles);
}


void Profiler::addToUsage(long ip, long value)
{
    Entry *e = database[ip];
    if ( NULL == e ) {
        // create a new one 
        e = new Entry(ip);
        database[ip] = e;
    }
    e->addToUsage(1);
}

inline long MAX(long a, long b) {
    if ( a < b ) {
        return b;
    }{
        return a;
    }
}

// first < second ???
static bool compare_entries_total_misses(Entry* first, Entry* second) {
    long first_count  = 0;
    long second_count = 0;
    
    first_count = MAX(first->getReadCacheMisses(), first->getWriteCacheMisses());
    second_count = MAX(second->getReadCacheMisses(),second->getWriteCacheMisses());

    if ( first_count > second_count ) {
        return true;
    }
    
    return false;
}

long Profiler::getTotalStallCycles()
{
    long totalStallCycles = 0;

    for( map<long, Entry*>::iterator it = database.begin() ; it != database.end() ;  ++it ) {
        Entry *e = (*it).second;

        // compute total values
        totalStallCycles  += e->getReadMissCycles();
        totalStallCycles += e->getWriteMissCycles();
    }

    return totalStallCycles;
}



void Profiler::doReport(std::ostream &report)
{
    list<Entry*> entries;
    long totalMemOperations = 0;
    long totalReadMisses = 0;
    long totalWriteMisses = 0;
    long totalReadHits = 0;
    long totalWriteHits = 0;
    long totalReadStalls = 0;
    long totalWriteStalls = 0;
    
    // get all the entries and compute global data
    for( map<long, Entry*>::iterator it = database.begin() ; it != database.end() ;  ++it ) {
        Entry *e = (*it).second;

        // compute total values
        totalReadMisses  += e->getReadCacheMisses();
        totalReadHits    += e->getReadCacheHits();
        totalReadStalls  += e->getReadMissCycles();
        totalWriteMisses += e->getWriteCacheMisses();
        totalWriteHits   += e->getWriteCacheHits();
        totalWriteStalls += e->getWriteMissCycles();
        
        // add to list
        entries.push_back(e);
    }
    totalMemOperations = totalReadMisses + totalWriteMisses + totalReadHits + totalWriteHits;

    report << " Overall Performance: " << totalMemOperations << " References, " << (totalWriteMisses+totalReadMisses) << " Misses, Miss Rate = " << setprecision(2) << fixed << ((totalReadMisses+totalWriteMisses)/(0.01*totalMemOperations)) << "%," << endl
           << "   Cache Stalls = " << (totalWriteStalls+totalReadStalls) << " cycles, Average Miss Latency = " << ( (totalWriteStalls+totalReadStalls)/(totalReadMisses+totalWriteMisses)) << " cycles" << endl;

    // sort entries 
    entries.sort(compare_entries_total_misses);
    
    
    reportEntires(report, entries, totalReadMisses, totalReadHits, totalWriteMisses, totalWriteHits);

}

void Profiler::reportEntires(std::ostream &report, list<Entry*> &entries, long totalReadMisses, long totalReadHits, long totalWriteMisses, long totalWriteHits)
{
    int count  = 20;
    list<Entry*>::iterator it = entries.begin();
    long totalCacheMisses = totalReadMisses + totalWriteMisses;
    
    report << endl;
    report << "                                                                               Avg.     % of Total" << endl; 
    report << "                                                       Miss        Miss        Miss        Miss   " << endl; 
    report << "          PC         Type   References    Misses       Rate       Cycles      Cycles      Cycles  " << endl;
    report << "     --------------  -----  ----------  ----------  ----------  ----------  ----------  ----------" << endl;
    
    for ( int i = 0; i < count ; i++ ) {
        if ( it == entries.end() ) {
            break;
        }
        Entry *e = *it;

        report << noshowbase << " " << setw(2) << (i+1) << ".";
        report << " " << showbase << hex << setw(14) << setfill(' ') << e->getAddress() ;
        if ( e->getReadCacheMisses() < e->getWriteCacheMisses() ) {
            report << "  Store";
        } else { 
            report << "  Load ";
        }
        report << "  " << dec <<  setw(10) << e->getUsage() ;
        if ( e->getReadCacheMisses() < e->getWriteCacheMisses() ) {
            report << "  " << dec <<  setw(10) << e->getWriteCacheMisses() ;
            report << "  " << dec <<  setw(9) << fixed << setprecision(3) << (e->getWriteCacheMisses() / (0.01 * e->getUsage())) << "%" ;
            report << "  " << dec <<  setw(10) << (e->getWriteMissCycles()) ;
            report << "  " << dec <<  setw(10) << (e->getWriteMissCycles()/e->getWriteCacheMisses());
            report << "  " << dec <<  setw(9) << fixed  << setprecision(3) << (e->getWriteCacheMisses() / (0.01 * totalCacheMisses)) << "%";
        } else {
            report << "  " << dec <<  setw(10) << e->getReadCacheMisses() ;
            report << "  " << dec <<  setw(9) << fixed  << setprecision(3)  << (e->getReadCacheMisses() / (0.01 * e->getUsage())) << "%" ;
            report << "  " << dec <<  setw(10) << (e->getReadMissCycles()) ;
            report << "  " << dec <<  setw(10) << (e->getReadMissCycles()/e->getReadCacheMisses());
            report << "  " << dec <<  setw(9) << fixed  << setprecision(3) << (e->getReadCacheMisses() / (0.01 * totalCacheMisses)) << "%";
        }
        report << endl;
        it++;
    }
    
}
    


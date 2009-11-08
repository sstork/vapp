#include "Global.h"

static long tsc = 0;

long RDTSC() { 
  return tsc;
}


void advanceTSC(long inc)  {
  tsc += inc;
} 

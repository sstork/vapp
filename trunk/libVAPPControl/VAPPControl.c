#include "VAPPControl.h"

int foo = 0;

void VAPPTraceOn(vapp_flags_t flags)
{
  foo++;
}

void VAPPTraceOff(vapp_flags_t flags)
{
  foo--;
}

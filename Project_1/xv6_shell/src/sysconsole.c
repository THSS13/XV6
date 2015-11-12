#include "types.h"
#include "x86.h"
#include "defs.h"
#include "date.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

void
sys_clearc(void)
{
  clearc();
}

void
sys_insertc(void)
{
  int c;
  argint(0, &c);
  insertc(c);
}

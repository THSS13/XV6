/*
 * FileName: vesamode.c
 * Author: Liu Tongtong
 * Date: 2015.01.23
 * Version: 1.0
 *
 * TODO: 
 * 1. The GUI may not work properly if the width and height changes.
 *    You have to change the code according to SCREEN_WIDTH and SCREEN_HEIGHT.
 *
 */

#include "types.h"
#include "defs.h"
#include "memlayout.h"
#include "vesamode.h"

// Get the VESA mode information
void vesamodeinit()
{
    unsigned int memaddr = KERNBASE + 0x1028;
    unsigned int physaddr = *((unsigned int*)memaddr);
    SCREEN_PHYSADDR = (unsigned short*)physaddr;
    SCREEN_WIDTH = *((unsigned short*)(KERNBASE + 0x1012));
    SCREEN_HEIGHT = *((unsigned short*)(KERNBASE + 0x1014));
    VESA_ADDR = SCREEN_PHYSADDR;

    cprintf("SCREEN PHYSICAL ADDRESS: %x\n", SCREEN_PHYSADDR);
    cprintf("SCREEN WIDTH: %d\n", SCREEN_WIDTH);
    cprintf("SCREEN HEIGHT: %d\n", SCREEN_HEIGHT);
    cprintf("SCREEN BPP: %d\n", *((uchar*)(KERNBASE + 0x1019)));
}

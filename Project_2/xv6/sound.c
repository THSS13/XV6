#include "types.h"
#include "defs.h"
#include "param.h"
#include "mmu.h"
#include "proc.h"
#include "sound.h"
#include "buf.h"
#include "x86.h"
#include "traps.h"
#include "spinlock.h"
#include "memlayout.h"

/*
 * Reference to Intel doc AC97
 */
#define PCI_CONFIG_SPACE_STA_CMD 0x4
#define PCI_CONFIG_SPACE_NAMBA 0x10
#define PCI_CONFIG_SPACE_NABMBA 0x14
#define PCI_CONFIG_SPACE_SID_SVID 0x2C
#define PCI_CONFIG_SPACE_INTRL 0x3C

ushort SOUND_NAMBA_DATA;
#define NAMBA_PCMV SOUND_NAMBA_DATA + 0x2
#define NAMBA_PCVID1 SOUND_NAMBA_DATA + 0x7C
#define NAMBA_PCVID2 SOUND_NAMBA_DATA + 0x7E

ushort SOUND_NABMBA_DATA;
#define NABMBA_GLOB_CNT SOUND_NABMBA_DATA + 0x2C
#define NABMBA_GLOB_STA SOUND_NABMBA_DATA + 0x30
#define FRONT_DAC_RATE SOUND_NAMBA_DATA + 0x2C
#define SURROUND_DAC_RATE SOUND_NAMBA_DATA + 0x2E
#define LFE_DAC_RATE SOUND_NAMBA_DATA + 0x30
#define PO_BDBAR SOUND_NABMBA_DATA + 0x10//PCM Out Buffer Descriptor list Base Address Register 
#define PO_LVI SOUND_NABMBA_DATA + 0x15//PCM Out Last Valid Index 
#define PO_SR SOUND_NABMBA_DATA + 0x16//PCM Out Status Register
#define PO_CR SOUND_NABMBA_DATA + 0x1B //PCM Out Control Register
#define MC_BDBAR SOUND_NABMBA_DATA + 0x20//Mic. In Buffer Descriptor list Base Address Register
#define MC_LVI SOUND_NABMBA_DATA + 0x25//Mic. In Last Valid Index
#define MC_SR SOUND_NABMBA_DATA + 0x26//Mic. In Status Register
#define MC_CR SOUND_NABMBA_DATA + 0x2B//Mic. In Control Register

static struct spinlock soundLock;
static struct soundNode *soundQueue;

struct descriptor{
  uint buf;
  uint cmd_len;
};

static struct descriptor descriTable[DMA_BUF_NUM];

uint read_pci_config(uchar bus, uchar slot, uchar func, uchar offset)
{
    uint tmp, res;
    tmp = 0x80000000 | (bus << 16) | (slot << 11) | (func << 8) | offset;
    outsl(0xcf8, &tmp, 1);
    insl(0xcf8, &tmp, 1);
    cprintf("search bus: %x\n", tmp);
    insl(0xcfc, &res, 1);
    return res;
}

void write_pci_config(uchar bus, uchar slot, uchar func, uchar offset, uint val)
{
    uint tmp;
    tmp = 0x80000000 | (bus << 16) | (slot << 11) | (func << 8) | offset;
    outsl(0xcf8, &tmp, 1);
    outsl(0xcfc, &val, 1);
}

void soundinit(void)
{
  uchar bus, slot, func;
  ushort vendor, device;
  uint res;
// search bus, slot and func to find Intel 82801 AA AC'97 sound card
  for (bus = 0; bus < 5; ++bus)
    for (slot = 0; slot < 32; ++slot)
      for (func = 0; func < 8; ++func)
      {
        res = read_pci_config(bus, slot, func, 0);
        if (res != 0xffffffff)
        {
            vendor = res & 0xffff;
            device = (res >> 16) & 0xffff;
            // find 0x24158086(Intel 82801
            if (vendor == 0x8086 && device == 0x2415)
            {
                cprintf("Find sound card!\n");
                // Init sound
                soundcardinit(bus, slot, func);
                return;
            }
        }
      }
  cprintf("Sound card not found!\n");
}

void 
soundcardinit(uchar bus, uchar slot, uchar func)
{
	uint tmp, vendorID, inter;
	ushort vendorID1, vendorID2;

	
	//Initailize Interruption
	initlock(&soundLock, "audio");
	picenable(IRQ_SOUND);
	ioapicenable(IRQ_SOUND, ncpu - 1);
	
	//Initializing the Audio I/O Space
	tmp = read_pci_config(bus, slot, func, PCI_CONFIG_SPACE_STA_CMD);
	write_pci_config(bus, slot, func, PCI_CONFIG_SPACE_STA_CMD, tmp | 0x5);

	SOUND_NAMBA_DATA = read_pci_config(bus, slot, func, PCI_CONFIG_SPACE_NAMBA) & (~0x1);
	SOUND_NABMBA_DATA = read_pci_config(bus, slot, func, PCI_CONFIG_SPACE_NABMBA) & (~0x1);
	cprintf("AUDIO I/O Space initialized successfully!\n");
	
	//Removing AC_RESET
	outb(NABMBA_GLOB_CNT, 0x2);
	cprintf("AC_RESET removed successfully!\n");
	
	//Reading Codec Ready Status
	cprintf("Waiting for Codec Ready Status...\n");
	while (!(inw(NABMBA_GLOB_STA) & 0X100))
		;
	cprintf("Codec is ready!\n");
	
	//Determine Audio Codec
	tmp = inw(NAMBA_PCMV);
	cprintf("%x\n", tmp);
	outw(NAMBA_PCMV, 0x8000);
	tmp = inw(NAMBA_PCMV);
	if (inw(NAMBA_PCMV) != 0x8000)
	{
		cprintf("Audio Codec Function not found!\n");
		return;
	}
	outw(NAMBA_PCMV, tmp);
	cprintf("Audio Codec Function is found, current volume is %x.\n", tmp);
	
	//Reading the Audio Codec Vendor ID
	vendorID1 = inw(NAMBA_PCVID1);
	vendorID2 = inw(NAMBA_PCVID2);
	cprintf("Audio Codec Vendor ID read successfully!\n");
	
	//Programming the PCI Audio Subsystem ID
	vendorID = (vendorID2 << 16) + vendorID1;
	write_pci_config(bus, slot, func, PCI_CONFIG_SPACE_SID_SVID, vendorID);
	
    //Read the infomation of interruption
    inter = read_pci_config(bus, slot, func, PCI_CONFIG_SPACE_INTRL);
    cprintf("interrupt info:%x\n", inter);

    //BDBAR
        
    uint temp;
    uint base = v2p(descriTable);
    cprintf("base: %x\n", base);
    outsl(PO_BDBAR, &base, 1);
    insl(PO_BDBAR, &temp, 1);
    cprintf("temp: %x\n", temp);
        
}

/*
* Fucntions: Control sound card register
* Referred to @Yimin Liu
* Edited by Silun Wang
*/

void setSoundSampleRate(uint samplerate)
{
    //Control Register --> 0x00
    //pause audio
    //disable interrupt
    outb(PO_CR, 0x00);

    //PCM Front DAC Rate
    outw(FRONT_DAC_RATE, samplerate & 0xFFFF);
    //PCM Surround DAC Rate
    outw(SURROUND_DAC_RATE, samplerate & 0xFFFF);
    //PCM LFE DAC Rate
    outw(LFE_DAC_RATE, samplerate & 0xFFFF);
}

void soundInterrupt(void)
{
    int i;
    acquire(&soundLock);

    struct soundNode *node = soundQueue;
    soundQueue = node->next;

    //flag
    int flag = node->flag;

    node->flag |= PROCESSED;

    //0 sound file left
    if (soundQueue == 0)
    {
        if ((flag & PCM_OUT) == PCM_OUT)
        {
            ushort sr = inw(PO_SR);
            outw(PO_SR, sr);
        }
        else if ((flag & PCM_IN) == PCM_IN)
        {
            ushort sr = inw(MC_SR);
            outw(MC_SR, sr);
        }
        release(&soundLock);
        return;
    }

    //descriptor table buffer
    for (i = 0; i < DMA_BUF_NUM; i++)
    {
        descriTable[i].buf = v2p(soundQueue->data) + i * DMA_BUF_SIZE;
        descriTable[i].cmd_len = 0x80000000 + DMA_SMP_NUM;
    }

    //play music
    if ((flag & PCM_OUT) == PCM_OUT)
    {
        ushort sr = inw(PO_SR);
        outw(PO_SR, sr);
        outb(PO_CR, 0x05);
    }

    release(&soundLock);
}

void playSound(void)
{
    int i;

    //遍历声卡DMA的描述符列表，初始化每一个描述符buf指向缓冲队列中第一个音乐的数据块
    //每个数据块大小: DMA_BUF_SIZE
    for (i = 0; i < DMA_BUF_NUM; i++)
    {
        descriTable[i].buf = v2p(soundQueue->data) + i * DMA_BUF_SIZE;
        descriTable[i].cmd_len = 0x80000000 + DMA_SMP_NUM;
    }

//    uint base = v2p(descriTable);
//    cprintf("address of base: %x\n", &base);

    //开始播放: PCM_OUT
    if ((soundQueue->flag & PCM_OUT) == PCM_OUT)
    {
     //   cprintf("PO_BDBAR: %x\n", PO_BDBAR);
        //init base register
        //将内存地址base开始的1个双字写到PO_BDBAR
        //cprintf("base: %x\n", base);
        //outsl(PO_BDBAR, &base, 1);
     //   insl(PO_BDBAR, &temp, 1);
     //   cprintf("temp: %x\n", temp);
     //   for(i = 0; i < DMA_BUF_NUM; i++)
     //   {
     //       ptr = (struct descriptor *)p2v(temp);
     //       dataPtr = (uchar *)ptr[i].buf;
     //       dataPtr = P2V_WO(dataPtr);
     //       cprintf("%d: %d\n", i, *dataPtr);
     //   }
        //init last valid index
        outb(PO_LVI, 0x1F);
        //init control register
        //run audio
        //enable interrupt
        outb(PO_CR, 0x05);
    }
}


//add sound-piece to the end of queue
void addSound(struct soundNode *node)
{   
    struct soundNode **ptr;


    acquire(&soundLock);

    node->next = 0;
    for(ptr = &soundQueue; *ptr; ptr = &(*ptr)->next)
        ;
    *ptr = node;


    //node is already the first
    //play sound
    if (soundQueue == node)
    {
        playSound();
    }

    release(&soundLock);
}


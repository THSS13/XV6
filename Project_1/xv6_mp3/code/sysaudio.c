#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "mmu.h"
#include "proc.h"
#include "buf.h"
#include "sound.h"
#include "spinlock.h"
#include "common.h"

static struct soundNode audiobuf[3];
static struct coreBuf corebuf;
static struct layer info;

int headerInitFlag = 0;

int datacount;
int bufcount;
int size;
int isdecoding = 0;
int ismp3decoding = 0;
int ispaused = 0;
int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

struct snd {
    struct spinlock lock;
    uint tag;
};
struct decode {
    struct spinlock lock;
    uint nread;
    uint nwrite;
};

struct snd sndlock;
struct decode decodelock, mp3lock;


#define ARGBUFSIZE 400000
unsigned int argBuf[ARGBUFSIZE];
struct ArgLock {
    struct spinlock lock;
    uint nread;
    uint nwrite;
};
struct ArgLock argLock;
int argBufHead = 0;
int argBufTail = 0;
int sizeFRPS = sizeof(struct frame_params);
int sizeSDIF = sizeof(struct III_side_info_t);
int sizeLAYE = sizeof(struct layer);
int totsize = sizeof(struct frame_params) + sizeof(struct III_side_info_t) + sizeof(struct layer);


#define IN_OUT 8
#define BLOCK_SIZE 4096
int full = 0;
char buf[32768];
int inNum = 0;
int in = 0;
int out = 0;


int sys_setSampleRate(void)
{
    corebuf.buf_bit_idx=8;
    corebuf.totbit=0;
    corebuf.buf_byte_idx=0;
    // cprintf("sys_setaudiosmprate\n");
    int rate, i;
    // 获取系统的第0个参数
    if (argint(0, &rate) < 0)
        return -1;
    datacount = 0;
    bufcount = 0;
    // 将soundNode清空并置为已处理状态
    for (i = 0; i < 3; i++)
    {
        memset(&audiobuf[i], 0, sizeof(struct soundNode));
        audiobuf[i].flag = PROCESSED;
    }
    // audio.c设置采样率
    setSoundSampleRate(rate);
    return 0;
}

int
sys_wavdecode(void)
{
    //soundNode的数据大小
    int bufsize = DMA_BUF_NUM*DMA_BUF_SIZE;
    acquire(&decodelock.lock);
    while (isdecoding == 0)
    {
	   sleep(&decodelock.nread, &decodelock.lock);
    }
    release(&decodelock.lock);
    // cprintf("playing waken up\n");
    if (datacount == 0)
        memset(&audiobuf[bufcount], 0, sizeof(struct soundNode));
    //若soundNode的剩余大小大于数据大小，将数据写入soundNode中
    if (bufsize - datacount > size)
    {
        memmove(&audiobuf[bufcount].data[datacount], buf, size);
        audiobuf[bufcount].flag = PCM_OUT | PROCESSED;
        datacount += size;
    }
    else
    {
        int temp = bufsize - datacount,i;
        //soundNode存满后调用audioplay进行播放
    	acquire(&sndlock.lock);
    	while (ispaused == 1)
    	{
    		sleep(&sndlock.tag, &sndlock.lock);
    	}
    	release(&sndlock.lock);
        memmove(&audiobuf[bufcount].data[datacount], buf, temp);
        audiobuf[bufcount].flag = PCM_OUT;
        addSound(&audiobuf[bufcount]);
        int flag = 1;
        //寻找一个已经被处理的soundNode，将剩余数据戏写入
        // cprintf("come to play area\n");
        while(flag == 1)
        {
            for (i = 0; i < 3; ++i)
            {
                if ((audiobuf[i].flag & PROCESSED) == PROCESSED)
                {
                    memset(&audiobuf[i], 0, sizeof(struct soundNode));
                    if (bufsize > size - temp)
                    {
                        memmove(&audiobuf[i].data[0], (buf +temp), (size-temp));
                        audiobuf[i].flag = PCM_OUT | PROCESSED;
                        datacount = size - temp;
                        bufcount = i;
                        flag = -1;
                        break;
                    }
                    else
                    {
                        memmove(&audiobuf[i].data[0], (buf + temp), bufsize);
                        temp = temp + bufsize;
                        audiobuf[i].flag = PCM_OUT;
                        addSound(&audiobuf[i]);
                    }
                }
            }
        }
    }
    acquire(&decodelock.lock);
    isdecoding = 0;
    wakeup(&decodelock.nwrite);
    release(&decodelock.lock);
    // cprintf("playing ends\n");
    return 0;
}

int
sys_wavdecode_wav(void)
{
    if(in == out && full == 0)
    {
        return -1;
    }
    //soundNode的数据大小
    int bufsize = DMA_BUF_NUM*DMA_BUF_SIZE;
    //acquire(&decodelock.lock);
    // while (isdecoding == 0)
    // {
       // sleep(&decodelock.nread, &decodelock.lock);
    // }
    //release(&decodelock.lock);
    // cprintf("playing waken up\n");
    if (datacount == 0)
        memset(&audiobuf[bufcount], 0, sizeof(struct soundNode));
    //若soundNode的剩余大小大于数据大小，将数据写入soundNode中
    if (bufsize - datacount > BLOCK_SIZE)
    {
        memmove(&audiobuf[bufcount].data[datacount], buf+out*BLOCK_SIZE, BLOCK_SIZE);
        out = (out+1)%IN_OUT;
        audiobuf[bufcount].flag = PCM_OUT | PROCESSED;
        datacount += BLOCK_SIZE;
    }
    else
    {
        int temp = bufsize - datacount,i;
        //soundNode存满后调用audioplay进行播放
        acquire(&sndlock.lock);
        while (ispaused == 1)
        {
            sleep(&sndlock.tag, &sndlock.lock);
        }
        release(&sndlock.lock);
        memmove(&audiobuf[bufcount].data[datacount], buf+out*BLOCK_SIZE, temp);
        //out = (out+1)%IN_OUT;
        audiobuf[bufcount].flag = PCM_OUT;
        addSound(&audiobuf[bufcount]);
        int flag = 1;
        //寻找一个已经被处理的soundNode，将剩余数据戏写入
        // cprintf("come to play area\n");
        while(flag == 1)
        {
            for (i = 0; i < 3; ++i)
            {
                if ((audiobuf[i].flag & PROCESSED) == PROCESSED)
                {
                    memset(&audiobuf[i], 0, sizeof(struct soundNode));
                    if (bufsize > BLOCK_SIZE - temp)
                    {
                        memmove(&audiobuf[i].data[0], (buf+out*BLOCK_SIZE +temp), (BLOCK_SIZE-temp));
                        audiobuf[i].flag = PCM_OUT | PROCESSED;
                        datacount = BLOCK_SIZE - temp;
                        bufcount = i;
                        flag = -1;
                        //out = (out+1)%IN_OUT;
                        break;
                    }
                    else
                    {
                        memmove(&audiobuf[i].data[0], (buf+out*BLOCK_SIZE + temp), bufsize);
                        temp = temp + bufsize;
                        audiobuf[i].flag = PCM_OUT;
                        addSound(&audiobuf[i]);
                    }
                }
            }
        }
        out = (out+1)%IN_OUT;
    }
    acquire(&decodelock.lock);
    full = 0;
    isdecoding = 0;
    wakeup(&decodelock.nwrite);
    release(&decodelock.lock);
    // cprintf("playing ends\n");
    return 0;
}

int sys_endDecode(void)
{
    acquire(&mp3lock.lock);
    ismp3decoding = 0;
    wakeup(&mp3lock.nwrite);
    release(&mp3lock.lock);
    return 0;
}

// int
// sys_waitForDecode(void)
// {
//     acquire(&mp3lock.lock);
//     while (ismp3decoding == 0) {
// 	   sleep(&mp3lock.nread, &mp3lock.lock);
//     }
//     int ptr1, ptr2, ptr3;
//     argint(0, &ptr1);
//     argint(1, &ptr2);
//     argint(2, &ptr3);
//     memmove((char*)ptr1, &corebuf.fr_ps, sizeof(struct frame_params));
//     memmove((char*)ptr2, &corebuf.III_side_info, sizeof(struct III_side_info_t)); 
//     memmove((char*)ptr3, &info, sizeof(struct layer));
//     release(&mp3lock.lock);
//     return 0;
// }

// int
// sys_beginDecode(void)
// {
//     acquire(&mp3lock.lock);
//     while (ismp3decoding) {
//  	  sleep(&mp3lock.nwrite, &mp3lock.lock);
//     }
//     int ptr1, ptr2, ptr3;
//     argint(0, &ptr1);
//     argint(1, &ptr2);
//     argint(2, &ptr3);
//     if (headerInitFlag == 0) {
//         corebuf.fr_ps.header = &info;
//         headerInitFlag = 1;
//     } 
//     memmove(&corebuf.fr_ps, (char*)ptr1, sizeof(struct frame_params));
//     memmove(&corebuf.III_side_info, (char*)ptr2, sizeof(struct III_side_info_t));
//     memmove(&info, (char*)ptr3, sizeof(struct layer));
//     ismp3decoding = 1;
//     wakeup(&mp3lock.nread);
//     release(&mp3lock.lock);

//     acquire(&mp3lock.lock);
//     while (ismp3decoding) {
//         sleep(&mp3lock.nwrite, &mp3lock.lock);
//     }
//     release(&mp3lock.lock);
    
//     return 0;
// }

int
sys_beginDecode(void) 
{
    acquire(&argLock.lock);
    while (argBufTail - argBufHead >= 1000) {
        sleep(&argLock.nwrite, &argLock.lock);
    }
    int ptr1, ptr2, ptr3;
    argint(0, &ptr1);
    argint(1, &ptr2);
    argint(2, &ptr3);
    memmove(&argBuf[argBufTail % 1000 * totsize], (char*)ptr1, sizeFRPS);
    memmove(&argBuf[argBufTail % 1000 * totsize + sizeFRPS], (char*)ptr2, sizeSDIF);
    memmove(&argBuf[argBufTail % 1000 * totsize + sizeFRPS + sizeSDIF], (char*)ptr3, sizeLAYE);
    argBufTail ++;
    // cprintf("argBufTail=%d\n", argBufTail);
    wakeup(&argLock.nread);
    release(&argLock.lock);
}

int
sys_waitForDecode(void)
{
    acquire(&argLock.lock);
    while (argBufHead == argBufTail) {
        sleep(&argLock.nread, &argLock.lock);
    }
    int ptr1, ptr2, ptr3;
    argint(0, &ptr1);
    argint(1, &ptr2);
    argint(2, &ptr3);
    memmove((char*)ptr1, &argBuf[argBufHead % 1000 * totsize], sizeFRPS);
    memmove((char*)ptr2, &argBuf[argBufHead % 1000 * totsize + sizeFRPS], sizeSDIF);
    memmove((char*)ptr3, &argBuf[argBufHead % 1000 * totsize + sizeFRPS + sizeSDIF], sizeLAYE);
    argBufHead ++;
    // cprintf("argBufHead=%d\n", argBufHead);
    if (argBufTail - argBufHead < 1000) {
        wakeup(&argLock.nwrite);
    }
    release(&argLock.lock);
}

int
sys_kwrite(void)
{
    char *buffer;
    //获取待播放的数据和数据大小
    // cprintf("enter kwrite\n");
    acquire(&decodelock.lock);
    while (isdecoding) {
 	  sleep(&decodelock.nwrite, &decodelock.lock);
    }
    // cprintf("before readyto play!\n");
    if (argint(1, &size) < 0 || argptr(0, &buffer, size) < 0)
        return -1;
    // cprintf("ready to play!\n");
    memmove(buf, buffer, size);
    isdecoding = 1;
    wakeup(&decodelock.nread);
    release(&decodelock.lock);
    // cprintf("kwrite return\n");
    return 0;
}

int
sys_kwrite_wav(void)
{
    char *buffer;
    int bound = BLOCK_SIZE*IN_OUT;
    //获取待播放的数据和数据大小
    // cprintf("enter kwrite\n");
    if (argint(1, &size) < 0 || argptr(0, &buffer, size) < 0)
    return -1;
    if(size >= bound)
        return -1;
        
    acquire(&decodelock.lock);
    // while (isdecoding) {
      // sleep(&decodelock.nwrite, &decodelock.lock);
    // }
    // cprintf("before readyto play!\n");
    //buffer is full
    while((inNum >= out*BLOCK_SIZE)&&((inNum+size) >= (out+IN_OUT)*BLOCK_SIZE)
            || ((inNum<out*BLOCK_SIZE)&&((inNum+size) >= out*BLOCK_SIZE)) )
            sleep(&decodelock.nwrite, &decodelock.lock);
  
    // cprintf("ready to play!\n");
    if(inNum+size >= bound)
    {
        int temp = inNum+size - bound;
        memmove(buf+inNum, buffer, bound-inNum);
        if(temp != 0)
        memmove(buf,buffer,temp);
        inNum = (inNum+size)-(BLOCK_SIZE*IN_OUT);
    }
    else
    {
        memmove(buf+inNum,buffer,size);
        inNum = inNum+size;
    }
  
    in = inNum / BLOCK_SIZE;
    isdecoding = 1;

    wakeup(&decodelock.nread);
    release(&decodelock.lock);
    // cprintf("kwrite return\n");
    return 0;
}

int
sys_pause(void)
{
    sndlock.tag = 0;
    if (ispaused == 0) {
	   ispaused = 1;
    }
    else {
    	acquire(&sndlock.lock);
    	ispaused = 0;
    	wakeup(&sndlock.tag);
    	release(&sndlock.lock);
    }
    return 0;
}

int sys_getCoreBuf(void)
{
	int type, para;
	argint(0, &type);
	argint(1, &para);
	unsigned long val=0;
	register int j = para;
	register int k, tmp;
	switch(type) {
    	case 1:
    		corebuf.buf[corebuf.offset % BUFSIZE] = para;
    		corebuf.offset++;
    		return 0;
    	case 2:
    		return corebuf.totbit;
    	case 3:
        	corebuf.totbit += para;
        	while (j > 0) {
        		if (!corebuf.buf_bit_idx) {
        			corebuf.buf_bit_idx = 8;
        			corebuf.buf_byte_idx++;
        			if (corebuf.buf_byte_idx > corebuf.offset) {
        				cprintf("%d %d hjw Buffer overflow !!\n", corebuf.buf_byte_idx, corebuf.offset);
        				exit();
        			}
        		}
        		k = MIN(j, corebuf.buf_bit_idx);
        		tmp = corebuf.buf[corebuf.buf_byte_idx % BUFSIZE] & putmask[corebuf.buf_bit_idx];
        		tmp = tmp >> (corebuf.buf_bit_idx-k);
        		val |= tmp << (j-k);
        		corebuf.buf_bit_idx -= k;
        		j -= k;
        	}
        	return(val);
    	case 4:
    		corebuf.totbit -= para;
    		corebuf.buf_bit_idx += para;
    		while( corebuf.buf_bit_idx >= 8 ){
    			corebuf.buf_bit_idx -= 8;
    			corebuf.buf_byte_idx--;
    		}
    		return 0;
    	case 5:
    		corebuf.totbit -= para*8;
    		corebuf.buf_byte_idx -= para;
    		return 0;
        case 6:
            return corebuf.buf_byte_idx;
        case 7:
            return corebuf.buf_bit_idx;
        case 8:
            return corebuf.offset;
        default:
            return 0;
	}
	return 0;
}

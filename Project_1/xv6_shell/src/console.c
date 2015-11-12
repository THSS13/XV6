// Console input and output.
// Input is from the keyboard or serial port.
// Output is written to the screen and serial port.

#include "types.h"
#include "defs.h"
#include "param.h"
#include "traps.h"
#include "spinlock.h"
#include "fs.h"
#include "file.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "x86.h"

#include "history.h"
#include "var_in_kernel.h"

static void consputc(int);

static int panicked = 0;

static struct {
  struct spinlock lock;
  int locking;
} cons;

static void
printint(int xx, int base, int sign)
{
  static char digits[] = "0123456789abcdef";
  char buf[16];
  int i;
  uint x;

  if(sign && (sign = xx < 0))
    x = -xx;
  else
    x = xx;

  i = 0;
  do{
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);

  if(sign)
    buf[i++] = '-';

  while(--i >= 0)
    consputc(buf[i]);
}
//PAGEBREAK: 50

// Print to the console. only understands %d, %x, %p, %s.
void
cprintf(char *fmt, ...)
{
  int i, c, locking;
  uint *argp;
  char *s;

  locking = cons.locking;
  if(locking)
    acquire(&cons.lock);

  if (fmt == 0)
    panic("null fmt");

  argp = (uint*)(void*)(&fmt + 1);
  for(i = 0; (c = fmt[i] & 0xff) != 0; i++){
    if(c != '%'){
      consputc(c);
      continue;
    }
    c = fmt[++i] & 0xff;
    if(c == 0)
      break;
    switch(c){
    case 'd':
      printint(*argp++, 10, 1);
      break;
    case 'x':
    case 'p':
      printint(*argp++, 16, 0);
      break;
    case 's':
      if((s = (char*)*argp++) == 0)
        s = "(null)";
      for(; *s; s++)
        consputc(*s);
      break;
    case '%':
      consputc('%');
      break;
    default:
      // Print unknown % sequence to draw attention.
      consputc('%');
      consputc(c);
      break;
    }
  }

  if(locking)
    release(&cons.lock);
}

void
panic(char *s)
{
  int i;
  uint pcs[10];
  
  cli();
  cons.locking = 0;
  cprintf("cpu%d: panic: ", cpu->id);
  cprintf(s);
  cprintf("\n");
  getcallerpcs(&s, pcs);
  for(i=0; i<10; i++)
    cprintf(" %p", pcs[i]);
  panicked = 1; // freeze other CPU
  for(;;)
    ;
}

//PAGEBREAK: 50
#define KEY_HOME        0xE0
#define KEY_END         0xE1
#define KEY_UP          0xE2
#define KEY_DN          0xE3
#define KEY_LF          0xE4
#define KEY_RT          0xE5
#define KEY_PGUP        0xE6
#define KEY_PGDN        0xE7
#define KEY_INS         0xE8
#define KEY_DEL         0xE9

#define BACKSPACE 0x100
#define CRTPORT 0x3d4
static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory

#define INPUT_BUF 128
struct {
  struct spinlock lock;
  char buf[INPUT_BUF];
  uint r;  // Read index
  uint w;  // Write index
  uint e;  // Edit index

  uint l;  // Input length
  uint m;  // Mode 0,INSERT 1,REPLACE
} input;

#define C(x)  ((x)-'@')  // Control-x

#define WHITE_ON_BLACK 0x0700

void consputc(int c);

static void
cgaputc(int c)
{
  int pos;
  
  // Cursor position: col + 80*row.
  outb(CRTPORT, 14);
  pos = inb(CRTPORT+1) << 8;
  outb(CRTPORT, 15);
  pos |= inb(CRTPORT+1);

  if(c == '\n')
    pos += 80 - pos%80;
  else if(c == BACKSPACE){
    if(pos > 0) --pos;
  } else
    crt[pos++] = (c&0xff) | 0x0700;  // black on white
  
  if((pos/80) >= 24){  // Scroll up.
    memmove(crt, crt+80, sizeof(crt[0])*23*80);
    pos -= 80;
    memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
  }
  
  outb(CRTPORT, 14);
  outb(CRTPORT+1, pos>>8);
  outb(CRTPORT, 15);
  outb(CRTPORT+1, pos);
  crt[pos] = ' ' | 0x0700;
}

void
consputc(int c)
{
  if(panicked){
    cli();
    for(;;)
      ;
  }
  if(c == BACKSPACE){
    uartputc('\b'); uartputc(' '); uartputc('\b');
  } else
    uartputc(c);
  cgaputc(c);
}

int
getcursor()
{
    int pos;
    // Cursor position: col + 80*row.
    outb(CRTPORT, 14);
    pos = inb(CRTPORT+1) << 8;
    outb(CRTPORT, 15);
    pos |= inb(CRTPORT+1);
    return pos;
}

void
setcursor(int pos)
{
    int old = getcursor();
    if (pos == -1)
        pos = old + 80 - old % 80;
    else
        input.e += pos - old;

    if((pos/80) >= 24){  // Scroll up.
        memmove(crt, crt+80, sizeof(crt[0])*23*80);
        pos -= 80;
        memset(crt+pos, 0, sizeof(crt[0])*(24*80 - pos));
    }   
    outb(CRTPORT, 14);
    outb(CRTPORT+1, pos>>8);
    outb(CRTPORT, 15);
    outb(CRTPORT+1, pos);
}

void 
insertc(int c)
{
    int pos = getcursor();
    int i, j;
    if (c != 0 && input.l - input.r < INPUT_BUF){
        for (i = input.l, j = pos + input.l - input.e; i > input.e; --i, --j){
            input.buf[i] = input.buf[i - 1];
            crt[j] = crt[j - 1] | WHITE_ON_BLACK;
        }
        input.buf[input.e % INPUT_BUF] = c;
        
        input.l++;
        
        if (c == '\n'){
            input.e++;
            setcursor(-1);
        }
        else
        {
            crt[pos++] = (c & 0xff) | WHITE_ON_BLACK;
            setcursor(pos);
        }

    }
}

void
replacec(int c)
{
    int pos = getcursor();
    input.buf[input.e] = c;
    crt[pos] = c;
}

//Delete a character at pos
//mode 0,backspace 1,delete
void
deletec(int mode)
{
    int pos = getcursor();
    if (mode == 0){
        if (input.e != input.w && pos > 0){
            input.l--;
            pos--;
            setcursor(pos);
        }
        else
            return ;
    }
    if (mode == 1){
        if (input.e < input.l){
            input.l--;
        }
        else
            return ;
    }
    
    int i, j;
    for (i = input.e, j = pos; i < input.l; ++i, ++j){
        input.buf[i] = input.buf[i + 1];
        crt[j] = crt[j + 1] | WHITE_ON_BLACK;
    }
    crt[j] = ' ' | WHITE_ON_BLACK;
}

void
clearline()
{
    int i;
    int pos = getcursor();
    pos -= (input.e - input.w);
    setcursor(pos);
    for (i = pos; i < pos + input.l; ++i){
        crt[i] = ' ' | WHITE_ON_BLACK;
    }
    input.l = input.w;
}

void
clearc()
{
  acquire(&input.lock);
  int pos = getcursor();
  if (pos > 0){  
    input.buf[input.w] = 0;
    int ipos = --input.w;
    input.r--;
    input.l--;
    pos--;
    crt[pos] = ' ' | WHITE_ON_BLACK;
    setcursor(pos);
    input.e = ipos;
  }
  release(&input.lock);
  return;
}


void
insertline(char* buf)
{
    int i, j, k;
    int pos = getcursor();
    input.l = input.w + strlen(buf);
    for (i = input.w, j = pos, k = 0; i < input.l; ++i, ++j, ++k){
        input.buf[i] = buf[k];
        crt[j] = buf[k] | WHITE_ON_BLACK;
    }
    setcursor(pos + strlen(buf));
}

void
uartprint(int k)
{
    if (k < 10)
      uartputc(k + 48);
    else{
      uartprint(k / 10);
      uartputc(k % 10 + 48);
    }
}

void
consoleintr(int (*getc)(void))
{
  int c;

  acquire(&input.lock);
  int pos = getcursor();/*
  int i;
    uartprint(input.e);
  uartputc(';');
  uartprint(pos);
  uartputc(';');
  for (i = input.w; i < input.l; ++i)
    uartputc(input.buf[i]);
  uartputc('\n');*/
  while((c = getc()) >= 0){
    if (consolemode == 2){
      input.buf[input.l++ % INPUT_BUF] = c;
      input.e = input.l;
      input.w = input.l;
      wakeup(&input.r);
      continue;
    }
    switch(c){
    case C('C'):  // kill current process
      sendsignal(1);
      break;
    case C('P'):  // Process listing.
      procdump();
      break;
    case C('U'):  // Kill line.
      while(input.e != input.w &&
            input.buf[(input.e-1) % INPUT_BUF] != '\n'){
        deletec(0);
      }
      break;
    case C('H'): case '\x7f':  // Backspace
      if(input.e != input.w){
        deletec(0);
      }
      break;
    case KEY_HOME: //Home
        setcursor(pos - input.e);
        break;
    case KEY_END: // End
        setcursor(pos + input.l - input.e);
        break;
    case KEY_PGUP:
        break;
    case KEY_PGDN:
        break;
    case KEY_INS:
        break;
    case KEY_DEL:
        deletec(1);
        break;
    case KEY_LF: // Left
        if (input.e != input.w){
            setcursor(pos - 1);
        }
        break;
    case KEY_RT: // Right
        if (input.e < input.l){
            setcursor(pos + 1);
        }
        break;
    case KEY_UP:
    case KEY_DN:
    case 9://tab
        setcursor(pos + input.l - input.e);
        insertc(c);
        input.w = input.l;
        wakeup(&input.r);
        break;
    default: //Insert
      if(c != 0 && input.l-input.r < INPUT_BUF){
        c = (c == '\r') ? '\n' : c;
        
        //Input enter
        if(c == '\n' || c == C('D') || input.l == input.r + INPUT_BUF - 1){
            //setcursor(-1);
            //input.buf[input.l++ % INPUT_BUF] = '\n';
            //input.e = input.l;
            setcursor(pos + input.l - input.e);
            insertc('\n');
            input.w = input.l;
            wakeup(&input.r);
            break;
        }
        else
            insertc(c);
            /*input.w = input.l;
            wakeup(&input.r);*/
      }
      break;
    }
  }
  release(&input.lock);
}

int
consoleread(struct inode *ip, char *dst, int n)
{
  uint target;
  int c;

  iunlock(ip);
  target = n;
  acquire(&input.lock);
  while(n > 0){
    while(input.r == input.w){
      if(proc->killed){
        release(&input.lock);
        ilock(ip);
        return -1;
      }
      sleep(&input.r, &input.lock);
    }
    c = input.buf[input.r++ % INPUT_BUF];
    if(c == C('D')){  // EOF
      if(n < target){
        // Save ^D for next time, to make sure
        // caller gets a 0-byte result.
        input.r--;
      }
      break;
    }
    *dst++ = c;
    --n;
    if(c == '\n')
      break;
  }
  release(&input.lock);
  ilock(ip);

  return target - n;
}

int
consolewrite(struct inode *ip, char *buf, int n)
{
  int i;

  iunlock(ip);
  acquire(&cons.lock);
  for(i = 0; i < n; i++)
    consputc(buf[i] & 0xff);
  release(&cons.lock);
  ilock(ip);

  return n;
}

void
consoleinit(void)
{
  initlock(&cons.lock, "console");
  initlock(&input.lock, "input");

  devsw[CONSOLE].write = consolewrite;
  devsw[CONSOLE].read = consoleread;
  cons.locking = 1;

  picenable(IRQ_KBD);
  ioapicenable(IRQ_KBD, 0);
}



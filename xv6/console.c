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
#include "execvim.h"

//yi xia shi hou jia de
#define COMMANDMAXLENDTH 10//命令的最长长度
#define COMMANDNUM 21//命令的个数
char *command[COMMANDNUM] = { "cat", "cd", "cp", "echo", "forktest", "grep", "help", "init", "kill", "ln", "ls",
"mkdir", "rename", "rm", "script", "sh", "stressfs", "usertests", "vim", "wc", "zombie" };
int color[16] = { 0x0000, 0x0100, 0x0200, 0x0300, 0x0400, 0x0500, 0x0600, 0x0700,
0x0800, 0x0900, 0x0a00, 0x0b00, 0x0c00, 0x0d00, 0x0e00, 0x0f00 };
char matchinput[COMMANDMAXLENDTH];
int matchinputlen = 0;
int iskbdtype = 0;
int commandfilled = 1;
int historyno = -1;
char matchcmd[COMMANDNUM][COMMANDMAXLENDTH];
int matchcmdno;
int matchcmdnum;
int posoffset = 0;

#define INPUT_BUF 128
struct {
	struct spinlock lock;
	char buf[INPUT_BUF];
	uint r;  // Read index
	uint w;  // Write index
	uint e;  // Edit index
} input;

struct {
	char bufarray[100][INPUT_BUF];
	uint top;
	uint base;
} history;

//yi shang shi hou jia de

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
#define BACKSPACE 0x100
#define CRTPORT 0x3d4
static ushort *crt = (ushort*)P2V(0xb8000);  // CGA memory

//修改开始

//新增
// 得到匹配字符串
// 似乎是用于补全命令的，全局变量matchinput是当前输入的字符
// 将matchcmd数组变成所有匹配的命令的集合
// 返回值为匹配的命令个数
int
getmatchcmd(char matchcmd[][COMMANDMAXLENDTH])
{
	int n;
	int matchno;
	for (n = 0, matchno = 0; n < COMMANDNUM; n++) {
		if (strmatch(command[n], matchinput)) {
			memset(matchcmd[matchno], 0, sizeof(matchcmd[matchno]));
			strncpy(matchcmd[matchno++], command[n], strlen(command[n]));
		}
	}
	return matchno;
}
//新增结束

static void
cgaputc(int c)
{
	int pos;

	// Cursor position: col + 80*row.
	outb(CRTPORT, 14);
	pos = inb(CRTPORT + 1) << 8;
	outb(CRTPORT, 15);
	pos |= inb(CRTPORT + 1);

	int i;
	if (iskbdtype && posoffset == 0 && c != 0xe4 && c != 0xe5){
		if (pos >= 0){
			for (i = pos; crt[i] != ((' ' & 0xff) | 0x0700); i++)
				crt[i] = ' ' | 0x0700;
		}
	}

	// 换行符
	if (c == '\n')
		pos += 80 - pos % 80;
	// 退格符
	else if (c == BACKSPACE){
		if (pos > 0){
			--pos;
			if (iskbdtype && posoffset > 0){
				memset(matchinput, 0, strlen(matchinput));
				matchinputlen = 0;
				// 移动光标后的字符
				for (i = 0; i < posoffset; i++){
					crt[pos + i] = crt[pos + i + 1];
				}
			}
			crt[pos + posoffset] = ' ' | 0x0700;
		}
	}
	// 普通字符
	else if (c != 0xe2 && c != 0xe3 && c != 0xe4 && c != 0xe5){
		if (iskbdtype && posoffset > 0){
			memset(matchinput, 0, strlen(matchinput));
			matchinputlen = 0;
			for (i = 0; i < posoffset; i++){
				crt[pos + posoffset - i] = crt[pos + posoffset - i - 1];
			}
		}
		crt[pos] = (c & 0xff) | color[7 % 16];  // black on white
		pos++;
	}

	if (iskbdtype){
		// 空格或回车后准备重新计算匹配字符串
		if (c == '\n' || c == ' '){
			memset(matchinput, 0, strlen(matchinput));
			matchinputlen = 0;
			commandfilled = 1;
			if (c == '\n') posoffset = 0;
		}
		// 退格的匹配计算
		else if (c == BACKSPACE){
			commandfilled = 1;
			if (matchinputlen > 0)
				matchinputlen--;
			if (matchinputlen >= 0 && matchinputlen < COMMANDMAXLENDTH - 1)
				matchinput[matchinputlen] = '\0';
			if (matchinputlen > 0 && matchinputlen < COMMANDMAXLENDTH){
				matchcmdnum = getmatchcmd(matchcmd);
				matchcmdno = 0;
				if (matchcmdnum > 0){
					for (i = matchinputlen; i < strlen(matchcmd[0]); i++){
						crt[pos + i - matchinputlen] = (matchcmd[0][i] & 0xff) | 0x0800;
						commandfilled = 0;
					}
				}
			}
		}
		else{
			// 上下左右键监听
			if (c == 0xe2 || c == 0xe3 || c == 0xe4 || c == 0xe5){
				// 处于匹配字符串模式，监听为匹配字符串的监听
				if (matchcmdnum > 0 && !commandfilled){
					// 翻看可能命令
					if (c == 0xe2){
						matchcmdno = (matchcmdno + matchcmdnum - 1) % matchcmdnum;
					}
					else if (c == 0xe3){
						matchcmdno = (matchcmdno + 1) % matchcmdnum;
					}
					// 补全命令
					else if (c == 0xe5){
						for (i = pos; crt[i] != ((' ' & 0xff) | 0x0700); i++){
							crt[i] = (crt[i] & 0xff) | 0x0700;
							matchinput[matchinputlen++] = crt[i] & 0xff;
							input.buf[input.e++ % INPUT_BUF] = crt[i] & 0xff;
						}
						pos = i;
						commandfilled = 1;
					}
				}
				// 处于翻看历史记录模式
				else if (commandfilled){
					// 寻找历史记录
					if (c == 0xe2 || c == 0xe3){
						int posno = (history.top - 1 - historyno + 100) % 100;
						if (c == 0xe2){
							if (posno != history.base)
								historyno = (historyno + 1) % 100;
						}
						else{
							if (posno != (history.top - 1 + 100) % 100)
								historyno = (historyno - 1) % 100;
						}
						posno = (history.top - 1 - historyno + 100) % 100;
						if (history.bufarray[posno][0] != '\0'){
							memset(matchinput, 0, strlen(matchinput));
							matchinputlen = 0;
							while (input.e > input.w){
								crt[(--pos) + posoffset] = ' ' | 0x0700;
								input.buf[--input.e % INPUT_BUF] = '\0';
							}
							pos += posoffset;
							posoffset = 0;
							int j;
							for (j = 0; j < strlen(history.bufarray[posno]); j++){
								crt[pos++] = (history.bufarray[posno][j] & 0xff) | 0x0700;
								input.buf[input.e++ % INPUT_BUF] = history.bufarray[posno][j];
							}
						}
					}
					// 修改已输入字符串
					else if (c == 0xe4){
						if (input.e > input.w + posoffset){
							pos--;
							posoffset++;
						}
					}
					else if (c == 0xe5){
						if (posoffset > 0){
							pos++;
							posoffset--;
						}
					}
				}
			}
			else if (posoffset == 0){
				commandfilled = 1;
				if (matchinputlen < COMMANDMAXLENDTH - 1)
					matchinput[matchinputlen] = c;
				matchinputlen++;
			}
			// 命令输入提示
			if (posoffset == 0 && matchinputlen > 0 && matchinputlen < COMMANDMAXLENDTH && c != 0xe4 && c != 0xe5){
				if (c != 0xe2 && c != 0xe3){
					matchcmdnum = getmatchcmd(matchcmd);
					matchcmdno = 0;
				}
				if (matchcmdnum > 0){
					for (i = matchinputlen; i < strlen(matchcmd[matchcmdno]); i++){
						crt[pos + i - matchinputlen] = (matchcmd[matchcmdno][i] & 0xff) | 0x0800;
						commandfilled = 0;
					}
				}
			}
		}
	}

	if ((pos / 80) >= 24){  // Scroll up.
		memmove(crt, crt + 80, sizeof(crt[0]) * 23 * 80);
		pos -= 80;
		memset(crt + pos, 0, sizeof(crt[0])*(24 * 80 - pos));
	}

	outb(CRTPORT, 14);
	outb(CRTPORT + 1, pos >> 8);
	outb(CRTPORT, 15);
	outb(CRTPORT + 1, pos);
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

#define C(x)  ((x)-'@')  // Control-x
int firstvim = 1;
int startpos;
int endpos;

void
consoleintr(int (*getc)(void), int type)
{
  int c;
  // 执行vim操作的键盘相应
  if(execvim == 1){
    acquire(&input.lock);
    while((c = getc()) >= 0){
      int pos;
      if(c != 0){
        // Cursor position: col + 80*row.
        outb(CRTPORT, 14);
        pos = inb(CRTPORT+1) << 8;
        outb(CRTPORT, 15);
        pos |= inb(CRTPORT+1);
        // 找到文件头位置及尾位置
        if(firstvim){
          endpos = pos;
          if(endpos % 80 != 0)
            endpos = pos + 80 - pos%80;
          for(startpos = pos - pos%80; startpos >= 0 && (crt[startpos] != (('$'&0xff) | 0x0700)
           || crt[startpos+1] != ((' '&0xff) | 0x0700) || crt[startpos+2] != (('v'&0xff) | 0x0700)
            || crt[startpos+3] != (('i'&0xff) | 0x0700) || crt[startpos+4] != (('m'&0xff) | 0x0700)
             || crt[startpos+5] != ((' '&0xff) | 0x0700)); startpos--);
          if(startpos < 0)
            startpos = 0;
          else
            startpos += 80 - startpos%80;
          if(startpos == endpos){
            int i;
            for(i = startpos; i < startpos + 80; i++)
              crt[i] = (' '&0xff) | 0x0700;
            endpos += 80;
          }
          firstvim = 0;
          pos = startpos;
        }
      }
      // 若用户不点击Esc键
      if(c != 0x1B && c != 0){
        // 上下左右键盘相应
        if(c == 0xe2){
          if(pos >= startpos + 80)
            pos -= 80;
        }
        else if(c == 0xe3){
          if(pos < endpos - 80)
            pos += 80;
        }
        else if(c == 0xe4){
          if(pos > startpos)
            pos--;
        }
        else if(c == 0xe5){
          if(pos < endpos - 1)
            pos++;
        }
        // 回车键盘相应
        else if(c == '\n'){
          if(endpos == 23*80){
            memmove(crt, crt+80, sizeof(crt[0])*(pos/80)*80);
            int i;
            for(i = (pos/80)*80; i < (pos/80)*80 + 80; i++)
              crt[i] = (' '&0xff) | 0x0700;
            startpos -= 80;
          }
          else{
            pos += 80 - pos%80;
            memmove(crt+pos+80, crt+pos, sizeof(crt[0])*(endpos-pos));
            int i;
            for(i = pos; i < pos + 80; i++)
              crt[i] = (' '&0xff) | 0x0700;
            endpos += 80;
          }
          pos -= pos%80;
        }
        // 退格键盘相应
        else if(c == C('H')){
          if(pos > startpos){
            int i;
            int rmline = 1;
            for(i = pos; i < pos+80 && pos%80 == 0; i++){
              if(crt[pos] != ((' '&0xff) | 0x0700)){
                rmline = 0;
                break;
              }
            }
            if(crt[pos] == ((' '&0xff) | 0x0700) && pos%80 == 0 && rmline){
              memmove(crt+pos, crt+pos+80, sizeof(crt[0])*(endpos-pos-80));
              for(i = endpos - 80; i < endpos; i++)
                crt[i] = (' '&0xff) | 0x0700;
              endpos -= 80;
              while(crt[--pos] == ((' '&0xff) | 0x0700) && pos%80 != 0);
              if(crt[pos] != ((' '&0xff) | 0x0700))
                pos++;
            }
            else{
              crt[--pos] = (' '&0xff) | 0x0700;
              for(i = pos; i < endpos; i++){
                if(i%80 == 79 && crt[i] == ((' '&0xff) | 0x0700))
                  break;
                crt[i] = crt[i+1];
              }
              if(pos%80 == 79){
                while(crt[--pos] == ((' '&0xff) | 0x0700) && pos%80 != 0);
                if(pos % 80 == 0 && crt[pos] == ((' '&0xff) | 0x0700)){
                  memmove(crt+pos, crt+pos+80, sizeof(crt[0])*(endpos-pos-80));
                  for(i = endpos - 80; i < endpos; i++)
                    crt[i] = (' '&0xff) | 0x0700;
                  endpos -= 80;
                }
                else
                  pos++;
              }
            }
          }
        }
        // 输入字符
        else{
          int i = pos + 79 - pos%80;
          while(crt[i] != ((' '&0xff) | 0x0700))
            i += 80;
          if(i < endpos){
            for( ; i > pos; i--)
              crt[i] = crt[i-1];
          }
          else{
            i = pos + 80 - pos%80;
            memmove(crt+i+80, crt+i, sizeof(crt[0])*(endpos-i));
            int j;
            for(j = i; j < i + 80; j++)
              crt[j] = (' '&0xff) | 0x0700;
            for( ; i > pos; i--)
              crt[i] = crt[i-1];
            endpos += 80;
          }
          crt[pos++] = (c&0xff) | 0x0700;
        }
        if((endpos/80) >= 24){  // Scroll up.
          memmove(crt, crt+80, sizeof(crt[0])*23*80);
          startpos -= 80;
          endpos -= 80;
          pos -= 80;
          int i;
          for(i = endpos; i < endpos + 80; i++)
            crt[i] = (' '&0xff) | 0x0700;
        }
        
        outb(CRTPORT, 14);
        outb(CRTPORT+1, pos>>8);
        outb(CRTPORT, 15);
        outb(CRTPORT+1, pos);
      }
      // 若用户键入Esc，则退出vim
      else if(c != 0){
        execvim = 0;
        firstvim = 1;
        int i, j;
        memset(content, 0, sizeof(char)*2000);
        for(i = startpos, j = 0; i < endpos; i++){
          if(crt[i] != ((' '&0xff) | 0x0700)){
            content[j++] = crt[i] & 0x00ff;
          }
          else{
            int k;
            for(k = i+1; (k%80) != 0 && crt[k] == ((' '&0xff) | 0x0700); k++);
            if(k%80 == 0){
              content[j++] = '\n';
              i = k - 1;
            }
            else{
              for(; crt[i] == ((' '&0xff) | 0x0700); i++)
                content[j++] = ' ';
              i--;
            }
          }
        }
        content[j++] = 0;
        outb(CRTPORT, 14);
        outb(CRTPORT+1, endpos>>8);
        outb(CRTPORT, 15);
        outb(CRTPORT+1, endpos);
      }
    }
    release(&input.lock);
    return;
  }

  acquire(&input.lock);
	iskbdtype = type;
	while ((c = getc()) >= 0){
		switch (c){
		case C('P'):  // Process listing.
			procdump();
			break;
		case C('U'):  // Kill line.
			while (input.e != input.w &&
				input.buf[(input.e - 1) % INPUT_BUF] != '\n'){
				input.e--;
				consputc(BACKSPACE);
			}
			break;
		case C('H'): case '\x7f':  // Backspace
			if (input.e - posoffset != input.w){
				input.e--;
				int i;
				for (i = 0; i < posoffset; i++)
					input.buf[(input.e - posoffset + i) % INPUT_BUF] = input.buf[(input.e - posoffset + i + 1) % INPUT_BUF];
				consputc(BACKSPACE);
			}
			break;
		default:
			if (c != 0 && input.e - input.r < INPUT_BUF){
				c = (c == '\r') ? '\n' : c;
				if (c != 0xe2 && c != 0xe3 && c != 0xe4 && c != 0xe5){
					if (c != '\n' && iskbdtype && posoffset > 0){
						int i;
						for (i = 0; i < posoffset; i++)
							input.buf[(input.e - i) % INPUT_BUF] = input.buf[(input.e - i - 1) % INPUT_BUF];
						input.buf[(input.e - posoffset) % INPUT_BUF] = c;
						input.e++;
					}
					else
						input.buf[input.e++ % INPUT_BUF] = c;
				}
				consputc(c);
				if (c == '\n' || c == C('D') || input.e == input.r + INPUT_BUF){
					if (c == '\n'){
						uint i = 0;
						if (input.w != input.e)
							memset(history.bufarray[history.top], 0, sizeof(history.bufarray[history.top]));
						for (i = input.w; i < input.e - 1; i++){
							history.bufarray[history.top][i - input.w] = input.buf[i % INPUT_BUF];
							historyno = -1;
						}
						if (input.w != input.e)
							history.top = (history.top + 1) % 100;
						if ((history.top - history.base + 100) % 100 == 1 && history.bufarray[history.top][0] != 0)
							history.base = history.top;
					}
					input.w = input.e;
					wakeup(&input.r);
				}
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

int
strmatch(const char *s, const char *m)
{
  for(; *s && *m;){
    if(*s == *m){
      m++;
      s++;
    }
    else
      return 0;
  }
  if(*m == 0)
    return 1;
  return 0;
}

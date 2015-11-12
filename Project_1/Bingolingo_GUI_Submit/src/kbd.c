#include "types.h"
#include "x86.h"
#include "defs.h"
#include "kbd.h"
#include "guilayout.h"
#include "message.h"

void keyBoardEvent(char number)
{
    KBDMsg* kmsg=(KBDMsg*)kalloc();
    kmsg->msg_type=KEYBOARD_MESSAGE;
    kmsg->key_value=number;
    passFocusEvent(bingolingo,kmsg);
}

int
kbdgetc(void)
{
  static uint shift;
  static uchar *charcode[4] = {
    normalmap, shiftmap, ctlmap, ctlmap
  };
  uint st, data, c;

  st = inb(KBSTATP);
  if((st & KBS_DIB) == 0)
    return -1;
  data = inb(KBDATAP);

  if(data == 0xE0){
    shift |= E0ESC;
    return 0;
  } else if(data & 0x80){
    // Key released
    data = (shift & E0ESC ? data : data & 0x7F);
    shift &= ~(shiftcode[data] | E0ESC);
    return 0;
  } else if(shift & E0ESC){
    // Last character was an E0 escape; or with 0x80
    data |= 0x80;
    shift &= ~E0ESC;
  }

  shift |= shiftcode[data];
  shift ^= togglecode[data];
  c = charcode[shift & (CTL | SHIFT)][data];
  if(shift & CAPSLOCK){
    if('a' <= c && c <= 'z')
      c += 'A' - 'a';
    else if('A' <= c && c <= 'Z')
      c += 'a' - 'A';
  }
    uint resi=data-0xe0;
    if (c!=0 || (resi>=0 && resi<=9))
    {
        if (c!=0)
            keyBoardEvent(c);
        else
            keyBoardEvent((uchar)(data & 0xff));
    }
  return c;
}

void
kbdintr(void)
{
  consoleintr(kbdgetc);
}

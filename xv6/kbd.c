#include "types.h"
#include "x86.h"
#include "defs.h"
#include "kbd.h"
#include "window.h"
//#include "gui.h"
#include "message.h"

static int flag_caps = 0;
static int flag_shift = 0;
//static int flag = 0;

void
kbdintr(void)
{
  uint ch;
  ch = inb(0x64);
  if((ch & 0x01) == 0)
  {
    //cprintf("no data\n");
    return;
  }

  ch = inb(0x60);

  //press down
  if((ch & 0x80) == 0)
  {
    //flag
    int flag_temp;
    flag_temp = shiftcode[ch];
    if(flag_temp != NO)
    {
      flag_shift = flag_temp;
      return;
    }

    //caps lock
    if(togglecode[ch] == CAPSLOCK)
    {
      //cprintf("caps\n");
      flag_caps = 1;
      return;
    }

    //get result
    char result;
    if(flag_caps == 0)
    {
      switch(flag_shift)
      {
        case SHIFT:
          result = shiftmap[ch];
          break;
        case CTL:
          result = ctlmap[ch];
          break;
        default:
          result = normalmap[ch];
          break;
      }
    }
    else
    {
      switch(flag_shift)
      {
        case SHIFT:
          result = normalmap[ch];
          break;
        case CTL:
          result = ctlmap[ch];
          break;
        default:
          result = shiftmap[ch];
          break;
      }
    }

    createMsg(MSG_KEYDOWN, 0, 0, result);


    //cprintf("ch: %d\n", ch);

    // if(ch == 1)
    //   flag = KBD_ESC;
    // else if(ch == 75)
    //   flag = KBD_LEFT;
    // else if(ch == 77)
    //   flag = KBD_RIGHT;
    // else if(ch == 72)
    //   flag = KBD_UP;
    // else if(ch == 80)
    //   flag = KBD_DOWN;
    // else
    //   flag = 0;

    // int cur_icon = WindowLine->next->Cur_icon;
    // if(cur_icon == ICON_TEXT)
    // {
    //   kbd_text(result, flag);
    // }
    // else if(cur_icon == ICON_PHOTO)
    //   photo(result, flag);
  }
  //release
  else
  {
    ch = ch & 0x7F;

    //caps lock
    if(togglecode[ch] == CAPSLOCK)
    {
      //cprintf("caps\n");
      flag_caps = 0;
    }

    //shift
    if(shiftcode[ch] == flag_shift)
    {
      //cprintf("shift\n");
      flag_shift = NO;
    }

    return;
  }
}

/*
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
  return c;
}
*/
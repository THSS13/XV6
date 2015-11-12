/*
**  Written by Levy, BingoLingo
**  Defines the event struct of different events
**  which will be used in the dom.onFucus as the
**  second parameter. WARNING that every event must
**  start with a uchar indicating which kind of
**  event it is.
*/
/*
**  Premise headers:
**      types.h
*/

typedef struct ori_focusEventPkg
{
    uchar _id;  //Must set as 0x00!
} focusEventPkg;

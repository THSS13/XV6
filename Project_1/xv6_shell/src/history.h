//Shell history

#ifndef HISTORY_H
#define HISTORY_H


#define H_NUMBER 11
#define H_LENGTH 128

struct history
{
    int curcmd;
    int lastcmd;
    int length;
    char record[H_NUMBER][H_LENGTH];
};


#endif

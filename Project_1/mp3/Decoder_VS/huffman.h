/**********************************************************************
 * MPEG/audio 编码/解码软件                                           *
 * VERSION 4.1                                                        *
 *********************************************************************/ 
#ifndef _HUFFMAN_H_ 
#define _HUFFMAN_H_ 
#define HUFFBITS unsigned long int
//#define HUFFBITS unsigned long
#define HTN 34
#define MXOFF 250
struct huffcodetab {
  char tablename[3];  /*字符, 包含 table_description  */
  unsigned int xlen;  
  unsigned int ylen;  
  unsigned int linbits; /* linbits  数目    */
  unsigned int linmax;  /*存储在linbits中的最大数目   */
  int ref;    /*a positive value indicates a reference*/
  unsigned int treelen; /*解码树长度    */
  unsigned char(*val)[2];/*解码树       */ 
};

extern struct huffcodetab ht[HTN];/* 全局内存块   */
        /* 所有huffcodtable headers的数组 */
        /* 0..31 Huffman code table 0..31 */
        /* 32,33 count1-tables      */
extern int read_decoder_table();
extern int huffman_decoder(struct huffcodetab *, int *, int*, int*, int*);

#endif

#include "types.h"
#include "stat.h"
#include "user.h"
#include "math.h"
#include "fcntl.h"
#include "common.h"

char *layer_names[3] = { "I", "II", "III" };
int bitrate[3][15] = {
	{0,32,64,96,128,160,192,224,256,288,320,352,384,416,448},
	{0,32,48,56,64,80,96,112,128,160,192,224,256,320,384},
	{0,32,40,48,56,64,80,96,112,128,160,192,224,256,320}
};
double  s_freq[4] = {44.1, 48, 32, 0};
char *mode_names[4] = { "stereo", "j-stereo", "dual-ch", "single-ch" };

int OpenTableFile(char *name)
{
	char fulname[80];
	int f;

	fulname[0] = '\0';
	strcpy(fulname, name);
	//-1 ?
	if( (f=open(fulname,O_RDWR))==-1 ) {
		printf(0,"\nOpenTable: could not find %s\n", fulname);
    }
    return f;
}

void WriteHdr(struct frame_params *fr_ps)
{
	layer *info = fr_ps->header;
	iBreak((int)info);

	// printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
	// 	info->version, info->lay, !info->error_protection,
	// 	info->bitrate_index, info->sampling_frequency, info->padding);

	// printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
	// 	info->extension, info->mode, info->mode_ext,
	// 	info->copyright, info->original, info->emphasis);

	// printf(0, "layer=%s, tot bitrate=%d, sfrq=%d, mode=%s, ",
	// 	layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
	// 	info->sampling_frequency, mode_names[info->mode]);

	// printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
	// 	fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
}

void *mem_alloc(unsigned long block, char *item)
{
	void *ptr;
	ptr = (void *)malloc((unsigned long)block);
	if (ptr != 0)
		memset(ptr, 0, block);
	else{
		printf(0, "Unable to allocate %s\n", item);
		exit();
	}
	return ptr;
}

void alloc_buffer(Bit_stream_struct *bs, int size)
{
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
	bs->buf_size = size;
}

void desalloc_buffer(Bit_stream_struct *bs)
{
	free(bs->buf);
}

void open_bit_stream_r(Bit_stream_struct *bs, char *bs_filenam, int size)
{
	//register unsigned char flag = 1;

	if ((bs->pt = open(bs_filenam, O_RDWR)) == -1) {
		printf(0, "Could not find \"%s\".\n", bs_filenam);
		exit();
	}

	bs->format = BINARY;
	alloc_buffer(bs, size);
	bs->buf_byte_idx=0;
	bs->buf_bit_idx=0;
	bs->totbit=0;
	bs->mode = READ_MODE;
	bs->eob = FALSE;
	bs->eobs = FALSE;
}

void close_bit_stream_r(Bit_stream_struct *bs)
{
	close(bs->pt);
	desalloc_buffer(bs);
}

int end_bs(Bit_stream_struct *bs)
{
  return(bs->eobs);
}


unsigned long sstell(Bit_stream_struct *bs)
{
  return(bs->totbit);
}


void refill_buffer(Bit_stream_struct *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;

	while ((i>=0) && (!bs->eob)) {
			n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
		if (!n)
		bs->eob= i+1;
	}
}


int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struct *bs)
{
   unsigned int bit;
   register int i;

   bs->totbit++;

   if (!bs->buf_bit_idx) {
        bs->buf_bit_idx = 8;
        bs->buf_byte_idx--;
        if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
             if (bs->eob)
                bs->eobs = TRUE;
             else {
                for (i=bs->buf_byte_idx; i>=0;i--)
                  bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
                refill_buffer(bs);
                bs->buf_byte_idx = bs->buf_size-1;
             }
        }
   }
   bit = bs->buf[bs->buf_byte_idx]&mask[bs->buf_bit_idx-1];
   bit = bit >> (bs->buf_bit_idx-1);
   bs->buf_bit_idx--;
   return(bit);
}

int putmask[9]={0x0, 0x1, 0x3, 0x7, 0xf, 0x1f, 0x3f, 0x7f, 0xff};

unsigned long getbits(Bit_stream_struct *bs, int N)
{
	unsigned long val=0;
	register int i;
	register int j = N;
	register int k, tmp;

	if (N > MAX_LENGTH)
		printf(0,"Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);

	bs->totbit += N;
	while (j > 0) {
		if (!bs->buf_bit_idx) {
			bs->buf_bit_idx = 8;
			bs->buf_byte_idx--;
			if ((bs->buf_byte_idx < MINIMUM) || (bs->buf_byte_idx < bs->eob)) {
				if (bs->eob)
					bs->eobs = TRUE;
				else {
					for (i=bs->buf_byte_idx; i>=0;i--)
						bs->buf[bs->buf_size-1-bs->buf_byte_idx+i] = bs->buf[i];
						refill_buffer(bs);
					bs->buf_byte_idx = bs->buf_size-1;
				}
			}
		}
		k = MIN(j, bs->buf_bit_idx);
		tmp = bs->buf[bs->buf_byte_idx]&putmask[bs->buf_bit_idx];
		tmp = tmp >> (bs->buf_bit_idx-k);
		val |= tmp << (j-k);
		bs->buf_bit_idx -= k;
		j -= k;
	}
	return val;
}


int seek_sync(Bit_stream_struct *bs, unsigned long sync, int N)
{
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;

	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	val = getbits(bs, N);
	while (((val&maxi) != sync) && (!end_bs(bs))) {
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	if (end_bs(bs))
		return(0);
	else
		return(1);
}

int js_bound(int lay, int m_ext)
{
	static int jsb_table[3][4] =  {
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
        exit();
    }
	return(jsb_table[lay-1][m_ext]);
}

void hdr_to_frps(struct frame_params *fr_ps)
{
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */

	fr_ps->actual_mode = hdr->mode;
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
	fr_ps->sblimit = SBLIMIT;
	if(hdr->mode == MPG_MD_JOINT_STEREO)
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
	else
		fr_ps->jsbound = fr_ps->sblimit;
}

#define BUFSIZE 4096   
static unsigned int buf[BUFSIZE];   
static unsigned int buf_bit_idx=8;   
static unsigned long offset=0, totbit=0, buf_byte_idx=0;

void hputbuf(unsigned int val, int N)
{
	// printf(1, "hputbuf %d, %d\n", val, N);
	if (N != 8) {
		printf(0,"Not Supported yet!!\n");
		exit();
	}
	buf[offset % BUFSIZE] = val;
	offset++;
}

unsigned long hsstell()
{
	// printf(1,"1111\n");
	// printf(1, "%d\n", totbit);
	return(totbit);
}

unsigned long hgetbits(int N)
{
	unsigned long val=0;   
    register int j = N;   
    register int k, tmp;
   
/*  
     if (N > MAX_LENGTH)  
         printf("Cannot read or write more than %d bits at a time.\n", MAX_LENGTH);  
*/   
    totbit += N;   
    while (j > 0) {   
        if (!buf_bit_idx) {   
            buf_bit_idx = 8;   
            buf_byte_idx++;   
            if (buf_byte_idx > offset) {   
            	printf(1, "%d, %d\n", buf_byte_idx, offset);
                printf(0,"Buffer overflow !!\n");   
                exit();   
            }   
        }   
        k = MIN(j, buf_bit_idx);   
        tmp = buf[buf_byte_idx%BUFSIZE]&putmask[buf_bit_idx];   
        tmp = tmp >> (buf_bit_idx-k);   
        val |= tmp << (j-k);   
        buf_bit_idx -= k;   
        j -= k;   
    }   
    return(val);   
}


unsigned int hget1bit()
{
	return(hgetbits(1));
}


void rewindNbits(int N)
{
	totbit -= N;   
    buf_bit_idx += N;   
    while( buf_bit_idx >= 8 ){   
        buf_bit_idx -= 8;   
        buf_byte_idx--;   
    }   
}


void rewindNbytes(int N)
{
	totbit -= N*8;   
    buf_byte_idx -= N;
}

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

	printf(0, "HDR:  sync=FFF, id=%X, layer=%X, ep=%X, br=%X, sf=%X, pd=%X, ",
		info->version, info->lay, !info->error_protection,
		info->bitrate_index, info->sampling_frequency, info->padding);

	printf(0, "pr=%X, m=%X, js=%X, c=%X, o=%X, e=%X\n",
		info->extension, info->mode, info->mode_ext,
		info->copyright, info->original, info->emphasis);

	printf(0, "layer=%s, tot bitrate=%d, sfrq=%.1f, mode=%s, ",
		layer_names[info->lay-1], bitrate[info->lay-1][info->bitrate_index],
		s_freq[info->sampling_frequency], mode_names[info->mode]);

	printf(0, "sblim=%d, jsbd=%d, ch=%d\n",
		fr_ps->sblimit, fr_ps->jsbound, fr_ps->stereo);
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

void alloc_buffer(Bit_stream_struc *bs, int size)
{
	bs->buf = (unsigned char *) mem_alloc(size*sizeof(unsigned char), "buffer");
	bs->buf_size = size;
}

void desalloc_buffer(Bit_stream_struc *bs)
{
	free(bs->buf);
}

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size)
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

void close_bit_stream_r(Bit_stream_struc *bs)
{
	close(bs->pt);
	desalloc_buffer(bs);
}

int end_bs(Bit_stream_struc *bs)
{
  return(bs->eobs);
}


unsigned long sstell(Bit_stream_struc *bs)
{
  return(bs->totbit);
}


unsigned char buffer[4096]; // new add
void refill_buffer(Bit_stream_struc *bs)
{
	register int i=bs->buf_size-2-bs->buf_byte_idx;
	register unsigned long n=1;
	n = read(bs->pt, buffer, i+1);	// new add
	int j;
	int bound;
	if(n){
		j=0;
		bound = i-n+1;
		while (i>=bound) {
			// n=read(bs->pt, &bs->buf[i--], sizeof(unsigned char));
			// if (!n)
			// 	bs->eob= i+1;
			bs->buf[i--] = buffer[j++];
		}
		bs->eob = bound;
	}
}



int mask[8]={0x1, 0x2, 0x4, 0x8, 0x10, 0x20, 0x40, 0x80};

unsigned int get1bit(Bit_stream_struc *bs)
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

unsigned long getbits(Bit_stream_struc *bs, int N)
{
	unsigned long val=0;
	register int i;
	register int j = N;
	register int k, tmp;

	// printf(0, "N=%d MAX_LENGTH=%d\n", N, MAX_LENGTH);
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


int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N)
{
	// printf(0, "test point 1 in seek_sync\n");
	unsigned long aligning;
	unsigned long val;
	long maxi = (int)pow(2.0, (double)N) - 1;

	// printf(0, "test point 2 in seek_sync\n");
	// ALIGNING = 8
	aligning = sstell(bs)%ALIGNING;
	if (aligning)
		getbits(bs, (int)(ALIGNING-aligning));

	// printf(0, "test point 3 in seek_sync\n");
	val = getbits(bs, N);

	// printf(0, "in the seek sync function maxi=%d aligning=%d\n", maxi, aligning);

	while (((val&maxi) != sync) && (!end_bs(bs))) {
		val <<= ALIGNING;
		val |= getbits(bs, ALIGNING);
	}

	// printf(0, "after seek sync %d %d\n", bs->buf_byte_idx, bs->buf_bit_idx);

	if (end_bs(bs))
		return(0);
	else
		return(1);
}

int js_bound(int lay, int m_ext)
{
	//printf(1, "test point 1 in js_bound\n");
	static int jsb_table[3][4] =  {
		{ 4, 8, 12, 16 },
		{ 4, 8, 12, 16},
		{ 0, 4, 8, 16}
	};  /* lay+m_e -> jsbound */

	//printf(1, "test point 2 in js_bound\n");
    if(lay<1 || lay >3 || m_ext<0 || m_ext>3) {
    	//printf(1, "test point 3 in js_bound\n");
        printf(0, "js_bound bad layer/modext (%d/%d)\n", lay, m_ext);
        exit();
    }
    //printf(1, "test point 4 in js_bound");
	return(jsb_table[lay-1][m_ext]);
}

void hdr_to_frps(struct frame_params *fr_ps)
{
	//printf(1, "test point 1 in hdr_to_frps\n");
	layer *hdr = fr_ps->header;     /* (or pass in as arg?) */
	//printf(1, "test point 2 in hdr_to_frps\n");
	fr_ps->actual_mode = hdr->mode;
	//printf(1, "test point 3 in hdr_to_frps\n");
	fr_ps->stereo = (hdr->mode == MPG_MD_MONO) ? 1 : 2;
	//printf(1, "test point 4 in hdr_to_frps\n");
	fr_ps->sblimit = SBLIMIT;
	//printf(1, "test point 5 in hdr_to_frps\n");
	if(hdr->mode == MPG_MD_JOINT_STEREO)
		fr_ps->jsbound = js_bound(hdr->lay, hdr->mode_ext);
	else
		fr_ps->jsbound = fr_ps->sblimit;
	//printf(1, "test point 6 in hdr_to_frps\n");
}

void hputbuf(unsigned int val, int N)
{
	if (N != 8) {
		printf(0,"Not Supported yet!!\n");
		exit();
	}
	getCoreBuf(1, val);
}

unsigned long hsstell()
{
	return getCoreBuf(2, 0);
}

unsigned long hgetbits(int N)
{

	return getCoreBuf(3, N);
}


unsigned int hget1bit()
{
	return(hgetbits(1));
}


void rewindNbits(int N)
{
	getCoreBuf(4, N);
}


void rewindNbytes(int N)
{
	getCoreBuf(5, N);
}

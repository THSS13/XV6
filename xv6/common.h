#ifndef	_COMMON_H_
#define	_COMMON_H_


/* MPEG 头定义- Mode Values */
#define	MPG_MD_STEREO           0
#define	MPG_MD_JOINT_STEREO     1
#define	MPG_MD_DUAL_CHANNEL     2
#define	MPG_MD_MONO             3

#define	SYNC_WORD			(long)0xfff
#define	SYNC_WORD_LENGTH	12

#define	ALIGNING			8

#define	MINIMUM				4    /* 缓冲区最小值（ bytes ）*/
#define	MAX_LENGTH			32	/* 从比特流读到词的最大长度 */

#define	BINARY				0	/*二进制输入文件*/
#define	READ_MODE			0	/*解码模式*/

#define	FALSE				0
#define	TRUE				1

#define	MIN(A, B)			((A) < (B) ? (A) : (B))

#define	SBLIMIT				32
#define	SSLIMIT				18
#define	BUFFER_SIZE			4096
#define	HAN_SIZE			512
#define	SCALE				32768

#define	PI					3.14159265358979
#define	PI64				PI/64
#define	PI4					PI/4

/* 头信息 Structure */
typedef struct {
    int version;
    int lay;
    int error_protection;
    int bitrate_index;
    int sampling_frequency;
    int padding;
    int extension;
    int mode;
    int mode_ext;
    int copyright;
    int original;
    int emphasis;
} layer, *the_layer;


/* Header中解释祯参数的父结构 */
struct frame_params{
    layer       *header;        /* 头信息 */
    int         actual_mode;    /* when writing IS, may forget if 0 chs */
    int         stereo;         /* 1 为 mono, 2 为 stereo */
    int         jsbound;        /* 立体声编码的第一个波段 */
    int         sblimit;        /* 所有子带的数量 */
} ;

typedef struct  bit_stream_struc {
    int        pt;            /* 比特流设备指针 */
    unsigned char *buf;         /* 比特流缓冲 */
    int         buf_size;       /* 比特流缓冲大小( bytes) */
    long        totbit;         /* 比特流的比特计数 */
    int         buf_byte_idx;   /* 指向缓冲区首字节 */
    int         buf_bit_idx;    /* 指向缓冲区首字节首比特 */
    int         mode;           /* 比特流打开模式（读/写）*/
    int         eob;            /* 缓冲索引结束 */
    int         eobs;           /* 比特流结束标志 */
    char        format;

    /*  rd 模式文件格式 (BINARY/ASCII) */
} Bit_stream_struc;

/* Layer III 附加信息 */
struct III_side_info_t {
	unsigned main_data_begin;
	unsigned private_bits;
	struct {
		unsigned scfsi[4];
		struct gr_info_s {
			unsigned part2_3_length;
			unsigned big_values;
			unsigned global_gain;
			unsigned scalefac_compress;
			unsigned window_switching_flag;
			unsigned block_type;
			unsigned mixed_block_flag;
			unsigned table_select[3];
			unsigned subblock_gain[3];
			unsigned region0_count;
			unsigned region1_count;
			unsigned preflag;
			unsigned scalefac_scale;
			unsigned count1table_select;
		} gr[2];
	} ch[2];
};

typedef struct {
	int l[23];			/* [cb] */
	int s[3][13];		/* [window][cb] */
} III_scalefac_t[2];	/* [ch] */

int OpenTableFile(char *name);

void WriteHdr(struct frame_params *fr_ps);

void *mem_alloc(unsigned long block, char *item);
void alloc_buffer(Bit_stream_struc *bs, int size);
void desalloc_buffer(Bit_stream_struc *bs);

void open_bit_stream_r(Bit_stream_struc *bs, char *bs_filenam, int size);
void close_bit_stream_r(Bit_stream_struc *bs);
int	end_bs(Bit_stream_struc *bs);
unsigned long sstell(Bit_stream_struc *bs);
void refill_buffer(Bit_stream_struc *bs);

unsigned int get1bit(Bit_stream_struc *bs);
unsigned long getbits(Bit_stream_struc *bs, int N);
int seek_sync(Bit_stream_struc *bs, unsigned long sync, int N);

int js_bound(int lay, int m_ext);
void hdr_to_frps(struct frame_params *fr_ps);

void hputbuf(unsigned int val, int N);
unsigned long hsstell();
unsigned long hgetbits(int N);
unsigned int hget1bit();
void rewindNbits(int N);
void rewindNbytes(int N);

#endif	/*_COMMON_H_*/

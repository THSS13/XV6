#ifndef	_DECODE_H_
#define	_DECODE_H_

#include "common.h"

void decode_info(Bit_stream_struc*, struct frame_params*);
void III_get_side_info(Bit_stream_struc *bs, struct III_side_info_t *si, struct frame_params *fr_ps);
void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps);

void initialize_huffman();
void III_hufman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps);

void III_dequantize_sample(long int[SBLIMIT][SSLIMIT], double [SBLIMIT][SSLIMIT], III_scalefac_t *, struct gr_info_s *, int, struct frame_params *);
void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps);
void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps);
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps);

void inv_mdct(double in[18], double out[36], int block_type);
void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps);

void create_syn_filter(double filter[64][SBLIMIT]);
void read_syn_window(double window[HAN_SIZE]);
int SubBandSynthesis (double *bandPtr, int channel, short *samples);

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, unsigned long *psampFrames);
void buffer_CRC(Bit_stream_struc *bs, unsigned int *old_crc);
int main_data_slots(struct frame_params fr_ps);

extern double gb_window[HAN_SIZE];
#endif	//_DECODE_H_

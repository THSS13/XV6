#include "types.h"
#include "user.h"
#include "sound.h"
#include "common.h"
#include "decode.h"
#include "fcntl.h"


// void output_bs(Bit_stream_struc *bs)
// {
// 	printf(0, "Bit Stream Buffer:\n");
// 	// printf(0, "pt=%d ", bs->pt);
// 	// printf(0, "buf=%x ", bs->buf);
// 	printf(0, "buf_size=%d ", bs->buf_size);
// 	printf(0, "totbit=%d ", bs->totbit);
// 	printf(0, "byte_idx=%d ", bs->buf_byte_idx);
// 	printf(0, "bit_idx=%d ", bs->buf_bit_idx);
// 	printf(0, "mode=%d ", bs->mode);
// 	printf(0, "eob=%d ", bs->eob);
// 	printf(0, "eobs=%d ", bs->eobs);
// 	printf(0, "format=%d\n", bs->format);
// }

// void output_buf()
// {
// 	printf(0, "Core Buffer:\n");
// 	printf(0, "totbit=%d ", getCoreBuf(2, 0));
// 	printf(0, "buf_byte_idx=%d ", getCoreBuf(6, 0));
// 	printf(0, "buf_bit_idx=%d ", getCoreBuf(7, 0));
// 	printf(0, "offset=%d\n", getCoreBuf(8, 0));
// }

// void output_frps(struct frame_params *fr_ps)
// {
//     printf(0, "version=%d ", fr_ps->header->version);
//     printf(0, "lay=%d ", fr_ps->header->lay);
//     printf(0, "error_protection=%d ", fr_ps->header->error_protection);
//     printf(0, "bitrate_index=%d ", fr_ps->header->bitrate_index);
//     printf(0, "sampling_frequency=%d ", fr_ps->header->sampling_frequency);
//     printf(0, "padding=%d ", fr_ps->header->padding);
//     printf(0, "extension=%d ", fr_ps->header->extension);
//     printf(0, "mode=%d ", fr_ps->header->mode);
//     printf(0, "mode_ext=%d ", fr_ps->header->mode_ext);
//     printf(0, "copyright=%d ", fr_ps->header->copyright);
//     printf(0, "original=%d ", fr_ps->header->original);
//     printf(0, "emphasis=%d ", fr_ps->header->emphasis);
// 	printf(0, "actual_mode=%d ", fr_ps->actual_mode);
// 	printf(0, "stereo=%d ", fr_ps->stereo);
// 	printf(0, "jsbound=%d ", fr_ps->jsbound);
// 	printf(0, "sblimit=%d\n", fr_ps->sblimit);
// }

// void output_side_info(struct III_side_info_t *si)
// {
// 	printf(0, "main_data_begin=%d\n", si->main_data_begin);
// 	printf(0, "private_bits=%d\n", si->private_bits);
// 	int i, j;
// 	for (i = 0; i < 2; i++) {
// 		for (j = 0; j < 4; j++) {
// 			printf(0, "scfsi[%d]=%d  ", j, si->ch[i].scfsi[j]);
// 		}
// 		printf(0, "\n");
// 		for (j = 0; j < 2; j++) {
// 			printf(0, "gr[%d].part2_3_length=%d  ", j, si->ch[i].gr[j].part2_3_length);
// 			printf(0, "gr[%d].big_values=%d  ", j, si->ch[i].gr[j].big_values);
// 			printf(0, "gr[%d].global_gain=%d  ", j, si->ch[i].gr[j].global_gain);
// 			printf(0, "gr[%d].scalefac_compress=%d  ", j, si->ch[i].gr[j].scalefac_compress);
// 			printf(0, "gr[%d].window_switching_flag=%d  ", j, si->ch[i].gr[j].window_switching_flag);
// 			printf(0, "gr[%d].block_type=%d  ", j, si->ch[i].gr[j].block_type);
// 			printf(0, "gr[%d].mixed_block_flag=%d  ", j, si->ch[i].gr[j].mixed_block_flag);

// 			printf(0, "gr[%d].region0_count=%d  ", j, si->ch[i].gr[j].region0_count);
// 			printf(0, "gr[%d].region1_count=%d  ", j, si->ch[i].gr[j].region1_count);
// 			printf(0, "gr[%d].preflag=%d  ", j, si->ch[i].gr[j].preflag);
// 			printf(0, "gr[%d].scalefac_scale=%d  ", j, si->ch[i].gr[j].scalefac_scale);
// 			printf(0, "gr[%d].count1table_select=%d  ", j, si->ch[i].gr[j].count1table_select);
// 			printf(0, "\n");
// 		}
// 		printf(0, "\n");
// 	}
// 	printf(0, "\n");
// }


// double lr[2][SBLIMIT][SSLIMIT],ro[2][SBLIMIT][SSLIMIT];
// long int is[SBLIMIT][SSLIMIT];

// double re[SBLIMIT][SSLIMIT];
// double hybridIn[SBLIMIT][SSLIMIT];  /* Hybrid filter input */
// double hybridOut[SBLIMIT][SSLIMIT]; /* Hybrid filter out */
// double polyPhaseIn[SBLIMIT];        /* PolyPhase Input. */


// void single_process() 
// {
// 	/*
// 	int fd;
// 	fd = open("out.pcm", O_RDWR);
// 	if(fd < 0) {
// 		printf(0, "File open error\n");
// 		exit();
// 	}
// 	*/
	
// 	// printf(0, "enter main\n");

// 	Bit_stream_struc  bs;
// 	struct frame_params fr_ps;
// 	struct III_side_info_t III_side_info; 
// 	III_scalefac_t III_scalefac;
	
// 	unsigned int old_crc;
// 	layer info;
// 	int sync;
// 	unsigned long bitsPerSlot;
// 	unsigned long sample_frames;
	
// 	typedef short PCM[2][SSLIMIT][SBLIMIT];
// 	PCM *pcm_sample;
// 	pcm_sample = (PCM *) mem_alloc((long) sizeof(PCM), "PCM Samp");
	
// 	//setSampleRate(44100);

// 	/*
// 	if (argc==1) {
// 		printf(1,"Useage:decode file.mp3 output.pcm\n");
// 		return;
// 	}
// 	*/
// 	setSampleRate(44100);
// 	fr_ps.header = &info;
	
//     open_bit_stream_r(&bs, "in.mp3", BUFFER_SIZE);
// 	// output_bs(&bs);
// 	// output_buf();
	
// 	int frame_Num = 0;

	

// 	int count = 0;
// 	while(!end_bs(&bs)) {
// 		count = count + 1;
// 		if (count > 10)
// 			break;
// 		// printf(0, "count=%d\n", count);

// 		// printf(0, "before seek_sync\n");
// 		sync = seek_sync(&bs, SYNC_WORD, SYNC_WORD_LENGTH);
// 		// output_bs(&bs);
// 		// output_buf();
		
// 		// printf(0, "after open\n");

// 		decode_info(&bs, &(fr_ps));

// 		// printf(0, "after decode_info\n");
// 		// output_bs(&bs);

// 		hdr_to_frps(&(fr_ps));
// 		// printf(0, "after hdr_to_frps\n");
// 		// output_bs(&bs);

// 		frame_Num = frame_Num + 1;
// 		printf(0, "read frame: %d\n", frame_Num);

// 		if (info.error_protection)
// 			buffer_CRC(&bs, &old_crc);

// 		// output_bs(&bs);
// 		// output_buf();

// 		switch (info.lay) {
// 		case 3:
// 			{
// 				int nSlots, main_data_end, flush_main;
// 				int bytes_to_discard;
// 				static int frame_start = 0;

// 				bitsPerSlot = 8;
// 				// printf(0, "before get side info\n");
// 				III_get_side_info(&bs, &(III_side_info), &(fr_ps));
// 				// printf(0, "After get side info\n");
// 				// output_bs(&bs);
// 				// output_buf();
				
// 				nSlots = main_data_slots(fr_ps);
// 				// printf(0, "After main data slots\n");
// 				// output_bs(&bs);
// 				// output_buf();

// 				for (; nSlots > 0; nSlots--)  /* read main data. */
// 					hputbuf((unsigned int) getbits(&bs,8), 8);
// 				// printf(0, "After hputbuf\n");
// 				// output_bs(&bs);
// 				// output_buf();
				
// 				main_data_end = hsstell() / 8; /*of privious frame*/

// 				// printf(0, "after hsstell 1\n");
// 				if ( (flush_main=(hsstell() % bitsPerSlot))) {
// 					// printf(0, "bitsPerSlot-flush_main=%d\n", (int)(bitsPerSlot - flush_main));
// 					hgetbits((int)(bitsPerSlot - flush_main));
// 					main_data_end ++;
// 				}
// 				// output_bs(&bs);
// 				// output_buf();
// 				// printf(0, "main_data_end=%d\n", main_data_end);

// 				// printf(0, "after hsstel 2\n");
// 				bytes_to_discard = frame_start - main_data_end - III_side_info.main_data_begin ;
// 				if( main_data_end > 4096 ) {   
// 					frame_start -= 4096;
// 					rewindNbytes( 4096 );
// 				}
// 				// printf(0, "before main data slots 2\n");
// 				frame_start += main_data_slots(fr_ps);
// 				// printf(0, "frame_start=%d\n", frame_start);
// 				// printf(0, "discard : %d\n", bytes_to_discard);
// 				if (bytes_to_discard < 0) {
// 					// printf(0, "discard: %d %d %d\n", frame_start, main_data_end, III_side_info.main_data_begin);
// 					printf(0, "Not enough main data to decode frame %d.  Frame discarded.\n", frame_Num); 
// 					break;
// 				}
// 				// printf(0, "bytes_to_discard=%d\n", bytes_to_discard);
// 				for (; bytes_to_discard > 0; bytes_to_discard--) hgetbits(8);
// 				// printf(0, "before really decoding\n");
// 				int clip = 0,gr,ch,sb,ss;

// 				// output_bs(&bs);
// 				// output_buf();

// 				for (gr=0;gr<2;gr++) {
// 					//主解码
// 					memset(lr, 0, sizeof(lr));
// 					memset(ro, 0, sizeof(ro));
// 					for (ch=0; ch<fr_ps.stereo; ch++) {
// 						/*保存量化数据*/
// 						memset(is, 0, sizeof(is));
// 						int part2_start;
// 						part2_start = hsstell();
// 						// printf(0, "part2_start=%d\n", part2_start);

// 						// printf(0, "gr=%d ch=%d\n", gr, ch);
// 						// output_bs(&bs);
// 						// output_buf();

// 						III_get_scale_factors(&III_scalefac, &(III_side_info), gr, ch, &(fr_ps));
						
// 						// output_bs(&bs);
// 						// output_buf();		
		    			
// 		    			III_hufman_decode(is, &(III_side_info), ch, gr, part2_start, &(fr_ps));
// 		    			/*
// 		    			int i, j;
// 		    			for (i = 0; i < SBLIMIT; i++) 
// 		    				for (j = 0; j < SSLIMIT; j++) {
// 		    					if (gr == 1 && ch == 1 && is[i][j] != 0) {
// 		    						printf(0, "is[%d][%d]=%d ", i, j, is[i][j]);
// 		    					}
// 		    				}
// 		    			printf(0, "\n");
// 						*/
// 						// output_side_info2(&III_side_info);
// 						// output_frps(&fr_ps);
// 		    			III_dequantize_sample(is, ro[ch], &III_scalefac, &(III_side_info.ch[ch].gr[gr]), ch, &(fr_ps));
// 		    			/*
// 		    			int i, j;
// 		    			for (i = 0; i < SBLIMIT; i++)
// 							for (j = 0; j < SSLIMIT; j++) {
// 								if (gr == 1 && ch == 1 && ro[ch][i][j] != 0) {
// 									unsigned int *p = (unsigned int*)&ro[ch][i][j];
// 									printf(0, "ro[%d][%d][%d]=%x%x  ", ch, i, j, *p, *(p+1));
// 								}
// 							}
// 						printf(0, "\n");
// 						*/
// 					}
// 					// printf(0, "before stereo\n");
// 					III_stereo(ro, lr, &III_scalefac, &(III_side_info.ch[0].gr[gr]), &fr_ps);
// 					/*
// 					int i, j;
// 	    			for (i = 0; i < SBLIMIT; i++)
// 						for (j = 0; j < SSLIMIT; j++) {
// 							if (gr == 0 && lr[0][i][j] != 0) {
// 								unsigned int *p = (unsigned int*)&lr[0][i][j];
// 								printf(0, "lr[%d][%d][%d]=%x%x  ", 0, i, j, *p, *(p+1));
// 							}
// 						}
// 					printf(0, "\n");
// 					*/
// 					for (ch=0; ch<fr_ps.stereo; ch++) {
// 						//double re[SBLIMIT][SSLIMIT];
// 						//double hybridIn[SBLIMIT][SSLIMIT];  /* Hybrid filter input */
// 						//double hybridOut[SBLIMIT][SSLIMIT]; /* Hybrid filter out */
// 						//double polyPhaseIn[SBLIMIT];        /* PolyPhase Input. */

// 						memset(re, 0, sizeof(re));
// 						memset(hybridIn, 0, sizeof(hybridIn));
// 						memset(hybridOut, 0, sizeof(hybridOut));
// 						memset(polyPhaseIn, 0, sizeof(polyPhaseIn));

// 						III_reorder(lr[ch], re, &(III_side_info.ch[ch].gr[gr]), &fr_ps);
// 						/*
// 						int i, j;
// 		    			for (i = 0; i < SBLIMIT; i++)
// 							for (j = 0; j < SSLIMIT; j++) {
// 								if (gr == 0 && ch == 0 && re[i][j] != 0) {
// 									unsigned int *p = (unsigned int*)&re[i][j];
// 									printf(0, "re[%d][%d]=%x%x  ", i, j, *p, *(p+1));
// 								}
// 							}
// 						printf(0, "\n");
// 						*/

// 						//抗锯齿处理
// 						III_antialias(re, hybridIn, &(III_side_info.ch[ch].gr[gr]), &fr_ps);
// 						/*
// 						int i, j;
// 		    			for (i = 0; i < SBLIMIT; i++)
// 							for (j = 0; j < SSLIMIT; j++) {
// 								if (gr == 0 && ch == 0 && hybridIn[i][j] != 0) {
// 									unsigned int *p = (unsigned int*)&hybridIn[i][j];
// 									printf(0, "hybridIn[%d][%d]=%x%x  ", i, j, *p, *(p+1));
// 								}
// 							}
// 						printf(0, "\n");
// 						*/

// 						//IMDCT
// 						for (sb=0; sb<SBLIMIT; sb++) { 
// 							/* Hybrid synthesis. */
// 							III_hybrid(hybridIn[sb], hybridOut[sb], sb, ch,	&(III_side_info.ch[ch].gr[gr]), &fr_ps);
// 						}

// 						for (sb=0; sb<SBLIMIT; sb++)
// 							for (ss=0;ss<18;ss++)	//多相频率倒置
// 								if ((ss%2) && (sb%2))
// 									hybridOut[sb][ss] = -hybridOut[sb][ss];

// 						/*
// 						int i, j;
// 		    			for (i = 0; i < SBLIMIT; i++)
// 							for (j = 0; j < SSLIMIT; j++) {
// 								if (gr == 1 && ch == 1 && hybridOut[i][j] != 0) {
// 									unsigned int *p = (unsigned int*)&hybridOut[i][j];
// 									printf(0, "hybridOUt[%d][%d]=%x%x  \n", i, j, *p, *(p+1));
// 								}
// 							}
// 						printf(0, "\n");
// 						*/

// 						for (ss=0;ss<18;ss++) {
// 							//多相合成
// 							for (sb=0; sb<SBLIMIT; sb++)
// 								polyPhaseIn[sb] = hybridOut[sb][ss];						
// 							//子带合成
// 							clip += SubBandSynthesis(polyPhaseIn, ch, &((*pcm_sample)[ch][ss][0]));
// 						}

// 						/*
// 						int i, j;
// 		    			for (i = 0; i < SBLIMIT; i++)
// 							for (j = 0; j < SSLIMIT; j++) {
// 								if (gr == 1 && ch == 1 && i == 0 && (*pcm_sample)[ch][j][i] != 0) {
// 									short p = (*pcm_sample)[ch][j][i];
// 									printf(0, "pcm_sample[%d][%d][%d]=%x%x%x%x  \n", ch, j, i, p>>12&15, p>>8&15, p>>4&15, p&15);
// 								}
// 							}
// 						printf(0, "\n");
// 						*/
						
// 					}
// 					//PCM输出
// 					/* Output PCM sample points for one granule(颗粒). */
// 					//out_fifo(*pcm_sample, 18, &(fr_ps), &sample_frames);
// 					//if (frame_Num == 10) 
// 					out_fifo(*pcm_sample, 18, &fr_ps, 0, &sample_frames);
// 				}
// 				// if(clip > 0)
// 					// printf(1,"\n%d samples clipped.\n", clip);
// 			}
// 			break;
// 		default:
// 			printf(1, "Only layer 3 is supported!\n");
// 			break;
// 		}
// 	}
// 	close_bit_stream_r(&bs);
// 	//close(fd);
// 	printf(1, "Playing done.\n");
// 	//kill(pid);
// 	//kill(decodepid);
// 	//kill(mp3pid);
// 	//wait();
// 	//wait();
// 	//wait();
// 	exit();
// }



Bit_stream_struc  bs;
struct frame_params fr_ps;
struct III_side_info_t III_side_info; 
unsigned int old_crc;
unsigned long bitsPerSlot;
layer info;
int sync;
int frame_Num = 0;


int main(int argc, char**argv)
{
	int playpid = fork();
	if (playpid == 0) {
		exec("decode", argv);
	}

	int pid = 0;//fork();
	// if (pid == 0) {
	// 	//exec("sh",argv);
	// }

	int decodepid = fork();
	if (decodepid == 0) {
		exec("mp3dec", argv);
	}

	// single_process();

	setSampleRate(44100);

	fr_ps.header = &info;
	open_bit_stream_r(&bs, "in.mp3", BUFFER_SIZE);
	
	while(!end_bs(&bs)) {
		// if (frame_Num == 5)
		// 	break;

		sync = seek_sync(&bs, SYNC_WORD, SYNC_WORD_LENGTH);
		
		decode_info(&bs, &(fr_ps));
		
		hdr_to_frps(&(fr_ps));
		
		frame_Num = frame_Num + 1;
		// printf(1, "read frame: %d\n", frame_Num);

		if (info.error_protection)
			buffer_CRC(&bs, &old_crc);

		switch (info.lay) {
			case 3:
				{
					III_get_side_info(&bs, &(III_side_info), &(fr_ps));

					int nSlots;
					nSlots = main_data_slots(fr_ps);

					for (; nSlots > 0; nSlots--)
						hputbuf((unsigned int) getbits(&bs,8), 8);

					beginDecode(&fr_ps, &III_side_info, &info);
				} 
				break;
			default:
				printf(0, "\nOnly layer III supported!\n");
				exit();
				break;
		}

	}

	close_bit_stream_r(&bs);

	printf(0, "\nPlaying done.\n");

	// kill(pid);
	// kill(decodepid);
	// kill(playpid);

	// wait();
	// wait();
	// wait();

	exit();
}

#include "types.h"
#include "user.h"
#include "sound.h"
#include "common.h"
#include "decode.h"

double lr[2][SBLIMIT][SSLIMIT];
double ro[2][SBLIMIT][SSLIMIT];
long int is[SBLIMIT][SSLIMIT]; 
double re[SBLIMIT][SSLIMIT];
double hybridIn[SBLIMIT][SSLIMIT];
double hybridOut[SBLIMIT][SSLIMIT];
double polyPhaseIn[SBLIMIT];

struct layer info;
struct frame_params fr_ps;
struct III_side_info_t III_side_info;
III_scalefac_t III_scalefac;
typedef short PCM[2][SSLIMIT][SBLIMIT];
PCM *pcm_sample;

int bitsGet1;
int needRewind;
int bitsGet2;

uint t1, t2;

int main()
{
    pcm_sample = (PCM *) mem_alloc((long) sizeof(PCM), "PCM Samp");
    
    unsigned long sample_frames = 0;

    int frame_num = 0;
    
    while (1) {
    	t1 = uptime();
    	// printf(0, "t1=%d ", t1);

	    waitForDecode(&fr_ps, &III_side_info, &info);
	    
	    fr_ps.header = &info;

	    int nSlots, main_data_end, flush_main;
		int bytes_to_discard;
		static int frame_start = 0;
		int bitsPerSlot = 8;

		nSlots = main_data_slots(fr_ps);
		
		main_data_end = hsstell() / 8;
		
		if ( (flush_main=(hsstell() % bitsPerSlot))) {
			hgetbits((int)(bitsPerSlot - flush_main));
			main_data_end ++;
		}
		
		bytes_to_discard = frame_start - main_data_end - III_side_info.main_data_begin ;
		
		if( main_data_end > BUFSIZE ) {   
			frame_start -= BUFSIZE;
			rewindNbytes( BUFSIZE );
		}

		frame_start += main_data_slots(fr_ps);
		
		if (bytes_to_discard < 0) {
			printf(0, "Not enough main data to decode frame %d. Frame discarded.\n", sample_frames + 1);
			break;
		}

		for (; bytes_to_discard > 0; bytes_to_discard--) hgetbits(8);

	    // printf(0, "Receive Arguments From Process A\n");
	    // output_frps2(&fr_ps);
	    // output_side_info2(&III_side_info);
	    
	    int clip = 0, gr, ch, ss, sb;

	    for (gr=0;gr<2;gr++) {
	    	memset(lr, 0, sizeof(lr));
	    	memset(ro, 0, sizeof(ro));

			for (ch=0; ch<fr_ps.stereo; ch++) {
				memset(is, 0, sizeof(is));

			    int part2_start;
			    part2_start = hsstell();
			    
			    III_get_scale_factors(&III_scalefac, &(III_side_info), gr, ch, &(fr_ps));
			    
			    III_hufman_decode(is, &(III_side_info), ch, gr, part2_start, &(fr_ps));
			    
			    III_dequantize_sample(is, ro[ch], &III_scalefac, &(III_side_info.ch[ch].gr[gr]), ch, &(fr_ps));
			}

			III_stereo(ro, lr, &III_scalefac, &(III_side_info.ch[0].gr[gr]), &(fr_ps));
			
			for (ch=0; ch<fr_ps.stereo; ch++) {
				memset(re, 0, sizeof(re));
				memset(hybridIn, 0, sizeof(hybridIn));
				memset(hybridOut, 0, sizeof(hybridOut));
				memset(polyPhaseIn, 0, sizeof(polyPhaseIn));

			    III_reorder(lr[ch], re, &(III_side_info.ch[ch].gr[gr]), &(fr_ps));
			    
			    III_antialias(re, hybridIn, &(III_side_info.ch[ch].gr[gr]), &(fr_ps));

			    for (sb=0; sb<SBLIMIT; sb++) {
					III_hybrid(hybridIn[sb], hybridOut[sb], sb, ch,	&(III_side_info.ch[ch].gr[gr]), &(fr_ps));
			    }

			    for (ss=0;ss<18;ss++)	
					for (sb=0; sb<SBLIMIT; sb++)
				    	if ((ss%2) && (sb%2))
							hybridOut[sb][ss] = -hybridOut[sb][ss];
				
			    for (ss=0;ss<18;ss++) { 
					for (sb=0; sb<SBLIMIT; sb++)
				    	polyPhaseIn[sb] = hybridOut[sb][ss];
				    clip += SubBandSynthesis(polyPhaseIn, ch, &((*pcm_sample)[ch][ss][0]));
			    }
			    
			}

		 	out_fifo(*pcm_sample, 18, &(fr_ps), 0, &sample_frames);
		}

		// t2 = uptime();
		// printf(0, "t2=%d \n", t2);
		// printf(0, "time=%d\n", t2 - t1);
		// printf(0, "frame_num completed=%d \n", ++frame_num);
		// endDecode();
    }

    exit();
}

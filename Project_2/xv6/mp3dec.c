#include "types.h"
#include "user.h"
#include "sound.h"
#include "common.h"
#include "decode.h"
int main()
{
    //struct coreBuf* corebuf;
    III_scalefac_t III_scalefac;
    typedef short PCM[2][SSLIMIT][SBLIMIT];
    PCM *pcm_sample;
    pcm_sample = (PCM *) mem_alloc((long) sizeof(PCM), "PCM Samp");
    unsigned long sample_frames = 0;
    //corebuf = (struct coreBuf*)getCoreBuf();
    struct frame_params fr_ps;
    struct III_side_info_t III_side_info; 
    while (1) {
    printf(0, "decode\n");
    waitForDecode(&fr_ps, &III_side_info);
    int clip = 0, gr, ch, ss, sb;
    for (gr=0;gr<2;gr++) {
	double lr[2][SBLIMIT][SSLIMIT],ro[2][SBLIMIT][SSLIMIT];
	//Ö÷œâÂë
	for (ch=0; ch<fr_ps.stereo; ch++) {
	    long int is[SBLIMIT][SSLIMIT];   /*±£ŽæÁ¿»¯ÊýŸÝ*/
	    int part2_start;
	    part2_start = hsstell();
	    //»ñÈ¡±ÈÀýÒò×Ó
	    III_get_scale_factors(&III_scalefac,&(III_side_info), gr, ch, &(fr_ps));
	    //HuffmanœâÂë
	    III_hufman_decode(is, &(III_side_info), ch, gr, part2_start, &(fr_ps));
	    //·ŽÁ¿»¯²ÉÑù
	    III_dequantize_sample(is, ro[ch], &III_scalefac, &(III_side_info.ch[ch].gr[gr]), ch, &(fr_ps));
	}
	//Á¢ÌåÉùŽŠÀí
	III_stereo(ro, lr, &III_scalefac, &(III_side_info.ch[0].gr[gr]), &(fr_ps));
	printf(0, "%d\n", fr_ps.stereo);
	for (ch=0; ch<fr_ps.stereo; ch++) {
	    double re[SBLIMIT][SSLIMIT];
	    double hybridIn[SBLIMIT][SSLIMIT];/* Hybrid filter input */
	    double hybridOut[SBLIMIT][SSLIMIT];/* Hybrid filter out */
	    double polyPhaseIn[SBLIMIT];     /* PolyPhase Input. */
	    III_reorder(lr[ch], re, &(III_side_info.ch[ch].gr[gr]), &(fr_ps));
	    //¿¹Ÿâ³ÝŽŠÀí
	    III_antialias(re, hybridIn, /* Antialias butterflies. */
		&(III_side_info.ch[ch].gr[gr]), &(fr_ps));
	    //IMDCT
	    for (sb=0; sb<SBLIMIT; sb++) { /* Hybrid synthesis. */
		III_hybrid(hybridIn[sb], hybridOut[sb], sb, ch,	&(III_side_info.ch[ch].gr[gr]), &(fr_ps));
	    }
	    for (ss=0;ss<18;ss++)	//¶àÏàÆµÂÊµ¹ÖÃ
		for (sb=0; sb<SBLIMIT; sb++)
		    if ((ss%2) && (sb%2))
			hybridOut[sb][ss] = -hybridOut[sb][ss];
	    for (ss=0;ss<18;ss++) { //¶àÏàºÏ³É
		for (sb=0; sb<SBLIMIT; sb++)
		    polyPhaseIn[sb] = hybridOut[sb][ss];
		    //×ÓŽøºÏ³É
		    clip += SubBandSynthesis(polyPhaseIn, ch, &((*pcm_sample)[ch][ss][0]));
	    }
	}
	//PCMÊä³ö
	/* Output PCM sample points for one granule(¿ÅÁ£). */
 	out_fifo(*pcm_sample, 18, &(fr_ps), &sample_frames);
	endDecode();	
    }
    }
    exit();
}

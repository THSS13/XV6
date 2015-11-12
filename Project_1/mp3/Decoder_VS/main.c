#include <stdio.h>
#include <stdlib.h>
#include "common.h"
#include "huffman.h"
#include "decode.h"

void decode(int argc, char *argv[]);
int main(int argc, char *argv[])
{
	decode(argc, argv);
}

void decode(int argc, char *argv[])
{
	Bit_stream_struct bs;
	struct frame_params fr_ps;
    struct III_side_info_t III_side_info;
    III_scalefac_t III_scalefac;
    unsigned int old_crc;
    layer info;
    int sync, clip;
    int done = 0;
    unsigned long frameNum = 0;
    unsigned long bitsPerSlot;
    unsigned long sample_frames;

    typedef short PCM[2][SSLIMIT][SBLIMIT];
    PCM *pcm_sample;
	FILE *musicout;

    pcm_sample = (PCM *) mem_alloc((long) sizeof(PCM), "PCM Samp");

    fr_ps.header = &info;

    fopen_s(&musicout, "output.pcm", "w+b");
	if (musicout == NULL) {
		printf ("Could not create \"%s\".\n", "output.pcm");
		return ;
	}

    open_bit_stream_r(&bs, "in.mp3", BUFFER_SIZE);

    sample_frames = 0;
    while (!end_bs(&bs))
    {
        //printf("0\n");
        sync = seek_sync(&bs, SYNC_WORD, SYNC_WORD_LENGTH);
        if (!sync)
        {
            done = 1;
            printf("\nFrame cannot be located\n");
            out_fifo(*pcm_sample, 3, &fr_ps, done, musicout, &sample_frames);
            break;
        }

        decode_info(&bs, &fr_ps);

        hdr_to_frps(&fr_ps);

        if (frameNum == 0)
            WriteHdr(&fr_ps);
         printf("\r%05lu", frameNum++);

        if (info.error_protection)
            buffer_CRC(&bs, &old_crc);

        //printf("info.lay: %d\n", info.lay);

        switch (info.lay)
        {
        case 3:
        {
            int nSlots, main_data_end, flush_main;
            int bytes_to_discard, gr, ch, ss, sb;
            static int frame_start = 0;

            bitsPerSlot = 8;

            //printf("1\n");

            III_get_side_info(&bs, &III_side_info, &fr_ps);
            nSlots = main_data_slots(fr_ps);

            //printf("2\n");

            for (; nSlots > 0; nSlots--)  /* read main data. */
                hputbuf((unsigned int) getbits(&bs, 8), 8);

            //printf("3\n");
            main_data_end = hsstell() / 8; /*of privious frame*/
            if ( flush_main = (hsstell() % bitsPerSlot) )
            {
                hgetbits((int)(bitsPerSlot - flush_main));
                main_data_end ++;
            }

            //printf("4\n");

            bytes_to_discard = frame_start - main_data_end - III_side_info.main_data_begin ;
            if ( main_data_end > 4096 )
            {
                frame_start -= 4096;
                rewindNbytes( 4096 );
            }

            //printf("5\n");

            frame_start += main_data_slots(fr_ps);
            if (bytes_to_discard < 0)
            {
                printf("Not enough main data to decode frame %d.  Frame discarded.\n",
                       frameNum - 1); break;
            }
            for (; bytes_to_discard > 0; bytes_to_discard--) hgetbits(8);

            //printf("6\n");

            clip = 0;
            for (gr = 0; gr < 2; gr++)
            {
                double lr[2][SBLIMIT][SSLIMIT], ro[2][SBLIMIT][SSLIMIT];

                for (ch = 0; ch < fr_ps.stereo; ch++)
                {
                    long int is[SBLIMIT][SSLIMIT];   /*保存量化数据*/
                    int part2_start;

                    //printf("6.0.%d\n", ch);

                    part2_start = hsstell();

                    //printf("6.1\n");

                    III_get_scale_factors(&III_scalefac, &III_side_info, gr, ch, &fr_ps);

                    //printf("6.2\n");

                    III_huffman_decode(is, &III_side_info, ch, gr, part2_start, &fr_ps);

                    //printf("6.3\n");

                    III_dequantize_sample(is, ro[ch], &III_scalefac, (struct gr_info_s *) &(III_side_info.ch[ch].gr[gr]), ch, &fr_ps);

                    //printf("6.4\n");
                }

                III_stereo(ro, lr, &III_scalefac, (struct gr_info_s *) &(III_side_info.ch[0].gr[gr]), &fr_ps);

                //printf("6.6\n");

                for (ch = 0; ch < fr_ps.stereo; ch++)
                {
                    double re[SBLIMIT][SSLIMIT];
                    double hybridIn[SBLIMIT][SSLIMIT];/* Hybrid filter input */
                    double hybridOut[SBLIMIT][SSLIMIT];/* Hybrid filter out */
                    double polyPhaseIn[SBLIMIT];     /* PolyPhase Input. */

                    III_reorder(lr[ch], re, (struct gr_info_s *) &(III_side_info.ch[ch].gr[gr]), &fr_ps);

                    //printf("6.7.1\n");

                    III_antialias(re, hybridIn, /* Antialias butterflies. */
                                  (struct gr_info_s *) & (III_side_info.ch[ch].gr[gr]), &fr_ps);

                    //printf("6.7.2\n");

                    for (sb = 0; sb < SBLIMIT; sb++) /* Hybrid synthesis. */
                    {
                        III_hybrid(hybridIn[sb], hybridOut[sb], sb, ch, (struct gr_info_s *) &(III_side_info.ch[ch].gr[gr]), &fr_ps);
                    }

                    //printf("6.7.3\n");

                    for (ss = 0; ss < 18; ss++)
                        for (sb = 0; sb < SBLIMIT; sb++)
                            if ((ss % 2) && (sb % 2))
                                hybridOut[sb][ss] = -hybridOut[sb][ss];

                    //printf("6.7.4\n");

                    for (ss = 0; ss < 18; ss++)
                    {
                        for (sb = 0; sb < SBLIMIT; sb++)
                            polyPhaseIn[sb] = hybridOut[sb][ss];

                        clip += SubBandSynthesis(polyPhaseIn, ch, &((*pcm_sample)[ch][ss][0]));
                    }
                    //printf("6.7.5\n");
                }

                //printf("6.8\n");

                /* Output PCM sample points for one granule(颗粒). */
                out_fifo(*pcm_sample, 18, &fr_ps, done, musicout, &sample_frames);
            }
            if (clip > 0)
                printf("\n%d samples clipped.\n", clip);

            //printf("7\n");
        }
        break;
        default:
            printf("\nOnly layer III supported!\n");
            return;
        }

    }
    close_bit_stream_r(&bs);
    fclose(musicout);
    printf("decode completed\n");
	return ;
}
#include "types.h"
#include "stat.h"
#include "user.h"
#include "sound.h"
#include "fcntl.h"

void decode(int argc, char *argv[]);

int
main(int argc, char *argv[])
{
    decode(argc, argv);
    
    int i;
    int fd;
    struct wav info;
    printf(1, "DONE !!!!\n");

    fd = open("output.pcm", O_RDWR);
    if (fd < 0)
    {
        printf(0, "open wav file fail\n");
        exit();
    } else {
        printf(0, "open output.pcm success\n");
    }

    int pid = fork();
    if (pid == 0)
    {
        exec("sh", argv);
    }
    setSampleRate(44100);
    uint rd = 0;
    char buf[4096];

    int mp3pid = fork();
    if (mp3pid == 0)
    {
        exec("decode", argv);
    }
    while (rd < 10244096)
    {
        int len = (10244096 - rd < 4096 ? 10244096 - rd : 4096);
        read(fd, buf, len);
        kwrite(buf, len);
        rd += len;
    }

    memset(buf, 0, 4096);
    for (i = 0; i < DMA_BUF_NUM * DMA_BUF_SIZE / 4096 + 1; i++)
    {
        kwrite(buf, 4096);
    }

    close(fd);
    kill(pid);
    kill(mp3pid);
    wait();
    wait();
    exit();
}

void decode(int argc, char *argv[])
{
    int musicout;
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

    pcm_sample = (PCM *) mem_alloc((long) sizeof(PCM), "PCM Samp");

    if (argc == 1)
    {
        printf(1, "Useage:decode file.mp3 output.pcm\n");
        return;
    }

    fr_ps.header = &info;

    if ((musicout = open("output.pcm", O_RDWR)) < 0)
    {
        printf (1, "Could not create output.pcm.\n");
        exit();
    }

    open_bit_stream_r(&bs, argv[1], BUFFER_SIZE);

    sample_frames = 0;
    while (!end_bs(&bs))
    {
        // printf(1, "0\n");
        sync = seek_sync(&bs, SYNC_WORD, SYNC_WORD_LENGTH);
        if (!sync)
        {
            done = 1;
            printf(1, "\nFrame cannot be located\n");
            out_fifo(*pcm_sample, 3, &fr_ps, done, musicout, &sample_frames);
            break;
        }

        decode_info(&bs, &fr_ps);

        hdr_to_frps(&fr_ps);

        if (frameNum == 0)
            WriteHdr(&fr_ps);
        printf(1, "\r%05lu", frameNum++);

        if (info.error_protection)
            buffer_CRC(&bs, &old_crc);

        // // printf(1, "info.lay: %d\n", info.lay);

        switch (info.lay)
        {
        case 3:
        {
            int nSlots, main_data_end, flush_main;
            int bytes_to_discard, gr, ch, ss, sb;
            static int frame_start = 0;

            bitsPerSlot = 8;

            // printf(1, "1\n");

            III_get_side_info(&bs, &III_side_info, &fr_ps);
            nSlots = main_data_slots(fr_ps);

            // printf(1, "2\n");

            for (; nSlots > 0; nSlots--)  /* read main data. */
                hputbuf((unsigned int) getbits(&bs, 8), 8);

            // printf(1, "3\n");
            main_data_end = hsstell() / 8; /*of privious frame*/
            if ( flush_main = (hsstell() % bitsPerSlot) )
            {
                hgetbits((int)(bitsPerSlot - flush_main));
                main_data_end ++;
            }

            // printf(1, "4\n");

            bytes_to_discard = frame_start - main_data_end - III_side_info.main_data_begin ;
            if ( main_data_end > 4096 )
            {
                frame_start -= 4096;
                rewindNbytes( 4096 );
            }

            // printf(1, "5\n");

            frame_start += main_data_slots(fr_ps);
            if (bytes_to_discard < 0)
            {
                printf(1, "Not enough main data to decode frame %d.  Frame discarded.\n",
                       frameNum - 1); break;
            }
            for (; bytes_to_discard > 0; bytes_to_discard--) hgetbits(8);

            // printf(1, "6\n");

            clip = 0;
            for (gr = 0; gr < 2; gr++)
            {
                double lr[2][SBLIMIT][SSLIMIT], ro[2][SBLIMIT][SSLIMIT];

                for (ch = 0; ch < fr_ps.stereo; ch++)
                {
                    long int is[SBLIMIT][SSLIMIT];   /*±£´æÁ¿»¯Êý¾Ý*/
                    int part2_start;

                    printf(1, "6.0.%d\n", ch);

                    part2_start = hsstell();

                    printf(1, "6.1\n");

                    III_get_scale_factors(&III_scalefac, &III_side_info, gr, ch, &fr_ps);

                    // printf(1, "6.2\n");

                    III_huffman_decode(is, &III_side_info, ch, gr, part2_start, &fr_ps);

                    // printf(1, "6.3\n");

                    III_dequantize_sample(is, ro[ch], &III_scalefac, &(III_side_info.ch[ch].gr[gr]), ch, &fr_ps);

                    // printf(1, "6.4\n");
                }

                III_stereo(ro, lr, &III_scalefac, &(III_side_info.ch[0].gr[gr]), &fr_ps);

                // printf(1, "6.6\n");

                for (ch = 0; ch < fr_ps.stereo; ch++)
                {
                    double re[SBLIMIT][SSLIMIT];
                    double hybridIn[SBLIMIT][SSLIMIT];/* Hybrid filter input */
                    double hybridOut[SBLIMIT][SSLIMIT];/* Hybrid filter out */
                    double polyPhaseIn[SBLIMIT];     /* PolyPhase Input. */

                    III_reorder(lr[ch], re, &(III_side_info.ch[ch].gr[gr]), &fr_ps);

                    // printf(1, "6.7.1\n");

                    III_antialias(re, hybridIn, /* Antialias butterflies. */
                                  & (III_side_info.ch[ch].gr[gr]), &fr_ps);

                    // printf(1, "6.7.2\n");

                    for (sb = 0; sb < SBLIMIT; sb++) /* Hybrid synthesis. */
                    {
                        III_hybrid(hybridIn[sb], hybridOut[sb], sb, ch, &(III_side_info.ch[ch].gr[gr]), &fr_ps);
                    }

                    // printf(1, "6.7.3\n");

                    for (ss = 0; ss < 18; ss++)
                        for (sb = 0; sb < SBLIMIT; sb++)
                            if ((ss % 2) && (sb % 2))
                                hybridOut[sb][ss] = -hybridOut[sb][ss];

                    // printf(1, "6.7.4\n");

                    for (ss = 0; ss < 18; ss++)
                    {
                        for (sb = 0; sb < SBLIMIT; sb++)
                            polyPhaseIn[sb] = hybridOut[sb][ss];

                        clip += SubBandSynthesis(polyPhaseIn, ch, &((*pcm_sample)[ch][ss][0]));
                    }
                    // printf(1, "6.7.5\n");
                }

                // printf(1, "6.8\n");

                /* Output PCM sample points for one granule(¿ÅÁ£). */
                out_fifo(*pcm_sample, 18, &fr_ps, done, musicout, &sample_frames);
            }
            if (clip > 0)
                printf(1, "\n%d samples clipped.\n", clip);

            // printf(1, "7\n");
        }
        break;
        default:
            printf(1, "\nOnly layer III supported!\n");
            exit();
            break;
        }
    }
    close_bit_stream_r(&bs);
    close(musicout);
    printf(1, "decode completed\n");
}
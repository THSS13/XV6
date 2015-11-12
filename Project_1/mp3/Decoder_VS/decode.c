#include "math.h"
#include "common.h"
#include "decode.h"
#include "huffman.h"


void decode_info(Bit_stream_struct *bs, struct frame_params *fr_ps)
{
    layer *hdr = fr_ps->header;

    hdr->version = get1bit(bs);
    hdr->lay = 4 - getbits(bs, 2);
    hdr->error_protection = !get1bit(bs); /* 错误保护. TRUE/FALSE */
    hdr->bitrate_index = getbits(bs, 4);
    hdr->sampling_frequency = getbits(bs, 2);
    hdr->padding = get1bit(bs);
    hdr->extension = get1bit(bs);
    hdr->mode = getbits(bs, 2);
    hdr->mode_ext = getbits(bs, 2);
    hdr->copyright = get1bit(bs);
    hdr->original = get1bit(bs);
    hdr->emphasis = getbits(bs, 2);
}

void III_get_side_info(Bit_stream_struct *bs, struct III_side_info_t *si, struct frame_params *fr_ps)
{
    int ch, gr, i;
    int stereo = fr_ps->stereo;

    si->main_data_begin = getbits(bs, 9);
    if (stereo == 1)
        si->private_bits = getbits(bs, 5);
    else
        si->private_bits = getbits(bs, 3);

    for (ch = 0; ch < stereo; ch++)
        for (i = 0; i < 4; i++)
            si->ch[ch].scfsi[i] = get1bit(bs);

    for (gr = 0; gr < 2; gr++)
    {
        for (ch = 0; ch < stereo; ch++)
        {
            si->ch[ch].gr[gr].part2_3_length = getbits(bs, 12);
            si->ch[ch].gr[gr].big_values = getbits(bs, 9);
            si->ch[ch].gr[gr].global_gain = getbits(bs, 8);
            si->ch[ch].gr[gr].scalefac_compress = getbits(bs, 4);
            si->ch[ch].gr[gr].window_switching_flag = get1bit(bs);
            if (si->ch[ch].gr[gr].window_switching_flag)
            {
                si->ch[ch].gr[gr].block_type = getbits(bs, 2);
                si->ch[ch].gr[gr].mixed_block_flag = get1bit(bs);
                for (i = 0; i < 2; i++)
                    si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
                for (i = 0; i < 3; i++)
                    si->ch[ch].gr[gr].subblock_gain[i] = getbits(bs, 3);

                /* Set region_count parameters since they are implicit in this case. */

                if (si->ch[ch].gr[gr].block_type == 0)
                {
                    //printf("Side info bad: block_type == 0 in split block.\n");
                    return;
                }
                else if (si->ch[ch].gr[gr].block_type == 2
                         && si->ch[ch].gr[gr].mixed_block_flag == 0)
                    si->ch[ch].gr[gr].region0_count = 8; /* MI 9; */
                else si->ch[ch].gr[gr].region0_count = 7; /* MI 8; */
                si->ch[ch].gr[gr].region1_count = 20 - si->ch[ch].gr[gr].region0_count;
            }
            else
            {
                for (i = 0; i < 3; i++)
                    si->ch[ch].gr[gr].table_select[i] = getbits(bs, 5);
                si->ch[ch].gr[gr].region0_count = getbits(bs, 4);
                si->ch[ch].gr[gr].region1_count = getbits(bs, 3);
                si->ch[ch].gr[gr].block_type = 0;
            }
            si->ch[ch].gr[gr].preflag = get1bit(bs);
            si->ch[ch].gr[gr].scalefac_scale = get1bit(bs);
            si->ch[ch].gr[gr].count1table_select = get1bit(bs);
        }
    }
}


struct
{
    int l[5];
    int s[3];
} sfbtable =
{
    {0, 6, 11, 16, 21},
    {0, 6, 12}
};
int slen[2][16] =
{
    {0, 0, 0, 0, 3, 1, 1, 1, 2, 2, 2, 3, 3, 3, 4, 4},
    {0, 1, 2, 3, 0, 1, 2, 3, 1, 2, 3, 1, 2, 3, 2, 3}
};
struct
{
    int l[23];
    int s[14];
} sfBandIndex[3] =
{
    {   {0, 4, 8, 12, 16, 20, 24, 30, 36, 44, 52, 62, 74, 90, 110, 134, 162, 196, 238, 288, 342, 418, 576},
        {0, 4, 8, 12, 16, 22, 30, 40, 52, 66, 84, 106, 136, 192}
    },
    {   {0, 4, 8, 12, 16, 20, 24, 30, 36, 42, 50, 60, 72, 88, 106, 128, 156, 190, 230, 276, 330, 384, 576},
        {0, 4, 8, 12, 16, 22, 28, 38, 50, 64, 80, 100, 126, 192}
    },
    {   {0, 4, 8, 12, 16, 20, 24, 30, 36, 44, 54, 66, 82, 102, 126, 156, 194, 240, 296, 364, 448, 550, 576},
        {0, 4, 8, 12, 16, 22, 30, 42, 58, 78, 104, 138, 180, 192}
    }
};

void III_get_scale_factors(III_scalefac_t *scalefac, struct III_side_info_t *si, int gr, int ch, struct frame_params *fr_ps)
{
    // printf("get scale factors\n");
    int sfb, i, window;
    struct gr_info_s * gr_info = (struct gr_info_s *) &(si->ch[ch].gr[gr]);

    if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    {
        // printf("%d\n", gr_info->mixed_block_flag);
        if (gr_info->mixed_block_flag)
        {
            /* MIXED */ /* NEW - ag 11/25 */
            for (sfb = 0; sfb < 8; sfb++)
                (*scalefac)[ch].l[sfb] = hgetbits(
                                             slen[0][gr_info->scalefac_compress]);
            for (sfb = 3; sfb < 6; sfb++)
                for (window = 0; window < 3; window++)
                    (*scalefac)[ch].s[window][sfb] = hgetbits(
                                                         slen[0][gr_info->scalefac_compress]);
            for (sfb = 6; sfb < 12; sfb++)
                for (window = 0; window < 3; window++)
                    (*scalefac)[ch].s[window][sfb] = hgetbits(
                                                         slen[1][gr_info->scalefac_compress]);
            for (sfb = 12, window = 0; window < 3; window++)
                (*scalefac)[ch].s[window][sfb] = 0;
        }
        else    /* SHORT*/
        {
            for (i = 0; i < 2; i++)
                for (sfb = sfbtable.s[i]; sfb < sfbtable.s[i + 1]; sfb++)
                    for (window = 0; window < 3; window++)
                        (*scalefac)[ch].s[window][sfb] = hgetbits(
                                                             slen[i][gr_info->scalefac_compress]);
            for (sfb = 12, window = 0; window < 3; window++)
                (*scalefac)[ch].s[window][sfb] = 0;
        }
    }
    else     /* LONG types 0,1,3 */
    {

        for (i=0; i<4; i++) {   
            if ((si->ch[ch].scfsi[i] == 0) || (gr == 0))   
                for (sfb = sfbtable.l[i]; sfb < sfbtable.l[i+1]; sfb++)   
                    (*scalefac)[ch].l[sfb] = hgetbits(   
                        slen[(i<2)?0:1][gr_info->scalefac_compress]);   
        }   
        (*scalefac)[ch].l[22] = 0;
    }
}

/* 已经在 huffman.c中声明
struct huffcodetab ht[HTN];
*/
int huffman_initialized = FALSE;

void initialize_huffman()
{
    if (huffman_initialized) return;
    // int fd = open("huffdec.txt", O_RDWR);
    read_decoder_table();
    huffman_initialized = TRUE;
}


void III_huffman_decode(long int is[SBLIMIT][SSLIMIT], struct III_side_info_t *si, int ch, int gr, int part2_start, struct frame_params *fr_ps)
{
    int i, x, y;
    int v, w;
    struct huffcodetab *h;
    int region1Start;
    int region2Start;
    //int bt = (*si).ch[ch].gr[gr].window_switching_flag && ((*si).ch[ch].gr[gr].block_type == 2);

    // printf("before init huffman\n");
    initialize_huffman();
    // printf("after init huffman\n");

    /* 查找区域边界 */

    if ( ((*si).ch[ch].gr[gr].window_switching_flag) &&
            ((*si).ch[ch].gr[gr].block_type == 2) )
    {

        /* Region2. */

        region1Start = 36;  /* sfb[9/3]*3=36 */
        region2Start = 576; /* No Region2 for short block case. */
    }


    else            /* 查找长块情况下的区域边界. */
    {

        region1Start = sfBandIndex[fr_ps->header->sampling_frequency]
                       .l[(*si).ch[ch].gr[gr].region0_count + 1]; /* MI */
        region2Start = sfBandIndex[fr_ps->header->sampling_frequency]
                       .l[(*si).ch[ch].gr[gr].region0_count +
                          (*si).ch[ch].gr[gr].region1_count + 2]; /* MI */
    }


    /* 读取大值区域Read bigvalues area. */
    for (i = 0; i < (*si).ch[ch].gr[gr].big_values * 2; i += 2)
    {
        if      (i < region1Start) h = &ht[(*si).ch[ch].gr[gr].table_select[0]];
        else if (i < region2Start) h = &ht[(*si).ch[ch].gr[gr].table_select[1]];
        else                h = &ht[(*si).ch[ch].gr[gr].table_select[2]];
        huffman_decoder(h, &x, &y, &v, &w);
        is[i / SSLIMIT][i % SSLIMIT] = x;
        is[(i + 1) / SSLIMIT][(i + 1) % SSLIMIT] = y;
    }

    /* Read count1 area. */
    h = &ht[(*si).ch[ch].gr[gr].count1table_select + 32];
    while ((hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length ) &&
            ( i < SSLIMIT * SBLIMIT ))
    {
        huffman_decoder(h, &x, &y, &v, &w);
        is[i / SSLIMIT][i % SSLIMIT] = v;
        is[(i + 1) / SSLIMIT][(i + 1) % SSLIMIT] = w;
        is[(i + 2) / SSLIMIT][(i + 2) % SSLIMIT] = x;
        is[(i + 3) / SSLIMIT][(i + 3) % SSLIMIT] = y;
        i += 4;
    }

    if (hsstell() > part2_start + (*si).ch[ch].gr[gr].part2_3_length)
    {
        i -= 4;
        rewindNbits(hsstell() - part2_start - (*si).ch[ch].gr[gr].part2_3_length);
    }

    /* Dismiss stuffing Bits */
    if ( hsstell() < part2_start + (*si).ch[ch].gr[gr].part2_3_length )
        hgetbits( part2_start + (*si).ch[ch].gr[gr].part2_3_length - hsstell());

    /* Zero out rest. */
    for (; i < SSLIMIT * SBLIMIT; i++)
        is[i / SSLIMIT][i % SSLIMIT] = 0;
}


int pretab[22] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 3, 3, 3, 2, 0};

void III_dequantize_sample(long int is[SBLIMIT][SSLIMIT], double xr[SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, int ch, struct frame_params *fr_ps)
{
    int ss, sb, cb = 0, sfreq = fr_ps->header->sampling_frequency;
    //int stereo = fr_ps->stereo;
    int next_cb_boundary, cb_begin, cb_width = 0, sign;

    /* choose correct scalefactor band per block type, initalize boundary */

    if (gr_info->window_switching_flag && (gr_info->block_type == 2) )
        if (gr_info->mixed_block_flag)
            next_cb_boundary = sfBandIndex[sfreq].l[1]; /* LONG blocks: 0,1,3 */
        else
        {
            next_cb_boundary = sfBandIndex[sfreq].s[1] * 3; /* pure SHORT block */
            cb_width = sfBandIndex[sfreq].s[1];
            cb_begin = 0;
        }
    else
        next_cb_boundary = sfBandIndex[sfreq].l[1]; /* LONG blocks: 0,1,3 */

    /* apply formula per block type */
    for (sb = 0 ; sb < SBLIMIT ; sb++)
    {
        for (ss = 0 ; ss < SSLIMIT ; ss++)
        {
            if ( (sb * 18) + ss == next_cb_boundary) /* Adjust critical band boundary */
            {
                if (gr_info->window_switching_flag && (gr_info->block_type == 2))
                {
                    if (gr_info->mixed_block_flag)
                    {
                        if (((sb * 18) + ss) == sfBandIndex[sfreq].l[8])
                        {
                            next_cb_boundary = sfBandIndex[sfreq].s[4] * 3;
                            cb = 3;
                            cb_width = sfBandIndex[sfreq].s[cb + 1] -
                                       sfBandIndex[sfreq].s[cb];
                            cb_begin = sfBandIndex[sfreq].s[cb] * 3;
                        }
                        else if (((sb * 18) + ss) < sfBandIndex[sfreq].l[8])
                            next_cb_boundary = sfBandIndex[sfreq].l[(++cb) + 1];
                        else
                        {
                            next_cb_boundary = sfBandIndex[sfreq].s[(++cb) + 1] * 3;
                            cb_width = sfBandIndex[sfreq].s[cb + 1] -
                                       sfBandIndex[sfreq].s[cb];
                            cb_begin = sfBandIndex[sfreq].s[cb] * 3;
                        }
                    }
                    else
                    {
                        next_cb_boundary = sfBandIndex[sfreq].s[(++cb) + 1] * 3;
                        cb_width = sfBandIndex[sfreq].s[cb + 1] -
                                   sfBandIndex[sfreq].s[cb];
                        cb_begin = sfBandIndex[sfreq].s[cb] * 3;
                    }
                }
                else /* long blocks */
                    next_cb_boundary = sfBandIndex[sfreq].l[(++cb) + 1];
            }

            /* Compute overall (global) scaling. */
            xr[sb][ss] = pow( 2.0 , (0.25 * (gr_info->global_gain - 210.0)));

            /* Do long/short dependent scaling operations. */

            if (gr_info->window_switching_flag && (
                        ((gr_info->block_type == 2) && (gr_info->mixed_block_flag == 0)) ||
                        ((gr_info->block_type == 2) && gr_info->mixed_block_flag && (sb >= 2)) ))
            {

                xr[sb][ss] *= pow(2.0, 0.25 * -8.0 *
                                  gr_info->subblock_gain[(((sb * 18) + ss) - cb_begin) / cb_width]);
                xr[sb][ss] *= pow(2.0, 0.25 * -2.0 * (1.0 + gr_info->scalefac_scale)
                                  * (*scalefac)[ch].s[(((sb * 18) + ss) - cb_begin) / cb_width][cb]);
            }
            else     /* LONG block types 0,1,3 & 1st 2 subbands of switched blocks */
            {
                xr[sb][ss] *= pow(2.0, -0.5 * (1.0 + gr_info->scalefac_scale)
                                  * ((*scalefac)[ch].l[cb]
                                     + gr_info->preflag * pretab[cb]));
            }

            /* Scale quantized value. */

            sign = (is[sb][ss] < 0) ? 1 : 0;
            xr[sb][ss] *= pow( (double) abs(is[sb][ss]), ((double)4.0 / 3.0) );
            if (sign) xr[sb][ss] = -xr[sb][ss];
        }
    }
}


void III_reorder(double xr[SBLIMIT][SSLIMIT], double ro[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    int sfreq = fr_ps->header->sampling_frequency;
    int sfb, sfb_start, sfb_lines;
    int sb, ss, window, freq, src_line, des_line;

    for (sb = 0; sb < SBLIMIT; sb++)
        for (ss = 0; ss < SSLIMIT; ss++)
            ro[sb][ss] = 0;

    if (gr_info->window_switching_flag && (gr_info->block_type == 2))
    {
        if (gr_info->mixed_block_flag)
        {
            for (sb = 0 ; sb < 2 ; sb++)
                for (ss = 0 ; ss < SSLIMIT ; ss++)
                {
                    ro[sb][ss] = xr[sb][ss];
                }
            for (sfb = 3, sfb_start = sfBandIndex[sfreq].s[3],
                    sfb_lines = sfBandIndex[sfreq].s[4] - sfb_start;
                    sfb < 13; sfb++, sfb_start = sfBandIndex[sfreq].s[sfb],
                    (sfb_lines = sfBandIndex[sfreq].s[sfb + 1] - sfb_start))
                for (window = 0; window < 3; window++)
                    for (freq = 0; freq < sfb_lines; freq++)
                    {
                        src_line = sfb_start * 3 + window * sfb_lines + freq;
                        des_line = (sfb_start * 3) + window + (freq * 3);
                        ro[des_line / SSLIMIT][des_line % SSLIMIT] =
                            xr[src_line / SSLIMIT][src_line % SSLIMIT];
                    }
        }
        else
        {
            for (sfb = 0, sfb_start = 0, sfb_lines = sfBandIndex[sfreq].s[1];
                    sfb < 13; sfb++, sfb_start = sfBandIndex[sfreq].s[sfb],
                    (sfb_lines = sfBandIndex[sfreq].s[sfb + 1] - sfb_start))
                for (window = 0; window < 3; window++)
                    for (freq = 0; freq < sfb_lines; freq++)
                    {
                        src_line = sfb_start * 3 + window * sfb_lines + freq;
                        des_line = (sfb_start * 3) + window + (freq * 3);
                        ro[des_line / SSLIMIT][des_line % SSLIMIT] =
                            xr[src_line / SSLIMIT][src_line % SSLIMIT];
                    }
        }
    }
    else     /*long blocks */
    {
        for (sb = 0 ; sb < SBLIMIT ; sb++)
            for (ss = 0 ; ss < SSLIMIT ; ss++)
                ro[sb][ss] = xr[sb][ss];
    }
}


void III_stereo(double xr[2][SBLIMIT][SSLIMIT], double lr[2][SBLIMIT][SSLIMIT], III_scalefac_t *scalefac, struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    int sfreq = fr_ps->header->sampling_frequency;
    int stereo = fr_ps->stereo;
    int ms_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                    (fr_ps->header->mode_ext & 0x2);
    int i_stereo = (fr_ps->header->mode == MPG_MD_JOINT_STEREO) &&
                   (fr_ps->header->mode_ext & 0x1);
    int sfb;
    int i, j, sb, ss, ch, is_pos[576];
    double is_ratio[576];

    /* intialization */
    for ( i = 0; i < 576; i++ )
        is_pos[i] = 7;

    if ((stereo == 2) && i_stereo )
    {
        if (gr_info->window_switching_flag && (gr_info->block_type == 2))
        {
            if ( gr_info->mixed_block_flag )
            {
                int max_sfb = 0;

                for ( j = 0; j < 3; j++ )
                {
                    int sfbcnt;
                    sfbcnt = 2;
                    for ( sfb = 12; sfb >= 3; sfb-- )
                    {
                        int lines;
                        lines = sfBandIndex[sfreq].s[sfb + 1] - sfBandIndex[sfreq].s[sfb];
                        i = 3 * sfBandIndex[sfreq].s[sfb] + (j + 1) * lines - 1;
                        while ( lines > 0 )
                        {
                            if ( xr[1][i / SSLIMIT][i % SSLIMIT] != 0.0 )
                            {
                                sfbcnt = sfb;
                                sfb = -10;
                                lines = -10;
                            }
                            lines--;
                            i--;
                        }
                    }
                    sfb = sfbcnt + 1;

                    if ( sfb > max_sfb )
                        max_sfb = sfb;

                    while ( sfb < 12 )
                    {
                        sb = sfBandIndex[sfreq].s[sfb + 1] - sfBandIndex[sfreq].s[sfb];
                        i = 3 * sfBandIndex[sfreq].s[sfb] + j * sb;
                        for ( ; sb > 0; sb--)
                        {
                            is_pos[i] = (*scalefac)[1].s[j][sfb];
                            if ( is_pos[i] != 7 )
                                is_ratio[i] = tan( is_pos[i] * (PI / 12));
                            i++;
                        }
                        sfb++;
                    }
                    sb = sfBandIndex[sfreq].s[11] - sfBandIndex[sfreq].s[10];
                    sfb = 3 * sfBandIndex[sfreq].s[10] + j * sb;
                    sb = sfBandIndex[sfreq].s[12] - sfBandIndex[sfreq].s[11];
                    i = 3 * sfBandIndex[sfreq].s[11] + j * sb;
                    for ( ; sb > 0; sb-- )
                    {
                        is_pos[i] = is_pos[sfb];
                        is_ratio[i] = is_ratio[sfb];
                        i++;
                    }
                }
                if ( max_sfb <= 3 )
                {
                    i = 2;
                    ss = 17;
                    sb = -1;
                    while ( i >= 0 )
                    {
                        if ( xr[1][i][ss] != 0.0 )
                        {
                            sb = i * 18 + ss;
                            i = -1;
                        }
                        else
                        {
                            ss--;
                            if ( ss < 0 )
                            {
                                i--;
                                ss = 17;
                            }
                        }
                    }
                    i = 0;
                    while ( sfBandIndex[sfreq].l[i] <= sb )
                        i++;
                    sfb = i;
                    i = sfBandIndex[sfreq].l[i];
                    for ( ; sfb < 8; sfb++ )
                    {
                        sb = sfBandIndex[sfreq].l[sfb + 1] - sfBandIndex[sfreq].l[sfb];
                        for ( ; sb > 0; sb--)
                        {
                            is_pos[i] = (*scalefac)[1].l[sfb];
                            if ( is_pos[i] != 7 )
                                is_ratio[i] = tan( is_pos[i] * (PI / 12));
                            i++;
                        }
                    }
                }
            }
            else
            {
                for ( j = 0; j < 3; j++ )
                {
                    int sfbcnt;
                    sfbcnt = -1;
                    for ( sfb = 12; sfb >= 0; sfb-- )
                    {
                        int lines;
                        lines = sfBandIndex[sfreq].s[sfb + 1] - sfBandIndex[sfreq].s[sfb];
                        i = 3 * sfBandIndex[sfreq].s[sfb] + (j + 1) * lines - 1;
                        while ( lines > 0 )
                        {
                            if ( xr[1][i / SSLIMIT][i % SSLIMIT] != 0.0 )
                            {
                                sfbcnt = sfb;
                                sfb = -10;
                                lines = -10;
                            }
                            lines--;
                            i--;
                        }
                    }
                    sfb = sfbcnt + 1;
                    while ( sfb < 12 )
                    {
                        sb = sfBandIndex[sfreq].s[sfb + 1] - sfBandIndex[sfreq].s[sfb];
                        i = 3 * sfBandIndex[sfreq].s[sfb] + j * sb;
                        for ( ; sb > 0; sb--)
                        {
                            is_pos[i] = (*scalefac)[1].s[j][sfb];
                            if ( is_pos[i] != 7 )
                                is_ratio[i] = tan( is_pos[i] * (PI / 12));
                            i++;
                        }
                        sfb++;
                    }

                    sb = sfBandIndex[sfreq].s[11] - sfBandIndex[sfreq].s[10];
                    sfb = 3 * sfBandIndex[sfreq].s[10] + j * sb;
                    sb = sfBandIndex[sfreq].s[12] - sfBandIndex[sfreq].s[11];
                    i = 3 * sfBandIndex[sfreq].s[11] + j * sb;
                    for ( ; sb > 0; sb-- )
                    {
                        is_pos[i] = is_pos[sfb];
                        is_ratio[i] = is_ratio[sfb];
                        i++;
                    }
                }
            }
        }
        else
        {
            i = 31;
            ss = 17;
            sb = 0;
            while ( i >= 0 )
            {
                if ( xr[1][i][ss] != 0.0 )
                {
                    sb = i * 18 + ss;
                    i = -1;
                }
                else
                {
                    ss--;
                    if ( ss < 0 )
                    {
                        i--;
                        ss = 17;
                    }
                }
            }
            i = 0;
            while ( sfBandIndex[sfreq].l[i] <= sb )
                i++;
            sfb = i;
            i = sfBandIndex[sfreq].l[i];
            for ( ; sfb < 21; sfb++ )
            {
                sb = sfBandIndex[sfreq].l[sfb + 1] - sfBandIndex[sfreq].l[sfb];
                for ( ; sb > 0; sb--)
                {
                    is_pos[i] = (*scalefac)[1].l[sfb];
                    if ( is_pos[i] != 7 )
                        is_ratio[i] = tan( is_pos[i] * (PI / 12));
                    i++;
                }
            }
            sfb = sfBandIndex[sfreq].l[20];
            for ( sb = 576 - sfBandIndex[sfreq].l[21]; sb > 0; sb-- )
            {
                is_pos[i] = is_pos[sfb];
                is_ratio[i] = is_ratio[sfb];
                i++;
            }
        }
    }

    for (ch = 0; ch < 2; ch++)
        for (sb = 0; sb < SBLIMIT; sb++)
            for (ss = 0; ss < SSLIMIT; ss++)
                lr[ch][sb][ss] = 0;

    if (stereo == 2)
        for (sb = 0; sb < SBLIMIT; sb++)
            for (ss = 0; ss < SSLIMIT; ss++)
            {
                i = (sb * 18) + ss;
                if ( is_pos[i] == 7 )
                {
                    if ( ms_stereo )
                    {
                        lr[0][sb][ss] = (xr[0][sb][ss] + xr[1][sb][ss]) / 1.41421356;
                        lr[1][sb][ss] = (xr[0][sb][ss] - xr[1][sb][ss]) / 1.41421356;
                    }
                    else
                    {
                        lr[0][sb][ss] = xr[0][sb][ss];
                        lr[1][sb][ss] = xr[1][sb][ss];
                    }
                }
                else if (i_stereo )
                {
                    lr[0][sb][ss] = xr[0][sb][ss] * (is_ratio[i] / (1 + is_ratio[i]));
                    lr[1][sb][ss] = xr[0][sb][ss] * (1 / (1 + is_ratio[i]));
                }
                else
                {
                    printf("Error in streo processing\n");
                }
            }
    else  /* mono , bypass xr[0][][] to lr[0][][]*/
        for (sb = 0; sb < SBLIMIT; sb++)
            for (ss = 0; ss < SSLIMIT; ss++)
                lr[0][sb][ss] = xr[0][sb][ss];

}


double Ci[8] = { -0.6, -0.535, -0.33, -0.185, -0.095, -0.041, -0.0142, -0.0037};
void III_antialias(double xr[SBLIMIT][SSLIMIT], double hybridIn[SBLIMIT][SSLIMIT], struct gr_info_s *gr_info, struct frame_params *fr_ps)
{
    static int    init = 1;
    static double ca[8], cs[8];
    double        bu, bd; /* upper and lower butterfly inputs */
    int           ss, sb, sblim;

    if (init)
    {
        int i;
        double    sq;
        for (i = 0; i < 8; i++)
        {
            sq = sqrt(1.0 + Ci[i] * Ci[i]);
            cs[i] = 1.0 / sq;
            ca[i] = Ci[i] / sq;
        }
        init = 0;
    }

    /* clear all inputs */

    for (sb = 0; sb < SBLIMIT; sb++)
        for (ss = 0; ss < SSLIMIT; ss++)
            hybridIn[sb][ss] = xr[sb][ss];

    if  (gr_info->window_switching_flag && (gr_info->block_type == 2) &&
            !gr_info->mixed_block_flag ) return;

    if ( gr_info->window_switching_flag && gr_info->mixed_block_flag &&
            (gr_info->block_type == 2))
        sblim = 1;
    else
        sblim = SBLIMIT - 1;

    /* 31 alias-reduction operations between each pair of sub-bands */
    /* with 8 butterflies between each pair                         */

    for (sb = 0; sb < sblim; sb++)
        for (ss = 0; ss < 8; ss++)
        {
            bu = xr[sb][17 - ss];
            bd = xr[sb + 1][ss];
            hybridIn[sb][17 - ss] = (bu * cs[ss]) - (bd * ca[ss]);
            hybridIn[sb + 1][ss] = (bd * cs[ss]) + (bu * ca[ss]);
        }
}


void inv_mdct(double in[18], double out[36], int block_type)
{
    int     i, m, N, p;
    double  tmp[12], sum;
    static  double  win[4][36];
    static  int init = 0;
    static  double COS[4 * 36];

    if (init == 0)
    {

        /* type 0 */
        for (i = 0; i < 36; i++)
            win[0][i] = sin( PI / 36 * (i + 0.5) );

        /* type 1*/
        for (i = 0; i < 18; i++)
            win[1][i] = sin( PI / 36 * (i + 0.5) );
        for (i = 18; i < 24; i++)
            win[1][i] = 1.0;
        for (i = 24; i < 30; i++)
            win[1][i] = sin( PI / 12 * (i + 0.5 - 18) );
        for (i = 30; i < 36; i++)
            win[1][i] = 0.0;

        /* type 3*/
        for (i = 0; i < 6; i++)
            win[3][i] = 0.0;
        for (i = 6; i < 12; i++)
            win[3][i] = sin( PI / 12 * (i + 0.5 - 6) );
        for (i = 12; i < 18; i++)
            win[3][i] = 1.0;
        for (i = 18; i < 36; i++)
            win[3][i] = sin( PI / 36 * (i + 0.5) );

        /* type 2*/
        for (i = 0; i < 12; i++)
            win[2][i] = sin( PI / 12 * (i + 0.5) ) ;
        for (i = 12; i < 36; i++)
            win[2][i] = 0.0 ;

        for (i = 0; i < 4 * 36; i++)
            COS[i] = cos(PI / (2 * 36) * i);

        init++;
    }

    for (i = 0; i < 36; i++)
        out[i] = 0;

    if (block_type == 2)
    {
        N = 12;
        for (i = 0; i < 3; i++)
        {
            for (p = 0; p < N; p++)
            {
                sum = 0.0;
                for (m = 0; m < N / 2; m++)
                    sum += in[i + 3 * m] * cos( PI / (2 * N) * (2 * p + 1 + N / 2) * (2 * m + 1) );
                tmp[p] = sum * win[block_type][p] ;
            }
            for (p = 0; p < N; p++)
                out[6 * i + p + 6] += tmp[p];
        }
    }
    else
    {
        N = 36;
        for (p = 0; p < N; p++)
        {
            sum = 0.0;
            for (m = 0; m < N / 2; m++)
                sum += in[m] * COS[((2 * p + 1 + N / 2) * (2 * m + 1)) % (4 * 36)];
            out[p] = sum * win[block_type][p];
        }
    }
}


void III_hybrid(double fsIn[SSLIMIT], double tsOut[SSLIMIT], int sb, int ch, struct gr_info_s *gr_info, struct frame_params *fr_ps)
/* fsIn:freq samples per subband in */
/* tsOut:time samples per subband out */
{
    int ss;
    double rawout[36];
    static double prevblck[2][SBLIMIT][SSLIMIT];
    static int init = 1;
    int bt;

    if (init)
    {
        int i, j, k;

        for (i = 0; i < 2; i++)
            for (j = 0; j < SBLIMIT; j++)
                for (k = 0; k < SSLIMIT; k++)
                    prevblck[i][j][k] = 0.0;
        init = 0;
    }

    bt = (gr_info->window_switching_flag && gr_info->mixed_block_flag &&
          (sb < 2)) ? 0 : gr_info->block_type;

    inv_mdct( fsIn, rawout, bt);

    /* overlap addition */
    for (ss = 0; ss < SSLIMIT; ss++)
    {
        tsOut[ss] = rawout[ss] + prevblck[ch][sb][ss];
        prevblck[ch][sb][ss] = rawout[ss + 18];
    }
}


/* create in synthesis filter */
void create_syn_filter(double filter[64][SBLIMIT])
{
    register int i, k;

    for (i = 0; i < 64; i++)
        for (k = 0; k < 32; k++)
        {
            if ((filter[i][k] = 1e9 * cos((double)((PI64 * i + PI4) * (2 * k + 1)))) >= 0)
                filter[i][k] = (int)(filter[i][k] + 0.5);
            //modf(filter[i][k]+0.5, &filter[i][k]);
            else
                filter[i][k] = (int)(filter[i][k] - 0.5);
            //modf(filter[i][k]-0.5, &filter[i][k]);
            filter[i][k] *= 1e-9;
        }
}

int SubBandSynthesis (double *bandPtr, int channel, short *samples)
{
    register int i, j, k;
    register double *bufOffsetPtr, sum;
    static int init = 1;
    typedef double NN[64][32];
    static NN *filter;
    typedef double BB[2][2 * HAN_SIZE];
    static BB *buf;
    static int bufOffset[2] = {64, 64};
    static double window[512] = {0.000000000, -0.000015259, -0.000015259, -0.000015259, -0.000015259, -0.000015259, -0.000015259, -0.000030518, -0.000030518, -0.000030518, -0.000030518, -0.000045776, -0.000045776, -0.000061035, -0.000061035, -0.000076294, -0.000076294, -0.000091553, -0.000106812, -0.000106812, -0.000122070, -0.000137329, -0.000152588, -0.000167847, -0.000198364, -0.000213623, -0.000244141, -0.000259399, -0.000289917, -0.000320435, -0.000366211, -0.000396729, -0.000442505, -0.000473022, -0.000534058, -0.000579834, -0.000625610, -0.000686646, -0.000747681, -0.000808716, -0.000885010, -0.000961304, -0.001037598, -0.001113892, -0.001205444, -0.001296997, -0.001388550, -0.001480103, -0.001586914, -0.001693726, -0.001785278, -0.001907349, -0.002014160, -0.002120972, -0.002243042, -0.002349854, -0.002456665, -0.002578735, -0.002685547, -0.002792358, -0.002899170, -0.002990723, -0.003082275, -0.003173828, 0.003250122, 0.003326416, 0.003387451, 0.003433228, 0.003463745, 0.003479004, 0.003479004, 0.003463745, 0.003417969, 0.003372192, 0.003280640, 0.003173828, 0.003051758, 0.002883911, 0.002700806, 0.002487183, 0.002227783, 0.001937866, 0.001617432, 0.001266479, 0.000869751, 0.000442505, -0.000030518, -0.000549316, -0.001098633, -0.001693726, -0.002334595, -0.003005981, -0.003723145, -0.004486084, -0.005294800, -0.006118774, -0.007003784, -0.007919312, -0.008865356, -0.009841919, -0.010848999, -0.011886597, -0.012939453, -0.014022827, -0.015121460, -0.016235352, -0.017349243, -0.018463135, -0.019577026, -0.020690918, -0.021789551, -0.022857666, -0.023910522, -0.024932861, -0.025909424, -0.026840210, -0.027725220, -0.028533936, -0.029281616, -0.029937744, -0.030532837, -0.031005859, -0.031387329, -0.031661987, -0.031814575, -0.031845093, -0.031738281, -0.031478882, 0.031082153, 0.030517578, 0.029785156, 0.028884888, 0.027801514, 0.026535034, 0.025085449, 0.023422241, 0.021575928, 0.019531250, 0.017257690, 0.014801025, 0.012115479, 0.009231567, 0.006134033, 0.002822876, -0.000686646, -0.004394531, -0.008316040, -0.012420654, -0.016708374, -0.021179199, -0.025817871, -0.030609131, -0.035552979, -0.040634155, -0.045837402, -0.051132202, -0.056533813, -0.061996460, -0.067520142, -0.073059082, -0.078628540, -0.084182739, -0.089706421, -0.095169067, -0.100540161, -0.105819702, -0.110946655, -0.115921021, -0.120697021, -0.125259399, -0.129562378, -0.133590698, -0.137298584, -0.140670776, -0.143676758, -0.146255493, -0.148422241, -0.150115967, -0.151306152, -0.151962280, -0.152069092, -0.151596069, -0.150497437, -0.148773193, -0.146362305, -0.143264771, -0.139450073, -0.134887695, -0.129577637, -0.123474121, -0.116577148, -0.108856201, 0.100311279, 0.090927124, 0.080688477, 0.069595337, 0.057617187, 0.044784546, 0.031082153, 0.016510010, 0.001068115, -0.015228271, -0.032379150, -0.050354004, -0.069168091, -0.088775635, -0.109161377, -0.130310059, -0.152206421, -0.174789429, -0.198059082, -0.221984863, -0.246505737, -0.271591187, -0.297210693, -0.323318481, -0.349868774, -0.376800537, -0.404083252, -0.431655884, -0.459472656, -0.487472534, -0.515609741, -0.543823242, -0.572036743, -0.600219727, -0.628295898, -0.656219482, -0.683914185, -0.711318970, -0.738372803, -0.765029907, -0.791213989, -0.816864014, -0.841949463, -0.866363525, -0.890090942, -0.913055420, -0.935195923, -0.956481934, -0.976852417, -0.996246338, -1.014617920, -1.031936646, -1.048156738, -1.063217163, -1.077117920, -1.089782715, -1.101211548, -1.111373901, -1.120223999, -1.127746582, -1.133926392, -1.138763428, -1.142211914, -1.144287109, 1.144989014, 1.144287109, 1.142211914, 1.138763428, 1.133926392, 1.127746582, 1.120223999, 1.111373901, 1.101211548, 1.089782715, 1.077117920, 1.063217163, 1.048156738, 1.031936646, 1.014617920, 0.996246338, 0.976852417, 0.956481934, 0.935195923, 0.913055420, 0.890090942, 0.866363525, 0.841949463, 0.816864014, 0.791213989, 0.765029907, 0.738372803, 0.711318970, 0.683914185, 0.656219482, 0.628295898, 0.600219727, 0.572036743, 0.543823242, 0.515609741, 0.487472534, 0.459472656, 0.431655884, 0.404083252, 0.376800537, 0.349868774, 0.323318481, 0.297210693, 0.271591187, 0.246505737, 0.221984863, 0.198059082, 0.174789429, 0.152206421, 0.130310059, 0.109161377, 0.088775635, 0.069168091, 0.050354004, 0.032379150, 0.015228271, -0.001068115, -0.016510010, -0.031082153, -0.044784546, -0.057617187, -0.069595337, -0.080688477, -0.090927124, 0.100311279, 0.108856201, 0.116577148, 0.123474121, 0.129577637, 0.134887695, 0.139450073, 0.143264771, 0.146362305, 0.148773193, 0.150497437, 0.151596069, 0.152069092, 0.151962280, 0.151306152, 0.150115967, 0.148422241, 0.146255493, 0.143676758, 0.140670776, 0.137298584, 0.133590698, 0.129562378, 0.125259399, 0.120697021, 0.115921021, 0.110946655, 0.105819702, 0.100540161, 0.095169067, 0.089706421, 0.084182739, 0.078628540, 0.073059082, 0.067520142, 0.061996460, 0.056533813, 0.051132202, 0.045837402, 0.040634155, 0.035552979, 0.030609131, 0.025817871, 0.021179199, 0.016708374, 0.012420654, 0.008316040, 0.004394531, 0.000686646, -0.002822876, -0.006134033, -0.009231567, -0.012115479, -0.014801025, -0.017257690, -0.019531250, -0.021575928, -0.023422241, -0.025085449, -0.026535034, -0.027801514, -0.028884888, -0.029785156, -0.030517578, 0.031082153, 0.031478882, 0.031738281, 0.031845093, 0.031814575, 0.031661987, 0.031387329, 0.031005859, 0.030532837, 0.029937744, 0.029281616, 0.028533936, 0.027725220, 0.026840210, 0.025909424, 0.024932861, 0.023910522, 0.022857666, 0.021789551, 0.020690918, 0.019577026, 0.018463135, 0.017349243, 0.016235352, 0.015121460, 0.014022827, 0.012939453, 0.011886597, 0.010848999, 0.009841919, 0.008865356, 0.007919312, 0.007003784, 0.006118774, 0.005294800, 0.004486084, 0.003723145, 0.003005981, 0.002334595, 0.001693726, 0.001098633, 0.000549316, 0.000030518, -0.000442505, -0.000869751, -0.001266479, -0.001617432, -0.001937866, -0.002227783, -0.002487183, -0.002700806, -0.002883911, -0.003051758, -0.003173828, -0.003280640, -0.003372192, -0.003417969, -0.003463745, -0.003479004, -0.003479004, -0.003463745, -0.003433228, -0.003387451, -0.003326416, 0.003250122, 0.003173828, 0.003082275, 0.002990723, 0.002899170, 0.002792358, 0.002685547, 0.002578735, 0.002456665, 0.002349854, 0.002243042, 0.002120972, 0.002014160, 0.001907349, 0.001785278, 0.001693726, 0.001586914, 0.001480103, 0.001388550, 0.001296997, 0.001205444, 0.001113892, 0.001037598, 0.000961304, 0.000885010, 0.000808716, 0.000747681, 0.000686646, 0.000625610, 0.000579834, 0.000534058, 0.000473022, 0.000442505, 0.000396729, 0.000366211, 0.000320435, 0.000289917, 0.000259399, 0.000244141, 0.000213623, 0.000198364, 0.000167847, 0.000152588, 0.000137329, 0.000122070, 0.000106812, 0.000106812, 0.000091553, 0.000076294, 0.000076294, 0.000061035, 0.000061035, 0.000045776, 0.000045776, 0.000030518, 0.000030518, 0.000030518, 0.000030518, 0.000015259, 0.000015259, 0.000015259, 0.000015259, 0.000015259, 0.000015259};
    int clip = 0;               /* count & return how many samples clipped */

    if (init) {
        buf = (BB *) mem_alloc(sizeof(BB),"BB");
        filter = (NN *) mem_alloc(sizeof(NN), "NN");
        create_syn_filter(*filter);
        // window = (double *) mem_alloc(sizeof(double) * HAN_SIZE, "WIN");
        // read_syn_window(window);
        init = 0;
    }
    /*    if (channel == 0) */
    bufOffset[channel] = (bufOffset[channel] - 64) & 0x3ff;
    bufOffsetPtr = &((*buf)[channel][bufOffset[channel]]);

    for (i = 0; i < 64; i++)
    {
        sum = 0;
        for (k = 0; k < 32; k++)
            sum += bandPtr[k] * (*filter)[i][k];
        bufOffsetPtr[i] = sum;
    }
    /*  S(i,j) = D(j+32i) * U(j+32i+((i+1)>>1)*64)  */
    /*  samples(i,j) = MWindow(j+32i) * bufPtr(j+32i+((i+1)>>1)*64)  */
    for (j = 0; j < 32; j++)
    {
        sum = 0;
        for (i = 0; i < 16; i++)
        {
            k = j + (i << 5);
            sum += window[k] * (*buf) [channel] [( (k + ( ((i + 1) >> 1) << 6) ) +
                                                   bufOffset[channel]) & 0x3ff];
        }
        {
            /*long foo = (sum > 0) ? sum * SCALE + 0.5 : sum * SCALE - 0.5; */
            long foo = sum * SCALE;
            if (foo >= (long) SCALE)
            {
                samples[j] = SCALE - 1;
                ++clip;
            }
            else if (foo < (long) - SCALE)
            {
                samples[j] = -SCALE;
                ++clip;
            }
            else                           samples[j] = foo;
        }
    }
    return (clip);
}

void out_fifo(short pcm_sample[2][SSLIMIT][SBLIMIT], int num, struct frame_params *fr_ps, int done, FILE * outFile, unsigned long *psampFrames)
{
    int i, j, l;
    int stereo = fr_ps->stereo;
    int sblimit = fr_ps->sblimit;
    static short int outsamp[1600];
    static long k = 0;

    if (!done)
        for (i = 0; i < num; i++) for (j = 0; j < SBLIMIT; j++)
            {
                (*psampFrames)++;
                for (l = 0; l < stereo; l++)
                {
                    if (!(k % 1600) && k)
                    {
                        //write(outFile, outsamp, 2 * 1600);
						fwrite(outsamp,2,1600,outFile);
                        k = 0;
                    }
                    outsamp[k++] = pcm_sample[l][i][j];
                }
            }
    else
    {
        //write(outFile, outsamp, (int)k);
		fwrite(outsamp,2,(int)k,outFile);
        k = 0;
    }
    // int i,j,l;
    // int stereo = fr_ps->stereo;
    // //int sblimit = fr_ps->sblimit;
    // static short int outsamp[1600];
    // static long k = 0;

    //  for (i=0;i<num;i++)
    //  {
    //    for (j=0;j<SBLIMIT;j++) {
    //      (*psampFrames)++;
    //      for (l=0;l<stereo;l++) {
    //        if (!(k%1600) && k) {
    //          // fwrite(outsamp,2,1600,outFile);
    //          write(outFile, pcm_sample, 2 * 1600);
    //          k = 0;
    //        }
    //        outsamp[k++] = pcm_sample[l][i][j];
    //      }
    //    }
    //  }
}


void  buffer_CRC(Bit_stream_struct *bs, unsigned int *old_crc)
{
    *old_crc = getbits(bs, 16);
}


extern int bitrate[3][15];
extern double s_freq[4];
/* Return the number of slots for main data of current frame, */
int main_data_slots(struct frame_params fr_ps)
{
    int nSlots;

    // printf("main data slots\n");
    // printf("%d\n", fr_ps.header->bitrate_index);
    // printf("%d\n", fr_ps.header->sampling_frequency);

    nSlots = (144 * bitrate[2][fr_ps.header->bitrate_index])
             / s_freq[fr_ps.header->sampling_frequency];
    if (fr_ps.header->padding) nSlots++;
    nSlots -= 4;
    if (fr_ps.header->error_protection)
        nSlots -= 2;
    if (fr_ps.stereo == 1)
        nSlots -= 17;
    else
        nSlots -= 32;
    // printf("nSlots %d\n", nSlots);
    return (nSlots);
}

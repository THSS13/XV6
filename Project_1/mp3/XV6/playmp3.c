#include "types.h"
#include "user.h"
#include "sound.h"
#include "common.h"
#include "decode.h"

int main(int argc, char**argv)
{
	printf(1, "start \n");
	int pid = 0;
	if (pid == 0) {

	}
	int decodepid = fork();
	if (decodepid == 0) {
		int i;
		for (i = 0; i < 10; i ++)
		{
			printf(1,"%s\n", argv[i]);
		}
		exec("mp3dec", argv);
	}
	int mp3pid = 0;
	if (mp3pid == 0) {

	}
	setSampleRate(44100);
	Bit_stream_struct  bs;
	struct frame_params fr_ps;
	struct III_side_info_t III_side_info; 
	unsigned int old_crc;
	layer info;
	int sync;
	unsigned long bitsPerSlot;

	/*if (argc==1) {
		printf("Useage:decode file.mp3 output.pcm\n");
		return;
	}*/

	fr_ps.header = &info;

        open_bit_stream_r(&bs, "in.mp3", BUFFER_SIZE);
	int frame_Num = 0;

	while(!end_bs(&bs)) {
		
		sync = seek_sync(&bs, SYNC_WORD, SYNC_WORD_LENGTH);
		decode_info(&bs, &(fr_ps));
		
		hdr_to_frps(&(fr_ps));
		
		frame_Num = frame_Num + 1;
		printf(0, "read frame: %d\n", frame_Num);
		if (info.error_protection)
			buffer_CRC(&bs, &old_crc);
		switch (info.lay) {
		case 3:
		{
			int nSlots, main_data_end, flush_main;
			int bytes_to_discard;
			static int frame_start = 0;

			bitsPerSlot = 8;
			
			
			III_get_side_info(&bs, &(III_side_info), &(fr_ps));
			nSlots = main_data_slots(fr_ps);
			 
			for (; nSlots > 0; nSlots--)  /* read main data. */
				hputbuf((unsigned int) getbits(&bs,8), 8);
			main_data_end = hsstell() / 8; /*of privious frame*/
			if ( (flush_main=(hsstell() % bitsPerSlot))==TRUE ) {
				hgetbits((int)(bitsPerSlot - flush_main));
				main_data_end ++;
			}
			bytes_to_discard = frame_start - main_data_end - III_side_info.main_data_begin ;
			if( main_data_end > 4096 ) {   frame_start -= 4096;
				rewindNbytes( 4096 );
			}

			frame_start += main_data_slots(fr_ps);

			if (bytes_to_discard < 0) {
				printf(0, "discard: %d %d %d\n", frame_start, main_data_end, III_side_info.main_data_begin);
				
				break;
			}
			for (; bytes_to_discard > 0; bytes_to_discard--) hgetbits(8);
			beginDecode(&fr_ps, &III_side_info);
		}
		break;
		default:

			exit();
			break;
		}
	}
	close_bit_stream_r(&bs);
	printf(0, "\nPlaying done.\n");
	kill(pid);
	kill(decodepid);
	kill(mp3pid);
	wait();
	wait();
	wait();
	exit();
}

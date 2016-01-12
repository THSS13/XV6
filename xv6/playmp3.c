#include "types.h"
#include "user.h"
#include "sound.h"
#include "common.h"
#include "decode.h"

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

	//int pid = 0;//fork();
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

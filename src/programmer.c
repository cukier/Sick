/*
 * programmer.c
 *
 *  Created on: 27 de jan de 2016
 *      Author: cuki
 */

#include <18F25K22.h>
#fuses  mclr, primary, intrc, pllen, nowdt
#use delay(internal=64MHz)

//#use rs232(uart1, baud=9600, parity=E, stream=sl1)
#use rs232(uart2, baud=9600, stream=dbg)

#include "sick.c"

int main(void) {
	uint16_t char_count;
	uint8_t cont;

	DSF60_init_encoder();
	enable_interrupts(GLOBAL);
	delay_ms(50);
	char_count = DSF60_check();
	fprintf(dbg, "\n%u ", DSF60_check());

	if (char_count != 0) {
		for (cont = 0; cont < char_count; ++cont) {
			if (cont != 0 && !(cont % 8))
				fprintf(dbg, "\n");
			fprintf(dbg, "%c", buffer[cont]);
		}

		fprintf(dbg, "\n");
	}

	while (true) {
//		delay_ms(500);
//		output_toggle(ENCODER_EN);
	}

	return 0;
}

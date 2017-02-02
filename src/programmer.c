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
	bool encoder_ok;
	uint32_t pos_aux;
	float ang;

	DSF60_init_encoder();
	enable_interrupts(GLOBAL);
	delay_ms(50);
	encoder_ok = DSF60_check();
	fprintf(dbg, "inicializacao encoder: %u\n", encoder_ok);

	while (true) {
		if (encoder_ok) {
			encoder_ok = DSF60_make_transaction(DSF60_COMMAND_READ_POSITION, 0);

			if (encoder_ok) {
				if (pos_aux != dsf60->position) {
					pos_aux = dsf60->position;
					ang = ((float) dsf60->position) * 360 / 10000;
					fprintf(dbg, "Pos: %lu %f\n", dsf60->position, ang);
				}
			} else {
				fprintf(dbg, "encoder error\n");
			}
		}
		delay_ms(10);
	}

	return 0;
}

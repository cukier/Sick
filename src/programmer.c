/*
 * programmer.c
 *
 *  Created on: 27 de jan de 2016
 *      Author: cuki
 */

#include <18F25K22.h>

#ifdef FAST
#fuses  mclr, primary, intrc, pllen, nowdt
#use delay(internal=64MHz)
#else
#fuses  mclr, primary, intrc, nopllen, nowdt
#use delay(internal=16MHz)
#endif

#ifdef DEBUG
#ifdef USE_UART1
#use rs232(uart2, baud=9600, stream=dbg)
#else
#use rs232(uart1, baud=9600, stream=dbg)
#endif
#endif

#include "sick.c"

int main(void) {
	bool encoder_ok;
#ifdef DEBUG
	uint16_t cont;
	float ang;
	uint32_t pos_aux;
#endif

	DSF60_init_encoder();
	enable_interrupts(GLOBAL);
	delay_ms(50);
	encoder_ok = DSF60_check();
#ifdef DEBUG
	fprintf(dbg, "inicializacao encoder: %u\n", encoder_ok);
#endif

	if (encoder_ok) {
		encoder_ok = DSF60_make_transaction(DSF60_COMMAND_READ_ENCODER_TYPE, 0);
#ifdef DEBUG
		fprintf(dbg, "Resolucao %u %lu\n", encoder_ok, dsf60->resolution);

		fprintf(dbg, "Buffer %lu\n", buffer_index);

		for (cont = 0; cont < buffer_index; ++cont) {
			fprintf(dbg, "%lu-0x%X\n", cont, buffer[cont]);
		}
#endif
	}

	while (true) {
		if (encoder_ok) {
			encoder_ok = DSF60_make_transaction(DSF60_COMMAND_READ_POSITION, 0);

			if (encoder_ok) {
#ifdef DEBUG
				if (pos_aux != dsf60->position) {
					pos_aux = dsf60->position;
					ang = ((float) dsf60->position) * 360.0 / dsf60->resolution;
					fprintf(dbg, "Pos: %04lu %f\n", dsf60->position, ang);
				}
#endif
			}
		} else {
			encoder_ok = DSF60_check();

			if (!encoder_ok) {
#ifdef DEBUG
				fprintf(dbg, "encoder error\n");
#endif
			}

			delay_ms(1000);
		}

		delay_ms(10);
	}

	return 0;
}

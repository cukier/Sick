/*
 * programmer.c
 *
 *  Created on: 27 de jan de 2016
 *      Author: cuki
 */

#include <18F25K22.h>
#fuses  mclr, primary, intrc, nopllen, nowdt
#use delay(internal=16MHz)

#define USE_UART1

#ifndef USE_UART1
#use rs232(uart1, baud=9600, stream=dbg)
#else
#use rs232(uart2, baud=9600, stream=dbg)
#endif

#include "sick.c"

int main(void) {
//	int cont = 0;
//
//	while (TRUE) {
//		output_toggle(PIN_C2);
//		fprintf(sl1, "%u", cont++);
//		delay_ms(2000);
//	}

	bool encoder_ok;
	uint32_t pos_aux;
	float ang;
	uint8_t cont;

	DSF60_init_encoder();
	enable_interrupts(GLOBAL);
	delay_ms(50);
	encoder_ok = DSF60_check();
	fprintf(dbg, "inicializacao encoder: %u\n", encoder_ok);

//	while (true) {
//		if (encoder_ok) {
	encoder_ok = DSF60_make_transaction(DSF60_COMMAND_READ_POSITION, 0);
	fprintf(dbg, "make_transaction %u %lu\n", encoder_ok, buffer_index);

//		if (encoder_ok) {
//	if (pos_aux != dsf60->position) {
//		pos_aux = dsf60->position;
//		ang = ((float) dsf60->position) * 360.0 / 10000.0;
//		fprintf(dbg, "Pos: %04lu %f\n", dsf60->position, ang);
//	}

	for (cont = 0; cont < buffer_index; ++cont) {
		printf("%u-0x%X\n", cont, buffer[cont]);
	}
//		}
//		} else {
//			encoder_ok = DSF60_check();
//			fprintf(dbg, "check %u %lu\n", encoder_ok, buffer_index);
//			delay_ms(2000);
//		}

	delay_ms(500);
//	}

	while (true)
		;

	return 0;
}

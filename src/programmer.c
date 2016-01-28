/*
 * programmer.c
 *
 *  Created on: 27 de jan de 2016
 *      Author: cuki
 */

#include <18F252.h>

#fuses H4
#use delay(Clock=40MHz, Crystal=10MHz)
#use rs232(UART1, baud=115200, parity=E)
//#use rs232(UART1, baud=115200)

#include "sick.c"

int main(void) {

	short b0_ctrl, b1_ctrl;
	int data[BUFFER_SIZE], request[REQUEST_SIZE];

	b0_ctrl = TRUE;
	b1_ctrl = TRUE;
	init_mcu();
	delay_ms(50);

	while (TRUE) {
		if (!input(PIN_B0) && b0_ctrl) {
			b0_ctrl = FALSE;
			delay_ms(100);
			if (!input(PIN_B0)) {
				init_encoder();
			}
		} else if (input(PIN_B0) && !b0_ctrl) {
			b0_ctrl = TRUE;
		}
		if (!input(PIN_B1) && b1_ctrl) {
			b1_ctrl = FALSE;
			delay_ms(100);
			if (!input(PIN_B1)) {
				send_command(ENCODER_ADDRESS, READ_POSITION, request, data);
			}
		} else if (input(PIN_B1) && !b1_ctrl) {
			b1_ctrl = TRUE;
		}
	}

	return 0;
}

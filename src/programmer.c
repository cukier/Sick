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

#include "sick.c"

int main(void) {

	short send;
	int resp, data[BUFFER_SIZE];

	init_mcu();
	delay_ms(1000);
//	printf("Iniciando Encoder\n\r");
	resp = init_encoder(2);
//	printf("Responsta: %u", resp);

	while (TRUE) {
		if (!input(PIN_B0) && send) {
			send = FALSE;
			delay_ms(100);
			if (!input(PIN_B0)) {
				send_command(READ_POSITION, data);
			}
		} else if (input(PIN_B0) && !send) {
			send = TRUE;
		}
	}

	return 0;
}

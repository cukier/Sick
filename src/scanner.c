/*
 * scanner.c
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

	short out;
	int resp;

	init_mcu();
	delay_ms(1000);
//	printf("Iniciando Encoder\n\r");
	resp = init_encoder(1);
//	printf("Responsta: %u", resp);

	while (TRUE)
		;

	return 0;
}

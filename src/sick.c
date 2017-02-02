/*
 * sick.c
 *
 *  Created on: 26 de jan de 2016
 *      Author: cuki
 */

#include "sick.h"
#include <stdint.h>
#include <stdbool.h>
#include <stdlibm.h>

#define T0_REG	55535

bool t_ok;
uint8_t *buffer;
uint16_t buffer_index;

#ifdef __PCH__
//#use rs232(uart1, baud=115200, parity=E, stream=sl1)
#use rs232(uart1, baud=115200, parity=E, stream=sl1)
#endif

#INT_RDA
void DSF60_isr_rda() {
	buffer = (uint8_t *) realloc(buffer, buffer_index + 1);
	buffer[buffer_index] = fgetc(sl1);
	buffer_index++;

#ifdef __PCH__
//	set_timer0(0);
//	setup_timer_0(T0_INTERNAL | T0_DIV_8);
	clear_interrupt(INT_RDA);
#endif
}

#ifdef __PCH__
#INT_TIMER0
#endif
void DSF60_isr_tmr0() {
#ifdef __PCH__
	clear_interrupt(INT_TIMER0);
	setup_timer_0(T0_OFF);
#endif
	t_ok = true;
}

void DSF60_send_request(uint8_t *req, uint16_t size) {
	uint16_t cont;

	for (cont = 0; cont < size; ++cont)
		fputc(req[cont], sl1);

	return;
}

void DSF60_flush_buffer(void) {
	free(buffer);
	buffer_index = 0;

	return;
}

void DSF60_init_encoder(void) {
#ifdef __PCH__
	clear_interrupt(INT_TIMER0);
	enable_interrupts(INT_TIMER0);

	clear_interrupt(INT_RDA);
	enable_interrupts(INT_RDA);
#endif

	DSF60_flush_buffer();

	return;
}

uint8_t DSF60_crc_sum(uint8_t *data, uint16_t size) {
	uint8_t i = 0, ret = 0;

	for (i = 0; i < size; ++i)
		ret ^= data[i];

	return ret;
}

void DSF60_encoder_reset(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_ENCODER_RESET;
	req[2] = DSF60_crc_sum(req, 2);
	DSF60_send_request(req, 3);
	free(req);

	return;
}

void DSF60_read_serial_number(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_READ_SERIAL_NUMBER;
	req[2] = DSF60_crc_sum(req, 2);
	DSF60_send_request(req, 3);
	free(req);

	return;
}

void DSF60_read_position(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(4 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_READ_POSITION;
	req[2] = 0x21; //FORMAT
	req[3] = DSF60_crc_sum(req, 3);
	DSF60_send_request(req, 4);
	free(req);

	return;
}

uint8_t DSF60_read_encoder_type(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_READ_ENCODER_TYPE;
	req[2] = DSF60_crc_sum(req, 2);
	DSF60_send_request(req, 3);
	free(req);

	return EXIT_SUCESS;

}

void DSF60_disable_encoder(void) {
	output_high(ENCODER_EN);

	return;
}

void DSF60_enable_encoder(void) {
	output_low(ENCODER_EN);

	return;
}

uint8_t DSF60_check(void) {
	uint8_t retries;

	DSF60_flush_buffer();
	DSF60_disable_encoder();
	delay_ms(2000);
	DSF60_enable_encoder();
	delay_ms(20);
	DSF60_read_encoder_type();
	delay_ms(50);

	if (buffer_index != 0) {
		delay_ms(300);
		return buffer_index;
	}

	return EXIT_ERROR;
}

bool DSF60_make_transaction(DSF60_command_t command) {
	uint8_t retries, resp;

	retries = 200;

	do {
		resp = EXIT_SUCESS;
		resp = DSF60_check();
		delay_ms(100);

		if (!retries)
			return false;

	} while (resp == EXIT_ERROR && --retries);

	DSF60_flush_buffer();

	switch (command) {
	case DSF60_COMMAND_ENCODER_RESET:
		DSF60_encoder_reset();
		break;
	case DSF60_COMMAND_READ_ENCODER_TYPE:
		DSF60_read_encoder_type();
		break;
	}

	return true;
}

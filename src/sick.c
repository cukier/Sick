/*
 * sick.c
 *
 *  Created on: 26 de jan de 2016
 *      Author: cuki
 */

#include "sick.h"
#include <stdlibm.h>

#define T0_REG	55535

bool t_ok;
uint8_t *buffer;
uint16_t buffer_index;

#ifdef __PCH__
#use rs232(uart1, baud=115200, parity=E, stream=sl1)
#endif

#INT_RDA
void DSF60_isr_rda() {
	buffer = (uint8_t *) realloc(buffer, buffer_index + 1);
	buffer[buffer_index] = fgetc(sl1);
	buffer_index++;

#ifdef __PCH__
	clear_interrupt(INT_RDA);
#endif
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
	clear_interrupt(INT_RDA);
	enable_interrupts(INT_RDA);
#endif

	DSF60_flush_buffer();
	dsf60 = (dsf60_t *) malloc(sizeof(dsf60_t));

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

void DSF60_set_number_lines(uint32_t n_lines) {
	uint8_t *req;

	req = (uint8_t *) malloc(7 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_SET_NUMBER_OF_LINES;
	req[2] = (uint8_t) ((n_lines & 0x0F00) >> 16);
	req[3] = (uint8_t) ((n_lines & 0x00F0) >> 8);
	req[4] = (uint8_t) ((n_lines & 0x000F));
	req[5] = 0x69; //ACCESS code
	req[6] = DSF60_crc_sum(req, 6);
	DSF60_send_request(req, 7);
	free(req);

	return;
}

void DSF60_set_electrical_interface(uint8_t mode) {
	uint8_t *req;

	req = (uint8_t *) malloc(5 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_SET_ELECTRICAL_INTERFACE;
	req[2] = mode;
	req[3] = 0x69; //ACCESS code
	req[4] = DSF60_crc_sum(req, 4);
	DSF60_send_request(req, 5);
	free(req);

	return;
}

void DSF60_set_zero_pulse_width_electrical(uint8_t mode) {
	uint8_t *req;

	req = (uint8_t *) malloc(5 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_SET_ZERO_PULSE_WIDTH_ELECTRICAL;
	req[2] = mode;
	req[3] = 0x69; //ACCESS code
	req[4] = DSF60_crc_sum(req, 4);
	DSF60_send_request(req, 5);
	free(req);

	return;
}

void DSF60_zero_set(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(5 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_ZERO_SET;
	req[2] = 0x69; //ACCESS code
	req[3] = DSF60_crc_sum(req, 3);
	DSF60_send_request(req, 4);
	free(req);

	return;
}

void DSF60_read_encoder_type(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_READ_ENCODER_TYPE;
	req[2] = DSF60_crc_sum(req, 2);
	DSF60_send_request(req, 3);
	free(req);

	return;
}

void DSF60_set_zero_pulse_width_mechanical(uint16_t degrees) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_SET_ZERO_PULSE_WIDTH_MECHANICAL;
	req[2] = (uint8_t) ((degrees & 0xF0) >> 8);
	req[3] = (uint8_t) (degrees & 0x0F);
	req[4] = DSF60_crc_sum(req, 4);
	DSF60_send_request(req, 5);
	free(req);

	return;
}

void DSF60_read_zero_pulse_width_electrical_mechanical(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_READ_ZERO_PULSE_WIDTH_ELECTRIAL_MECHANICAL;
	req[2] = DSF60_crc_sum(req, 2);
	DSF60_send_request(req, 3);
	free(req);

	return;
}

void DSF60_read_electrical_interface(void) {
	uint8_t *req;

	req = (uint8_t *) malloc(3 * sizeof(uint8_t));
	req[0] = DSF60_ADDRESS;
	req[1] = DSF60_COMMAND_READ_ELECTRICAL_INTERFACE;
	req[2] = DSF60_crc_sum(req, 2);
	DSF60_send_request(req, 3);
	free(req);

	return;
}

void DSF60_disable_encoder(void) {
	output_high(ENCODER_EN);

	return;
}

void DSF60_enable_encoder(void) {
	output_low(ENCODER_EN);

	return;
}

bool DSF60_check(void) {
	uint8_t retries;

	DSF60_flush_buffer();
	DSF60_disable_encoder();
	delay_ms(2000);
	DSF60_enable_encoder();
	delay_ms(20);
	DSF60_read_encoder_type();
	delay_ms(50);

	if (buffer_index != 0) {
		DSF60_flush_buffer();
		return true;
	}

	DSF60_flush_buffer();
	return false;
}

bool DSF60_make_transaction(DSF60_command_t command, uint32_t arg) {
	uint8_t retries, resp, n, cont;
	uint16_t pulse_width_resp;

	retries = 200;
	n = 0;
	pulse_width_resp = 0;

//	do {
//		resp = EXIT_SUCESS;
//		resp = DSF60_check();
//		delay_ms(100);
//
//		if (!retries)
//			return false;
//
//	} while (resp == EXIT_ERROR && --retries);

	DSF60_flush_buffer();

	switch (command) {
	case DSF60_COMMAND_ENCODER_RESET:
		DSF60_encoder_reset();
		break;
	case DSF60_COMMAND_READ_SERIAL_NUMBER:
		DSF60_read_serial_number();
		n = 30;
		break;
	case DSF60_COMMAND_READ_POSITION:
		DSF60_read_position();
		n = 7;
		break;
	case DSF60_COMMAND_SET_NUMBER_OF_LINES:
		DSF60_set_number_lines(arg);
		n = 3;
		break;
	case DSF60_COMMAND_SET_ELECTRICAL_INTERFACE:
		DSF60_set_electrical_interface((uint8_t) arg);
		n = 3;
		break;
	case DSF60_COMMAND_SET_ZERO_PULSE_WIDTH_ELECTRICAL:
		DSF60_set_zero_pulse_width_electrical((uint8_t) arg);
		n = 3;
		break;
	case DSF60_COMMAND_ZERO_SET:
		DSF60_zero_set();
		n = 3;
		break;
	case DSF60_COMMAND_READ_ENCODER_TYPE:
		DSF60_read_encoder_type();
		n = 37;
		break;
	case DSF60_COMMAND_SET_ZERO_PULSE_WIDTH_MECHANICAL:
		DSF60_set_zero_pulse_width_mechanical((uint16_t) arg);
		n = 3;
		break;
	case DSF60_COMMAND_READ_ZERO_PULSE_WIDTH_ELECTRIAL_MECHANICAL:
		DSF60_read_zero_pulse_width_electrical_mechanical();
		n = 5;
		break;
	case DSF60_COMMAND_READ_ELECTRICAL_INTERFACE:
		DSF60_read_electrical_interface();
		n = 4;
		break;
	default:
		n = 0;
		break;
	}

	delay_ms(100);

	if (buffer_index != n) {
		return false;
	}

	switch (command) {
	case DSF60_COMMAND_READ_SERIAL_NUMBER:
		for (cont = 0; cont < 9; ++cont)
			dsf60->serial_number[cont] = buffer[cont + 2];

		dsf60->serial_number[cont] = '\0';

		for (cont = 0; cont < 10; ++cont)
			dsf60->firmware_version[cont] = buffer[cont + 11];

		dsf60->firmware_version[cont] = '\0';

		for (cont = 0; cont < 8; ++cont)
			dsf60->firmware_date[cont] = buffer[cont + 21];

		dsf60->firmware_date[cont] = '\0';
		break;
	case DSF60_COMMAND_READ_POSITION:
		dsf60->position = make32(buffer[2], buffer[3], buffer[4], buffer[5]);
		break;
	case DSF60_COMMAND_SET_NUMBER_OF_LINES:
		break;
	case DSF60_COMMAND_SET_ELECTRICAL_INTERFACE:
		break;
	case DSF60_COMMAND_SET_ZERO_PULSE_WIDTH_ELECTRICAL:
		break;
	case DSF60_COMMAND_ZERO_SET:
		break;
	case DSF60_COMMAND_READ_ENCODER_TYPE:
		for (cont = 0; cont < 16; ++cont)
			dsf60->part_number[cont] = buffer[cont + 2];

		dsf60->part_number[cont] = '\0';

		for (cont = 0; cont < 7; ++cont)
			dsf60->encoder_type[cont] = buffer[cont + 18];

		dsf60->encoder_type[cont] = '\0';

		for (cont = 0; cont < 8; ++cont)
			dsf60->date_code[cont] = buffer[cont + 25];

		dsf60->date_code[cont] = '\0';
		dsf60->resolution = make32(0, buffer[cont + 1], buffer[cont + 2],
				buffer[cont + 3]);
		break;
	case DSF60_COMMAND_SET_ZERO_PULSE_WIDTH_MECHANICAL:
		break;
	case DSF60_COMMAND_READ_ZERO_PULSE_WIDTH_ELECTRIAL_MECHANICAL:
		pulse_width_resp = make16(buffer[2], buffer[3]);

		if (pulse_width_resp > 1 && pulse_width_resp < 360) {
			dsf60->pulse_width_mechanical = pulse_width_resp;
			dsf60->pulse_width_electrical = 0;
		} else {
			dsf60->pulse_width_mechanical = 0;
			dsf60->pulse_width_electrical &= 0x00FF;

			if ((pulse_width_resp & DSF60_90_DEGREES) == DSF60_90_DEGREES)
				dsf60->pulse_width_electrical = DSF60_90_DEGREES;
			else if ((pulse_width_resp & DSF60_180_DEGREES_CHANNEL_A)
					== DSF60_180_DEGREES_CHANNEL_A)
				dsf60->pulse_width_electrical = DSF60_180_DEGREES_CHANNEL_A;
			else if ((pulse_width_resp & DSF60_180_DEGREES_CHANNEL_B)
					== DSF60_180_DEGREES_CHANNEL_B)
				dsf60->pulse_width_electrical = DSF60_180_DEGREES_CHANNEL_B;
			else if ((pulse_width_resp & DSF60_270_DEGREES)
					== DSF60_270_DEGREES)
				dsf60->pulse_width_electrical = DSF60_270_DEGREES;
		}

		break;
	case DSF60_COMMAND_READ_ELECTRICAL_INTERFACE:
		if ((buffer[2] & 0b0001) == DSF60_TTL)
			dsf60->pulse_width_electrical = DSF60_TTL;
		else
			dsf60->pulse_width_electrical = DSF60_HTL;

		break;
	}

	DSF60_flush_buffer();

	return true;
}

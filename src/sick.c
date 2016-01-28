/*
 * sick.c
 *
 *  Created on: 26 de jan de 2016
 *      Author: cuki
 */

#include "sick.h"

#INT_RDA
void isr_rda() {
	clear_interrupt(INT_RDA);
	buffer[pos++] = getc();

	if (pos >= BUFFER_SIZE)
		pos = 0;

	set_timer0(0);
	setup_timer_0(T0_INTERNAL | T0_DIV_4);
}

#INT_TIMER0
void isr_tmr0() {
	clear_interrupt(INT_TIMER0);
	setup_timer_0(T0_OFF);
	received = TRUE;
}

int turn_on_encoder(void) {
	output_high(ENCODER_PIN);
	return 0;
}

int turn_off_encoder(void) {
	output_low(ENCODER_PIN);
	return 0;
}

int reset_encoder(long i_time) {
	turn_off_encoder();
	delay_ms(i_time);
	turn_on_encoder();
	return 0;
}

int crc_sum(int *data, int size) {
	int i = 0, ret = 0;

	for (i = 0; i < size; ++i)
		ret ^= data[i];

	return ret;
}

int make_request(int address, int command, int *req, int *data) {
	int ret;

	req[0] = address;
	req[1] = command;

	switch (command) {
	default:
	case ENCODER_RESET:
	case READ_SERIAL_NR:
	case READ_ENCODER_TYPE:
	case READ_ZERO_MECH_ELEC:
	case READ_ELECTRICAL_INTERFACE:
		req[2] = crc_sum(req, 2);
		ret = 3;
		break;
	case READ_POSITION:
		req[2] = 0x21;
		req[3] = crc_sum(req, 3);
		ret = 4;
		break;
	case ZERO_SET_FUN:
		req[2] = ACCESS_CODE;
		req[3] = crc_sum(req, 3);
		ret = 4;
		break;
	case SET_ELECTRICAL_INTERFACE:
	case SET_ZERO_ELECTRICAL:
		req[2] = data[0];
		req[3] = ACCESS_CODE;
		req[4] = crc_sum(req, 4);
		ret = 5;
		break;
	case ENCODER_COMMAND:
	case SET_ZERO_MECHANICAL:
		req[2] = data[0];
		req[3] = data[1];
		req[4] = ACCESS_CODE;
		req[5] = crc_sum(req, 5);
		ret = 6;
		break;
	case SET_NUMBER_LINES:
		req[2] = data[0];
		req[3] = data[1];
		req[4] = data[2];
		req[5] = ACCESS_CODE;
		req[6] = crc_sum(req, 6);
		ret = 7;
		break;
	}

	return ret;
}

int send_request(int *req, int size) {
	int i;

	for (i = 0; i < size; ++i)
		putc(req[i]);

	return i;
}

int send_command(int address, int command, int *req, int *data) {
	int size;

	size = make_request(address, command, req, data);
	send_request(req, size);

	return size;
}

int make_transaction(int address, int command, int *data) {
	long time_out = 0xFFFF;
	int request[REQUEST_SIZE];

	received = FALSE;
	send_command(address, command, request, data);

	while (time_out-- && !received)
		;

	if (!time_out)
		return ERROR;

	return 0;
}

int init_encoder(void) {
	int ret = ERROR, cont = 20;
	long t1;
	int req[REQUEST_SIZE], data[3];

	data[0] = 0x00;
	data[1] = 0xE8;

	reset_encoder(ENCODER_RESET_TIME);
	delay_ms(WAIT_TIME);
//	putc(ENCODER_RESET_PS);
	putc(ENCODER_RESET);
	do {
		putc(0xFF);
		putc(0x41);
		putc(0x00);
		putc(0xE8);
		putc(0x69);
		putc(0x3F);
		delay_us(50);
	} while (--cont);
//	send_command(GENERAL_ADDRESS, ENCODER_COMMAND, req, data);
	delay_ms(ENCODER_INIT_TIME);
	setup_timer_1(0);
	setup_timer_1(T1_INTERNAL | T1_DIV_BY_2);

	do {
//		ret = make_transaction(READ_SERIAL_NR, data);
		send_command(GENERAL_ADDRESS, ENCODER_COMMAND, req, data);
		t1 = get_timer1();
		delay_us(1000);
	} while (ret == ERROR && t1 < T1_10MS);

	if (t1 >= T1_10MS)
		return ERROR;

	return 0;
}

int init_mcu(void) {

	pos = 0;
	received = FALSE;

	output_high(ENCODER_PIN);

	clear_interrupt(INT_TIMER0);
	clear_interrupt(INT_RDA);
	setup_timer_0(T0_OFF);
	set_timer0(0);

	return 0;
}

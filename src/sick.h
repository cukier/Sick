/*
 * sick.h
 *
 *  Created on: 27 de jan de 2016
 *      Author: cuki
 */

#ifndef SICK_H_
#define SICK_H_

//ENCODER`S REGISTERS
#define ENCODER_ADDRESS				0x40
#define ENCODER_RESET				0x53
#define READ_SERIAL_NR				0x56
#define READ_POSITION				0x92
#define SET_NUMBER_LINES			0x96
#define SET_ELECTRICAL_INTERFACE	0x97
#define SET_ZERO_ELECTRICAL			0x98
#define ZERO_SET_FUN				0x99
#define READ_ENCODER_TYPE			0x9A
#define SET_ZERO_MECHANICAL			0x9B
#define READ_ZERO_MECH_ELEC			0x9C
#define	READ_ELECTRICAL_INTERFACE	0x9D
#define ACCESS_CODE					0x69
//SICK PROGRAMMER
#define ENCODER_RESET_PS			0xC0
#define ENCODER_COMMAND				0x41
#define GENERAL_ADDRESS				0xFF
//ENCODER BUS
#ifndef ENCODER_PIN
#define ENCODER_PIN					PIN_C0
#endif
//REQUEST/RESPONSE
#define ERROR						0xFF
#define REQUEST_SIZE				8
#define BUFFER_SIZE					25
//SET ELECTRICAL INTERFACE
#define MODE_TTL					0x00
#define MODE_HTL					0x01
//SET ZERO PULSE WIDTH ELECTRICAL
#define MODE_90_AB					0x00
#define MODE_180_B					0x01
#define MODE_180_A					0x02
#define MODE_270_AB					0x03
//TEMPOS
#define ENCODER_RESET_TIME			2000
#define ENCODER_INIT_TIME			20
#define WAIT_TIME					10
#define T1_10MS						50000

short received = FALSE;
int buffer[BUFFER_SIZE];
long pos;

void isr_rda();
void isr_tmr0();
int turn_on_encoder(void);
int turn_off_encoder(void);
int reset_encoder(long i_time);
int crc_sum(int *data, int size);
int make_request(int address, int command, int *req, int *data);
int send_request(int *req, int size);
int send_command(int address, int command, int *req, int *data);
int make_transaction(int address, int command, int *data);
int init_encoder(void);
int init_mcu(void);

#endif /* SICK_H_ */

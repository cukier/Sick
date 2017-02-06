EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:w_relay
LIBS:sick-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PIC18F2XK22 U2
U 1 1 5894B9B5
P 3800 3450
F 0 "U2" H 5150 4500 60  0000 C CNN
F 1 "PIC18F2XK22" H 2550 4500 60  0000 C CNN
F 2 "" H 3650 3450 60  0000 C CNN
F 3 "" H 3650 3450 60  0000 C CNN
	1    3800 3450
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5894BA0E
P 1800 2300
F 0 "R1" V 1880 2300 50  0000 C CNN
F 1 "10k" V 1800 2300 50  0000 C CNN
F 2 "" V 1730 2300 50  0000 C CNN
F 3 "" H 1800 2300 50  0000 C CNN
	1    1800 2300
	1    0    0    -1  
$EndComp
$Comp
L LM7805CT U1
U 1 1 5894BAA8
P 2350 950
F 0 "U1" H 2150 1150 50  0000 C CNN
F 1 "LM7805CT" H 2350 1150 50  0000 L CNN
F 2 "TO-220" H 2350 1050 50  0000 C CIN
F 3 "" H 2350 950 50  0000 C CNN
	1    2350 950 
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X02 P1
U 1 1 5894BC09
P 700 950
F 0 "P1" H 700 1100 50  0000 C CNN
F 1 "PWR" V 800 950 50  0000 C CNN
F 2 "" H 700 950 50  0000 C CNN
F 3 "" H 700 950 50  0000 C CNN
	1    700  950 
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR1
U 1 1 5894BC4E
P 1000 1100
F 0 "#PWR1" H 1000 1100 30  0001 C CNN
F 1 "GND" H 1000 1030 30  0001 C CNN
F 2 "" H 1000 1100 60  0000 C CNN
F 3 "" H 1000 1100 60  0000 C CNN
	1    1000 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 1100 1000 1000
Wire Wire Line
	1000 1000 900  1000
$Comp
L D_Small D1
U 1 1 5894BD8D
P 1200 900
F 0 "D1" H 1150 980 50  0000 L CNN
F 1 "1n4007" H 1050 820 50  0000 L CNN
F 2 "" V 1200 900 50  0000 C CNN
F 3 "" V 1200 900 50  0000 C CNN
	1    1200 900 
	-1   0    0    1   
$EndComp
Wire Wire Line
	1100 900  900  900 
Wire Wire Line
	1300 900  1950 900 
$Comp
L CP C1
U 1 1 5894BEA1
P 1450 1150
F 0 "C1" H 1475 1250 50  0000 L CNN
F 1 "470uF" H 1475 1050 50  0000 L CNN
F 2 "" H 1488 1000 50  0000 C CNN
F 3 "" H 1450 1150 50  0000 C CNN
	1    1450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1000 1450 900 
Connection ~ 1450 900 
$Comp
L GND #PWR2
U 1 1 5894BF19
P 1450 1350
F 0 "#PWR2" H 1450 1350 30  0001 C CNN
F 1 "GND" H 1450 1280 30  0001 C CNN
F 2 "" H 1450 1350 60  0000 C CNN
F 3 "" H 1450 1350 60  0000 C CNN
	1    1450 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1450 1350 1450 1300
$Comp
L C C2
U 1 1 5894BFD4
P 1750 1150
F 0 "C2" H 1775 1250 50  0000 L CNN
F 1 "100nF" H 1775 1050 50  0000 L CNN
F 2 "" H 1788 1000 50  0000 C CNN
F 3 "" H 1750 1150 50  0000 C CNN
	1    1750 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR4
U 1 1 5894C00E
P 1750 1350
F 0 "#PWR4" H 1750 1350 30  0001 C CNN
F 1 "GND" H 1750 1280 30  0001 C CNN
F 2 "" H 1750 1350 60  0000 C CNN
F 3 "" H 1750 1350 60  0000 C CNN
	1    1750 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1350 1750 1300
Wire Wire Line
	1750 1000 1750 900 
Connection ~ 1750 900 
$Comp
L GND #PWR6
U 1 1 5894C226
P 2350 1300
F 0 "#PWR6" H 2350 1300 30  0001 C CNN
F 1 "GND" H 2350 1230 30  0001 C CNN
F 2 "" H 2350 1300 60  0000 C CNN
F 3 "" H 2350 1300 60  0000 C CNN
	1    2350 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 1300 2350 1200
$Comp
L CP C3
U 1 1 5894C50E
P 2900 1150
F 0 "C3" H 2925 1250 50  0000 L CNN
F 1 "470uF" H 2925 1050 50  0000 L CNN
F 2 "" H 2938 1000 50  0000 C CNN
F 3 "" H 2900 1150 50  0000 C CNN
	1    2900 1150
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5894C5A2
P 3200 1150
F 0 "C4" H 3225 1250 50  0000 L CNN
F 1 "100nF" H 3225 1050 50  0000 L CNN
F 2 "" H 3238 1000 50  0000 C CNN
F 3 "" H 3200 1150 50  0000 C CNN
	1    3200 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR7
U 1 1 5894C5F7
P 2900 1350
F 0 "#PWR7" H 2900 1350 30  0001 C CNN
F 1 "GND" H 2900 1280 30  0001 C CNN
F 2 "" H 2900 1350 60  0000 C CNN
F 3 "" H 2900 1350 60  0000 C CNN
	1    2900 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1350 2900 1300
$Comp
L GND #PWR9
U 1 1 5894C633
P 3200 1350
F 0 "#PWR9" H 3200 1350 30  0001 C CNN
F 1 "GND" H 3200 1280 30  0001 C CNN
F 2 "" H 3200 1350 60  0000 C CNN
F 3 "" H 3200 1350 60  0000 C CNN
	1    3200 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 1350 3200 1300
Wire Wire Line
	3200 850  3200 1000
Wire Wire Line
	2750 900  3200 900 
Wire Wire Line
	2900 1000 2900 900 
Connection ~ 2900 900 
$Comp
L +5V #PWR8
U 1 1 5894C723
P 3200 850
F 0 "#PWR8" H 3200 940 20  0001 C CNN
F 1 "+5V" H 3200 940 30  0000 C CNN
F 2 "" H 3200 850 60  0000 C CNN
F 3 "" H 3200 850 60  0000 C CNN
	1    3200 850 
	1    0    0    -1  
$EndComp
Connection ~ 3200 900 
$Comp
L +5V #PWR5
U 1 1 5894C988
P 1800 2050
F 0 "#PWR5" H 1800 2140 20  0001 C CNN
F 1 "+5V" H 1800 2140 30  0000 C CNN
F 2 "" H 1800 2050 60  0000 C CNN
F 3 "" H 1800 2050 60  0000 C CNN
	1    1800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2050 1800 2150
Wire Wire Line
	1550 2500 2000 2500
Wire Wire Line
	1800 2500 1800 2450
$Comp
L SW_PUSH SW1
U 1 1 5894CC1E
P 1550 2950
F 0 "SW1" H 1700 3060 50  0000 C CNN
F 1 "SW_PUSH" H 1550 2870 50  0000 C CNN
F 2 "" H 1550 2950 50  0000 C CNN
F 3 "" H 1550 2950 50  0000 C CNN
	1    1550 2950
	0    -1   1    0   
$EndComp
$Comp
L GND #PWR3
U 1 1 5894CCDF
P 1550 3350
F 0 "#PWR3" H 1550 3350 30  0001 C CNN
F 1 "GND" H 1550 3280 30  0001 C CNN
F 2 "" H 1550 3350 60  0000 C CNN
F 3 "" H 1550 3350 60  0000 C CNN
	1    1550 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3350 1550 3250
Connection ~ 1800 2500
$Comp
L +5V #PWR14
U 1 1 5894DDF3
P 5700 3850
F 0 "#PWR14" H 5700 3940 20  0001 C CNN
F 1 "+5V" H 5700 3940 30  0000 C CNN
F 2 "" H 5700 3850 60  0000 C CNN
F 3 "" H 5700 3850 60  0000 C CNN
	1    5700 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 3850 5700 4000
Wire Wire Line
	5450 4000 5900 4000
$Comp
L GND #PWR13
U 1 1 5894DF89
P 5600 4400
F 0 "#PWR13" H 5600 4400 30  0001 C CNN
F 1 "GND" H 5600 4330 30  0001 C CNN
F 2 "" H 5600 4400 60  0000 C CNN
F 3 "" H 5600 4400 60  0000 C CNN
	1    5600 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4200 5600 4400
Wire Wire Line
	5600 4200 5450 4200
Wire Wire Line
	5450 4300 5600 4300
Connection ~ 5600 4300
$Comp
L C C5
U 1 1 5894E1A3
P 5900 4200
F 0 "C5" H 5925 4300 50  0000 L CNN
F 1 "100nF" H 5925 4100 50  0000 L CNN
F 2 "" H 5938 4050 50  0000 C CNN
F 3 "" H 5900 4200 50  0000 C CNN
	1    5900 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4000 5900 4050
Connection ~ 5700 4000
$Comp
L GND #PWR15
U 1 1 5894E46F
P 5900 4450
F 0 "#PWR15" H 5900 4450 30  0001 C CNN
F 1 "GND" H 5900 4380 30  0001 C CNN
F 2 "" H 5900 4450 60  0000 C CNN
F 3 "" H 5900 4450 60  0000 C CNN
	1    5900 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4450 5900 4350
$Comp
L CONN_01X05 P2
U 1 1 5894E84D
P 3850 1100
F 0 "P2" H 3850 1400 50  0000 C CNN
F 1 "ISCP" V 3950 1100 50  0000 C CNN
F 2 "" H 3850 1100 50  0000 C CNN
F 3 "" H 3850 1100 50  0000 C CNN
	1    3850 1100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4050 900  4500 900 
Wire Wire Line
	4050 1000 4500 1000
Wire Wire Line
	4050 1100 4650 1100
Wire Wire Line
	4050 1200 4500 1200
Wire Wire Line
	4050 1300 4500 1300
Text Label 4150 900  0    60   ~ 0
MCLR
Text Label 1700 2500 2    60   ~ 0
MCLR
NoConn ~ 4500 1000
$Comp
L GND #PWR10
U 1 1 5894EF0E
P 4650 1200
F 0 "#PWR10" H 4650 1200 30  0001 C CNN
F 1 "GND" H 4650 1130 30  0001 C CNN
F 2 "" H 4650 1200 60  0000 C CNN
F 3 "" H 4650 1200 60  0000 C CNN
	1    4650 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 1100 4650 1200
Wire Wire Line
	5450 3100 5850 3100
Wire Wire Line
	5450 3200 5850 3200
Text Label 5600 3100 0    60   ~ 0
PGC
Text Label 4150 1300 0    60   ~ 0
PGC
Text Label 5600 3200 0    60   ~ 0
PGD
Text Label 4150 1200 0    60   ~ 0
PGD
Wire Wire Line
	1550 2500 1550 2650
NoConn ~ 2000 2700
NoConn ~ 2000 2800
NoConn ~ 2000 2900
NoConn ~ 2000 3000
NoConn ~ 2000 3100
NoConn ~ 2000 3200
NoConn ~ 2000 3300
NoConn ~ 2000 3400
NoConn ~ 2000 3600
NoConn ~ 2000 3700
NoConn ~ 2000 4100
NoConn ~ 2000 4000
NoConn ~ 2000 3900
NoConn ~ 5450 3000
NoConn ~ 5450 2900
NoConn ~ 5450 2800
NoConn ~ 5450 2700
NoConn ~ 5450 2600
NoConn ~ 5450 2500
Wire Wire Line
	2000 4200 1600 4200
Wire Wire Line
	2000 4300 1600 4300
Text Label 1750 4200 0    60   ~ 0
TX
Text Label 1750 4300 0    60   ~ 0
RX
$Comp
L CONN_01X04 P3
U 1 1 58951663
P 4950 1050
F 0 "P3" H 4950 1300 50  0000 C CNN
F 1 "ENCODER" V 5050 1050 50  0000 C CNN
F 2 "" H 4950 1050 50  0000 C CNN
F 3 "" H 4950 1050 50  0000 C CNN
	1    4950 1050
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR12
U 1 1 589516DA
P 5800 950
F 0 "#PWR12" H 5800 950 30  0001 C CNN
F 1 "GND" H 5800 880 30  0001 C CNN
F 2 "" H 5800 950 60  0000 C CNN
F 3 "" H 5800 950 60  0000 C CNN
	1    5800 950 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 950  5800 900 
Wire Wire Line
	5800 900  5150 900 
$Comp
L LM7805CT U3
U 1 1 58951982
P 3750 5450
F 0 "U3" H 3550 5650 50  0000 C CNN
F 1 "LM7805CT" H 3750 5650 50  0000 L CNN
F 2 "TO-220" H 3750 5550 50  0000 C CIN
F 3 "" H 3750 5450 50  0000 C CNN
	1    3750 5450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR16
U 1 1 58951EC3
P 3750 6100
F 0 "#PWR16" H 3750 6100 30  0001 C CNN
F 1 "GND" H 3750 6030 30  0001 C CNN
F 2 "" H 3750 6100 60  0000 C CNN
F 3 "" H 3750 6100 60  0000 C CNN
	1    3750 6100
	1    0    0    -1  
$EndComp
Text Label 1500 900  0    60   ~ 0
PWR_LINE
Text Label 2500 5400 0    60   ~ 0
PWR_LINE
$Comp
L +5VD #PWR18
U 1 1 58952900
P 4300 5350
F 0 "#PWR18" H 4300 5300 20  0001 C CNN
F 1 "+5VD" H 4300 5450 30  0000 C CNN
F 2 "" H 4300 5350 60  0000 C CNN
F 3 "" H 4300 5350 60  0000 C CNN
	1    4300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 1000 5700 1000
Wire Wire Line
	5150 1100 5700 1100
Wire Wire Line
	5150 1200 5850 1200
$Comp
L Q_NPN_BCE Q1
U 1 1 589536F7
P 7500 3000
F 0 "Q1" H 7800 3050 50  0000 R CNN
F 1 "Q_NPN_BCE" H 8100 2950 50  0000 R CNN
F 2 "" H 7700 3100 50  0000 C CNN
F 3 "" H 7500 3000 50  0000 C CNN
	1    7500 3000
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR20
U 1 1 58953896
P 7600 3300
F 0 "#PWR20" H 7600 3300 30  0001 C CNN
F 1 "GND" H 7600 3230 30  0001 C CNN
F 2 "" H 7600 3300 60  0000 C CNN
F 3 "" H 7600 3300 60  0000 C CNN
	1    7600 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3300 7600 3200
$Comp
L R R4
U 1 1 58953B71
P 7000 3000
F 0 "R4" V 7080 3000 50  0000 C CNN
F 1 "10k" V 7000 3000 50  0000 C CNN
F 2 "" V 6930 3000 50  0000 C CNN
F 3 "" H 7000 3000 50  0000 C CNN
	1    7000 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	7300 3000 7150 3000
Wire Wire Line
	6850 3000 6500 3000
$Comp
L R R5
U 1 1 58954004
P 7600 2450
F 0 "R5" V 7680 2450 50  0000 C CNN
F 1 "10k" V 7600 2450 50  0000 C CNN
F 2 "" V 7530 2450 50  0000 C CNN
F 3 "" H 7600 2450 50  0000 C CNN
	1    7600 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	7600 2600 7600 2800
$Comp
L +5V #PWR19
U 1 1 589543ED
P 7600 2200
F 0 "#PWR19" H 7600 2290 20  0001 C CNN
F 1 "+5V" H 7600 2290 30  0000 C CNN
F 2 "" H 7600 2200 60  0000 C CNN
F 3 "" H 7600 2200 60  0000 C CNN
	1    7600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2200 7600 2300
Wire Wire Line
	7600 2700 8100 2700
Connection ~ 7600 2700
Text Label 7800 2700 0    60   ~ 0
FC
Text Label 6650 3000 0    60   ~ 0
TX
$Comp
L SP3485CP U5
U 1 1 589552C3
P 7600 4550
F 0 "U5" H 7300 4900 50  0000 L CNN
F 1 "SP3485CP" H 7700 4900 50  0000 L CNN
F 2 "DIP-8" H 7600 4550 50  0000 C CIN
F 3 "" H 7600 4550 50  0000 C CNN
	1    7600 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4650 7200 4650
Wire Wire Line
	7150 4450 7150 4650
Wire Wire Line
	7150 4450 7200 4450
Wire Wire Line
	7150 4550 6900 4550
Connection ~ 7150 4550
$Comp
L R R2
U 1 1 58955DAA
P 6900 4350
F 0 "R2" V 6980 4350 50  0000 C CNN
F 1 "1k" V 6900 4350 50  0000 C CNN
F 2 "" V 6830 4350 50  0000 C CNN
F 3 "" H 6900 4350 50  0000 C CNN
	1    6900 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4350 7200 4350
$Comp
L R R3
U 1 1 589561A3
P 6900 4750
F 0 "R3" V 6980 4750 50  0000 C CNN
F 1 "1k" V 6900 4750 50  0000 C CNN
F 2 "" V 6830 4750 50  0000 C CNN
F 3 "" H 6900 4750 50  0000 C CNN
	1    6900 4750
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 4750 7200 4750
Wire Wire Line
	6750 4350 6450 4350
Wire Wire Line
	6750 4750 6450 4750
Text Label 6550 4750 0    60   ~ 0
TX
Text Label 6550 4350 0    60   ~ 0
RX
Text Label 6950 4550 0    60   ~ 0
FC
$Comp
L GND #PWR22
U 1 1 58957DF3
P 7600 5100
F 0 "#PWR22" H 7600 5100 30  0001 C CNN
F 1 "GND" H 7600 5030 30  0001 C CNN
F 2 "" H 7600 5100 60  0000 C CNN
F 3 "" H 7600 5100 60  0000 C CNN
	1    7600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 5100 7600 4950
$Comp
L +5V #PWR21
U 1 1 58958070
P 7600 3950
F 0 "#PWR21" H 7600 4040 20  0001 C CNN
F 1 "+5V" H 7600 4040 30  0000 C CNN
F 2 "" H 7600 3950 60  0000 C CNN
F 3 "" H 7600 3950 60  0000 C CNN
	1    7600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3950 7600 4150
$Comp
L C C6
U 1 1 589587C6
P 7950 3800
F 0 "C6" H 7975 3900 50  0000 L CNN
F 1 "100nF" H 7975 3700 50  0000 L CNN
F 2 "" H 7988 3650 50  0000 C CNN
F 3 "" H 7950 3800 50  0000 C CNN
	1    7950 3800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR24
U 1 1 58958B2C
P 7950 4000
F 0 "#PWR24" H 7950 4000 30  0001 C CNN
F 1 "GND" H 7950 3930 30  0001 C CNN
F 2 "" H 7950 4000 60  0000 C CNN
F 3 "" H 7950 4000 60  0000 C CNN
	1    7950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4000 7950 3950
$Comp
L +5V #PWR23
U 1 1 58958BE1
P 7950 3600
F 0 "#PWR23" H 7950 3690 20  0001 C CNN
F 1 "+5V" H 7950 3690 30  0000 C CNN
F 2 "" H 7950 3600 60  0000 C CNN
F 3 "" H 7950 3600 60  0000 C CNN
	1    7950 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3600 7950 3650
$Comp
L R R7
U 1 1 58959DFC
P 8550 3750
F 0 "R7" V 8630 3750 50  0000 C CNN
F 1 "120R" V 8550 3750 50  0000 C CNN
F 2 "" V 8480 3750 50  0000 C CNN
F 3 "" H 8550 3750 50  0000 C CNN
	1    8550 3750
	-1   0    0    1   
$EndComp
$Comp
L R R8
U 1 1 5895A408
P 8550 4250
F 0 "R8" V 8630 4250 50  0000 C CNN
F 1 "560R" V 8550 4250 50  0000 C CNN
F 2 "" V 8480 4250 50  0000 C CNN
F 3 "" H 8550 4250 50  0000 C CNN
	1    8550 4250
	-1   0    0    1   
$EndComp
$Comp
L R R6
U 1 1 5895A491
P 8550 3250
F 0 "R6" V 8630 3250 50  0000 C CNN
F 1 "560R" V 8550 3250 50  0000 C CNN
F 2 "" V 8480 3250 50  0000 C CNN
F 3 "" H 8550 3250 50  0000 C CNN
	1    8550 3250
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR26
U 1 1 5895A638
P 8550 4550
F 0 "#PWR26" H 8550 4550 30  0001 C CNN
F 1 "GND" H 8550 4480 30  0001 C CNN
F 2 "" H 8550 4550 60  0000 C CNN
F 3 "" H 8550 4550 60  0000 C CNN
	1    8550 4550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4550 8550 4400
$Comp
L +5V #PWR25
U 1 1 5895A9A9
P 8550 3000
F 0 "#PWR25" H 8550 3090 20  0001 C CNN
F 1 "+5V" H 8550 3090 30  0000 C CNN
F 2 "" H 8550 3000 60  0000 C CNN
F 3 "" H 8550 3000 60  0000 C CNN
	1    8550 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 3000 8550 3100
Wire Wire Line
	8550 3400 8550 3600
Wire Wire Line
	8550 3900 8550 4100
Wire Wire Line
	8550 3500 9000 3500
Connection ~ 8550 3500
Wire Wire Line
	8550 4000 9000 4000
Connection ~ 8550 4000
Wire Wire Line
	8000 4450 8350 4450
Wire Wire Line
	8000 4650 8350 4650
Text Label 8100 4450 0    60   ~ 0
A
Text Label 8100 4650 0    60   ~ 0
B
Text Label 8750 4000 0    60   ~ 0
B
Text Label 8750 3500 0    60   ~ 0
A
Text Label 5250 1100 0    60   ~ 0
A
Text Label 5250 1200 0    60   ~ 0
B
Text Label 5250 1000 0    60   ~ 0
VERMELHO
Text Label 5250 900  0    60   ~ 0
AZUL
Text Label 5450 1100 0    60   ~ 0
LILAS
Text Label 5450 1200 0    60   ~ 0
AMARELO
$Comp
L MAX232 U6
U 1 1 5895D0EF
P 9700 1750
F 0 "U6" H 9250 2600 50  0000 L CNN
F 1 "MAX232" H 9900 2600 50  0000 L CNN
F 2 "" H 9700 1750 50  0000 C CNN
F 3 "" H 9700 1750 50  0000 C CNN
	1    9700 1750
	1    0    0    -1  
$EndComp
$Comp
L CP C7
U 1 1 5895DA37
P 8900 1250
F 0 "C7" H 8925 1350 50  0000 L CNN
F 1 "10uF" H 8925 1150 50  0000 L CNN
F 2 "" H 8938 1100 50  0000 C CNN
F 3 "" H 8900 1250 50  0000 C CNN
	1    8900 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1450 8900 1450
Wire Wire Line
	8900 1450 8900 1400
Wire Wire Line
	9100 1050 8900 1050
Wire Wire Line
	8900 1050 8900 1100
$Comp
L CP C8
U 1 1 5895E65F
P 8900 1750
F 0 "C8" H 8925 1850 50  0000 L CNN
F 1 "10uF" H 8925 1650 50  0000 L CNN
F 2 "" H 8938 1600 50  0000 C CNN
F 3 "" H 8900 1750 50  0000 C CNN
	1    8900 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 1550 8900 1550
Wire Wire Line
	8900 1550 8900 1600
Wire Wire Line
	9100 1950 8900 1950
Wire Wire Line
	8900 1950 8900 1900
$Comp
L CP C9
U 1 1 5895E7DE
P 10700 1650
F 0 "C9" H 10725 1750 50  0000 L CNN
F 1 "10uF" H 10725 1550 50  0000 L CNN
F 2 "" H 10738 1500 50  0000 C CNN
F 3 "" H 10700 1650 50  0000 C CNN
	1    10700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1500 10700 1450
Wire Wire Line
	10700 1450 10300 1450
$Comp
L CP C10
U 1 1 5895EB75
P 10700 2150
F 0 "C10" H 10725 2250 50  0000 L CNN
F 1 "10uF" H 10725 2050 50  0000 L CNN
F 2 "" H 10738 2000 50  0000 C CNN
F 3 "" H 10700 2150 50  0000 C CNN
	1    10700 2150
	-1   0    0    1   
$EndComp
Wire Wire Line
	10700 2000 10700 1950
Wire Wire Line
	10700 1950 10300 1950
$Comp
L GND #PWR30
U 1 1 5895EE59
P 10700 2400
F 0 "#PWR30" H 10700 2400 30  0001 C CNN
F 1 "GND" H 10700 2330 30  0001 C CNN
F 2 "" H 10700 2400 60  0000 C CNN
F 3 "" H 10700 2400 60  0000 C CNN
	1    10700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 2400 10700 2300
$Comp
L GND #PWR29
U 1 1 5895F446
P 10700 1850
F 0 "#PWR29" H 10700 1850 30  0001 C CNN
F 1 "GND" H 10700 1780 30  0001 C CNN
F 2 "" H 10700 1850 60  0000 C CNN
F 3 "" H 10700 1850 60  0000 C CNN
	1    10700 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10700 1850 10700 1800
$Comp
L +5V #PWR28
U 1 1 5895FE70
P 10400 900
F 0 "#PWR28" H 10400 990 20  0001 C CNN
F 1 "+5V" H 10400 990 30  0000 C CNN
F 2 "" H 10400 900 60  0000 C CNN
F 3 "" H 10400 900 60  0000 C CNN
	1    10400 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	10400 900  10400 1050
$Comp
L C C11
U 1 1 58960B45
P 10850 1250
F 0 "C11" H 10875 1350 50  0000 L CNN
F 1 "100nF" H 10875 1150 50  0000 L CNN
F 2 "" H 10888 1100 50  0000 C CNN
F 3 "" H 10850 1250 50  0000 C CNN
	1    10850 1250
	1    0    0    -1  
$EndComp
Connection ~ 10400 1050
$Comp
L GND #PWR31
U 1 1 58960F3A
P 10850 1450
F 0 "#PWR31" H 10850 1450 30  0001 C CNN
F 1 "GND" H 10850 1380 30  0001 C CNN
F 2 "" H 10850 1450 60  0000 C CNN
F 3 "" H 10850 1450 60  0000 C CNN
	1    10850 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1450 10850 1400
Wire Wire Line
	10300 1050 10850 1050
Wire Wire Line
	10850 1050 10850 1100
$Comp
L DB9 J1
U 1 1 58962A0F
P 10650 3650
F 0 "J1" H 10650 4200 50  0000 C CNN
F 1 "DB9" H 10650 3100 50  0000 C CNN
F 2 "" H 10650 3650 50  0000 C CNN
F 3 "" H 10650 3650 50  0000 C CNN
	1    10650 3650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR27
U 1 1 58962C3D
P 10000 3400
F 0 "#PWR27" H 10000 3400 30  0001 C CNN
F 1 "GND" H 10000 3330 30  0001 C CNN
F 2 "" H 10000 3400 60  0000 C CNN
F 3 "" H 10000 3400 60  0000 C CNN
	1    10000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10000 3400 10000 3250
Wire Wire Line
	10000 3250 10200 3250
Wire Wire Line
	10200 3850 9800 3850
NoConn ~ 10200 3350
NoConn ~ 10200 3450
NoConn ~ 10200 3550
NoConn ~ 10200 3650
NoConn ~ 10200 3750
NoConn ~ 10200 3950
NoConn ~ 10200 4050
Text Label 9900 3850 0    60   ~ 0
PC_RX
$Comp
L R R9
U 1 1 58963C26
P 8800 2250
F 0 "R9" V 8880 2250 50  0000 C CNN
F 1 "1k" V 8800 2250 50  0000 C CNN
F 2 "" V 8730 2250 50  0000 C CNN
F 3 "" H 8800 2250 50  0000 C CNN
	1    8800 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	8650 2250 8250 2250
Text Label 8350 2250 0    60   ~ 0
PGC
Wire Wire Line
	10400 2250 10400 2600
Wire Wire Line
	10400 2600 10850 2600
Text Label 10500 2600 0    60   ~ 0
PC_RX
Wire Wire Line
	9100 2250 8950 2250
Wire Wire Line
	10400 2250 10300 2250
$Comp
L D_Small D?
U 1 1 58969D74
P 3100 5400
F 0 "D?" H 3050 5480 50  0000 L CNN
F 1 "1n4007" H 2950 5320 50  0000 L CNN
F 2 "" V 3100 5400 50  0000 C CNN
F 3 "" V 3100 5400 50  0000 C CNN
	1    3100 5400
	-1   0    0    1   
$EndComp
$Comp
L D_Small D?
U 1 1 5896A29D
P 3750 5900
F 0 "D?" H 3700 5980 50  0000 L CNN
F 1 "1n4007" H 3600 5820 50  0000 L CNN
F 2 "" V 3750 5900 50  0000 C CNN
F 3 "" V 3750 5900 50  0000 C CNN
	1    3750 5900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 6100 3750 6000
Wire Wire Line
	3750 5800 3750 5700
Wire Wire Line
	3200 5400 3350 5400
Wire Wire Line
	3000 5400 2450 5400
Wire Wire Line
	4300 5350 4300 5400
Wire Wire Line
	4300 5400 4150 5400
$Comp
L LM7805CT U?
U 1 1 5896C536
P 3750 6450
F 0 "U?" H 3550 6650 50  0000 C CNN
F 1 "LM7805CT" H 3750 6650 50  0000 L CNN
F 2 "TO-220" H 3750 6550 50  0000 C CIN
F 3 "" H 3750 6450 50  0000 C CNN
	1    3750 6450
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR?
U 1 1 5896C53C
P 3750 7100
F 0 "#PWR?" H 3750 7100 30  0001 C CNN
F 1 "GND" H 3750 7030 30  0001 C CNN
F 2 "" H 3750 7100 60  0000 C CNN
F 3 "" H 3750 7100 60  0000 C CNN
	1    3750 7100
	1    0    0    -1  
$EndComp
Text Label 2500 6400 0    60   ~ 0
PWR_LINE
$Comp
L +5VD #PWR?
U 1 1 5896C543
P 4300 6350
F 0 "#PWR?" H 4300 6300 20  0001 C CNN
F 1 "+5VD" H 4300 6450 30  0000 C CNN
F 2 "" H 4300 6350 60  0000 C CNN
F 3 "" H 4300 6350 60  0000 C CNN
	1    4300 6350
	1    0    0    -1  
$EndComp
$Comp
L D_Small D?
U 1 1 5896C549
P 3100 6400
F 0 "D?" H 3050 6480 50  0000 L CNN
F 1 "1n4007" H 2950 6320 50  0000 L CNN
F 2 "" V 3100 6400 50  0000 C CNN
F 3 "" V 3100 6400 50  0000 C CNN
	1    3100 6400
	-1   0    0    1   
$EndComp
$Comp
L D_Small D?
U 1 1 5896C54F
P 3750 6900
F 0 "D?" H 3700 6980 50  0000 L CNN
F 1 "1n4007" H 3600 6820 50  0000 L CNN
F 2 "" V 3750 6900 50  0000 C CNN
F 3 "" V 3750 6900 50  0000 C CNN
	1    3750 6900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3750 7100 3750 7000
Wire Wire Line
	3750 6800 3750 6700
Wire Wire Line
	3200 6400 3350 6400
Wire Wire Line
	3000 6400 2450 6400
Wire Wire Line
	4300 6350 4300 6400
Wire Wire Line
	4300 6400 4150 6400
Wire Wire Line
	2000 3800 1600 3800
Text Label 1750 3800 0    60   ~ 0
EN
$Comp
L RELAY_9001 RLY?
U 1 1 58950710
P 6000 5800
F 0 "RLY?" H 6000 6000 60  0000 C CNN
F 1 "RELAY_9001" H 6000 5600 60  0000 C CNN
F 2 "" H 6000 5750 60  0000 C CNN
F 3 "" H 6000 5750 60  0000 C CNN
	1    6000 5800
	0    1    1    0   
$EndComp
$Comp
L +5V #PWR?
U 1 1 58951181
P 6100 5500
F 0 "#PWR?" H 6100 5590 20  0001 C CNN
F 1 "+5V" H 6100 5590 30  0000 C CNN
F 2 "" H 6100 5500 60  0000 C CNN
F 3 "" H 6100 5500 60  0000 C CNN
	1    6100 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6100 5500 6100 5600
Wire Wire Line
	6100 6000 6100 6100
Wire Wire Line
	6100 6100 6650 6100
Text Label 6350 6100 0    60   ~ 0
EN
$Comp
L +5VD #PWR?
U 1 1 58957D00
P 5900 5500
F 0 "#PWR?" H 5900 5450 20  0001 C CNN
F 1 "+5VD" H 5900 5600 30  0000 C CNN
F 2 "" H 5900 5500 60  0000 C CNN
F 3 "" H 5900 5500 60  0000 C CNN
	1    5900 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 5500 5900 5600
Wire Wire Line
	5900 6000 5900 6100
Wire Wire Line
	5900 6100 5300 6100
Text Label 5400 6100 0    60   ~ 0
VERMELHO
$EndSCHEMATC
;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"lab1.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; config word(s)
;--------------------------------------------------------
	__config 0x3ff7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_TRISIO
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_s
	global	_delay
	global	_rotl
	global	_next
	global	_rand

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_lab1_0	udata
r0x1019	res	1
r0x1018	res	1
r0x1011	res	1
r0x1010	res	1
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1002	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100E	res	1
r0x100F	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

IDD_lab1_0	idata
_s
	db	0x00	; 0
	db	0xa3	; 163

;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_lab1	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _rand
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _rand
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;   _delay
;3 compiler assigned registers:
;   r0x1018
;   STK00
;   r0x1019
;; Starting pCode block
S_lab1__main	code
_main:
; 2 exit points
;	.line	18; "lab1.c"	TRISIO = 0b00100000; //Poner todos los pines como salidas
	MOVLW	0x20
	BANKSEL	_TRISIO
	MOVWF	_TRISIO
;	.line	19; "lab1.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
_00116_DS_:
;	.line	28; "lab1.c"	if (GP5) {
	BANKSEL	_GPIObits
	BTFSS	_GPIObits,5
	GOTO	_00113_DS_
;	.line	30; "lab1.c"	random_num = rand();
	PAGESEL	_rand
	CALL	_rand
	PAGESEL	$
	MOVWF	r0x1018
	MOVF	STK00,W
	MOVWF	r0x1019
;;unsigned compare: left < lit(0x1=1), size=2
;	.line	32; "lab1.c"	switch (random_num)
	MOVLW	0x00
	SUBWF	r0x1018,W
	BTFSS	STATUS,2
	GOTO	_00136_DS_
	MOVLW	0x01
	SUBWF	r0x1019,W
_00136_DS_:
	BTFSS	STATUS,0
	GOTO	_00116_DS_
;;genSkipc:3307: created from rifx:0x7ffcd434e220
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit(0x7=7), size=2
	MOVLW	0x00
	SUBWF	r0x1018,W
	BTFSS	STATUS,2
	GOTO	_00137_DS_
	MOVLW	0x07
	SUBWF	r0x1019,W
_00137_DS_:
	BTFSC	STATUS,0
	GOTO	_00116_DS_
;;genSkipc:3307: created from rifx:0x7ffcd434e220
	DECF	r0x1019,F
	MOVLW	HIGH(_00138_DS_)
	MOVWF	PCLATH
	MOVLW	_00138_DS_
	ADDWF	r0x1019,W
	BTFSC	STATUS,0
	INCF	PCLATH,F
	MOVWF	PCL
_00138_DS_:
	GOTO	_00105_DS_
	GOTO	_00106_DS_
	GOTO	_00107_DS_
	GOTO	_00108_DS_
	GOTO	_00109_DS_
	GOTO	_00110_DS_
_00105_DS_:
;	.line	36; "lab1.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	37; "lab1.c"	delay(time);
	MOVLW	0xc8
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	38; "lab1.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	39; "lab1.c"	break;
	GOTO	_00116_DS_
_00106_DS_:
;	.line	44; "lab1.c"	GP4 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,4
;	.line	45; "lab1.c"	delay(time);
	MOVLW	0xc8
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	46; "lab1.c"	GP4 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,4
;	.line	47; "lab1.c"	break;
	GOTO	_00116_DS_
_00107_DS_:
;	.line	52; "lab1.c"	GPIO = 0b00010001;
	MOVLW	0x11
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	53; "lab1.c"	delay(time);
	MOVLW	0xc8
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	54; "lab1.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	55; "lab1.c"	break;
	GOTO	_00116_DS_
_00108_DS_:
;	.line	60; "lab1.c"	GPIO = 0b00010010;
	MOVLW	0x12
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	61; "lab1.c"	delay(time);
	MOVLW	0xc8
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	62; "lab1.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	63; "lab1.c"	break;
	GOTO	_00116_DS_
_00109_DS_:
;	.line	68; "lab1.c"	GPIO = 0b00010011;
	MOVLW	0x13
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	69; "lab1.c"	delay(time);
	MOVLW	0xc8
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	70; "lab1.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	71; "lab1.c"	break;
	GOTO	_00116_DS_
_00110_DS_:
;	.line	76; "lab1.c"	GPIO = 0b00010110;
	MOVLW	0x16
	BANKSEL	_GPIO
	MOVWF	_GPIO
;	.line	77; "lab1.c"	delay(time);
	MOVLW	0xc8
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	78; "lab1.c"	GPIO = 0b00000000;
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	82; "lab1.c"	}
	GOTO	_00116_DS_
_00113_DS_:
;	.line	85; "lab1.c"	GPIO = 0x00; 
	BANKSEL	_GPIO
	CLRF	_GPIO
	GOTO	_00116_DS_
;	.line	89; "lab1.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _next
;   _next
;4 compiler assigned registers:
;   r0x100D
;   r0x100E
;   r0x100F
;   STK00
;; Starting pCode block
S_lab1__rand	code
_rand:
; 2 exit points
_00195_DS_:
;	.line	123; "lab1.c"	randi = next();
	PAGESEL	_next
	CALL	_next
	PAGESEL	$
;;1	MOVWF	r0x100D
	MOVWF	r0x100E
	CLRF	r0x100F
;;signed compare: left < lit(0x7=7), size=2, mask=ffff
	MOVLW	0x00
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00211_DS_
	MOVLW	0x07
	SUBWF	r0x100E,W
_00211_DS_:
	BTFSC	STATUS,0
	GOTO	_00195_DS_
;;genSkipc:3307: created from rifx:0x7ffcd434e220
;;swapping arguments (AOP_TYPEs 1/2)
;;signed compare: left >= lit(0x1=1), size=2, mask=ffff
	MOVF	r0x100F,W
	ADDLW	0x80
	ADDLW	0x80
	BTFSS	STATUS,2
	GOTO	_00212_DS_
	MOVLW	0x01
	SUBWF	r0x100E,W
_00212_DS_:
	BTFSS	STATUS,0
	GOTO	_00195_DS_
;;genSkipc:3307: created from rifx:0x7ffcd434e220
;	.line	125; "lab1.c"	return randi;
	MOVF	r0x100E,W
	MOVWF	STK00
	MOVF	r0x100F,W
;	.line	129; "lab1.c"	}
	RETURN	
; exit point of _rand

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _rotl
;   _rotl
;   _rotl
;   _rotl
;7 compiler assigned registers:
;   r0x1008
;   r0x1009
;   r0x100A
;   STK01
;   STK00
;   r0x100B
;   r0x100C
;; Starting pCode block
S_lab1__next	code
_next:
; 2 exit points
;	.line	109; "lab1.c"	uint8_t s0 = s[0];
	MOVF	(_s + 0),W
	MOVWF	r0x1008
;	.line	110; "lab1.c"	uint8_t s1 = s[1];
	MOVF	(_s + 1),W
;	.line	111; "lab1.c"	uint8_t result = s0 + s1;
	MOVWF	r0x1009
	ADDWF	r0x1008,W
	MOVWF	r0x100A
;	.line	113; "lab1.c"	s1 ^= s0;
	MOVF	r0x1008,W
	XORWF	r0x1009,F
;	.line	114; "lab1.c"	s[0] = rotl(s0, 6) ^ s1 ^ (s1 << 1);
	MOVLW	0x06
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVF	r0x1008,W
	PAGESEL	_rotl
	CALL	_rotl
	PAGESEL	$
	MOVWF	r0x1008
	MOVF	r0x1009,W
	XORWF	r0x1008,F
	MOVF	r0x1009,W
	MOVWF	r0x100B
	BCF	STATUS,0
	RLF	r0x100B,W
;;1	MOVWF	r0x100C
	MOVWF	r0x100B
	XORWF	r0x1008,F
;;/home/sdcc-builder/build/sdcc-build/orig/sdcc/src/pic14/gen.c:6828: size=0, offset=0, AOP_TYPE(res)=8
	MOVF	r0x1008,W
	MOVWF	(_s + 0)
;	.line	115; "lab1.c"	s[1] = rotl(s1, 3);
	MOVLW	0x03
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVF	r0x1009,W
	PAGESEL	_rotl
	CALL	_rotl
	PAGESEL	$
	MOVWF	r0x1008
	MOVWF	(_s + 1)
;	.line	117; "lab1.c"	return result;
	MOVF	r0x100A,W
;	.line	118; "lab1.c"	}
	RETURN	
; exit point of _next

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;8 compiler assigned registers:
;   r0x1002
;   STK00
;   r0x1003
;   STK01
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_lab1__rotl	code
_rotl:
; 2 exit points
	MOVWF	r0x1007
	MOVWF	r0x1005
;	.line	102; "lab1.c"	uint8_t rotl(const uint8_t x, int k) {
	MOVWF	r0x1002
	MOVF	STK00,W
;;1	MOVWF	r0x1003
	MOVF	STK01,W
	MOVWF	r0x1006
	MOVWF	r0x1004
;;99	MOVF	r0x1002,W
;;100	MOVF	r0x1004,W
;;101	MOVF	r0x1005,W
;	.line	103; "lab1.c"	return (x << k) | (x >> (8 - k));
	MOVF	r0x1006,W
	BTFSC	r0x1006,7
	GOTO	_00180_DS_
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00178_DS_
_00177_DS_:
	RLF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00177_DS_
	GOTO	_00178_DS_
_00180_DS_:
	BCF	STATUS,0
	BTFSC	r0x1007,7
	BSF	STATUS,0
	RRF	r0x1007,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00180_DS_
_00178_DS_:
	MOVF	r0x1004,W
	MOVWF	r0x1005
	SUBLW	0x08
	MOVWF	r0x1004
	MOVF	r0x1002,W
	MOVWF	r0x1005
	MOVF	r0x1004,W
	SUBLW	0x00
	BTFSC	STATUS,2
	GOTO	_00182_DS_
_00181_DS_:
	RRF	r0x1005,F
	ADDLW	0x01
	BTFSS	STATUS,0
	GOTO	_00181_DS_
_00182_DS_:
	MOVF	r0x1007,W
	MOVWF	r0x1002
	IORWF	r0x1005,W
	MOVWF	r0x1007
;	.line	104; "lab1.c"	}
	RETURN	
; exit point of _rotl

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1010
;   STK00
;   r0x1011
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;; Starting pCode block
S_lab1__delay	code
_delay:
; 2 exit points
;	.line	92; "lab1.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1010
	MOVF	STK00,W
	MOVWF	r0x1011
;	.line	97; "lab1.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1012
	CLRF	r0x1013
_00149_DS_:
	MOVF	r0x1010,W
	SUBWF	r0x1013,W
	BTFSS	STATUS,2
	GOTO	_00170_DS_
	MOVF	r0x1011,W
	SUBWF	r0x1012,W
_00170_DS_:
	BTFSC	STATUS,0
	GOTO	_00151_DS_
;;genSkipc:3307: created from rifx:0x7ffcd434e220
;	.line	98; "lab1.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1014
	MOVLW	0x04
	MOVWF	r0x1015
_00147_DS_:
	MOVLW	0xff
	ADDWF	r0x1014,W
	MOVWF	r0x1016
	MOVLW	0xff
	MOVWF	r0x1017
	MOVF	r0x1015,W
	BTFSC	STATUS,0
	INCFSZ	r0x1015,W
	ADDWF	r0x1017,F
	MOVF	r0x1016,W
	MOVWF	r0x1014
	MOVF	r0x1017,W
	MOVWF	r0x1015
	MOVF	r0x1017,W
	IORWF	r0x1016,W
	BTFSS	STATUS,2
	GOTO	_00147_DS_
;	.line	97; "lab1.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1012,F
	BTFSC	STATUS,2
	INCF	r0x1013,F
	GOTO	_00149_DS_
_00151_DS_:
;	.line	99; "lab1.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  231+   36 =   267 instructions (  606 byte)

	end

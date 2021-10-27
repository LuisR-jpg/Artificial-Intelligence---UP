RETARDO50m:						//50,000 ciclos: 50ms 1MHz
	; ============================= 
	;    delay loop generator 
	;     50000 cycles:
	; ----------------------------- 
	; delaying 49995 cycles:
			  ldi  R29, $65
	WGLOOP0:  ldi  R30, $A4
	WGLOOP1:  dec  R30
			  brne WGLOOP1
			  dec  R29
			  brne WGLOOP0
	; ----------------------------- 
	; delaying 3 cycles:
			  ldi  R29, $01
	WGLOOP2:  dec  R29
			  brne WGLOOP2
	; ----------------------------- 
	; delaying 2 cycles:
			  nop
			  nop
	; ============================= 


/*
RETARDO50m:						//100,000 ciclos: 50ms 2MHz
	; ============================= 
	;    delay loop generator 
	;     100000 cycles:
	; ----------------------------- 
	; delaying 99990 cycles:
			  ldi  R31, $A5
	WGLOOP0:  ldi  R30, $C9
	WGLOOP1:  dec  R30
			  brne WGLOOP1
			  dec  R31
			  brne WGLOOP0
	; ----------------------------- 
	; delaying 9 cycles:
			  ldi  R31, $03
	WGLOOP2:  dec  R31
			  brne WGLOOP2
	; ----------------------------- 
	; delaying 1 cycle:
			  nop
	; ============================= 
*/

/*	
RETARDO50m:						//200,000 ciclos: 50ms 4MHz
	; ============================= 
	;    delay loop generator 
	;     200000 cycles:
	; ----------------------------- 
	; delaying 199998 cycles:
			  ldi  R31, $06
	WGLOOP0:  ldi  R30, $37
	WGLOOP1:  ldi  R29, $C9
	WGLOOP2:  dec  R29
			  brne WGLOOP2
			  dec  R30
			  brne WGLOOP1
			  dec  R31
			  brne WGLOOP0
	; ----------------------------- 
	; delaying 2 cycles:
			  nop
			  nop
	; ============================= 
*/

/*
retardo50m:						//400,000 ciclos: 50 ms 8mhz
	; ============================= 
	;    delay loop generator 
	;     400000 cycles:
	; ----------------------------- 
	; delaying 399999 cycles:
			  ldi  r31, $97
	wgloop0:  ldi  r30, $06
	wgloop1:  ldi  r29, $92
	wgloop2:  dec  r29
			  brne wgloop2
			  dec  r30
			  brne wgloop1
			  dec  r31
			  brne wgloop0
	; ----------------------------- 
	; delaying 1 cycle:
			  nop
	; ============================= 
*/

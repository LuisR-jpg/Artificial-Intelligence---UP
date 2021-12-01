;
; ServoKeyboard.asm
;
; Created: 30/11/2021 11:31:43 a. m.
; Author : lalor
;

/*

OCR0			Tiempo			Ángulo			Rango 
30 para 0°		0.000992		0°				0-9
31 para 20°		0.001024		20°				10 – 29
32 para 40°		0.001056		40°				30 – 49
33 para 60°		0.001088		60°				50 – 69
34 para 80°		0.00112			80°				70 – 89
35 para 100°	0.001152		100°			90 - 99

*/



.include "m16adef.inc"     
   
;*******************
;Registros (aqui pueden definirse)
;.def temporal=r19

;Palabras claves (aqui pueden definirse)
;.equ LCD_DAT=DDRC
.EQU DDRK = DDRA
.EQU PORTK = PORTA	;PARA PODER CAMBIAR CONEXIONES
.EQU PINK = PINA 
;********************

.org 0x0000
;Comienza el vector de interrupciones...
jmp RESET ; Reset Handler
jmp EXT_INT0 ; IRQ0 Handler
jmp EXT_INT1 ; IRQ1 Handler
jmp TIM2_COMP ; Timer2 Compare Handler
jmp TIM2_OVF ; Timer2 Overflow Handler
jmp TIM1_CAPT ; Timer1 Capture Handler
jmp TIM1_COMPA ; Timer1 CompareA Handler
jmp TIM1_COMPB ; Timer1 CompareB Handler
jmp TIM1_OVF ; Timer1 Overflow Handler
jmp TIM0_OVF ; Timer0 Overflow Handler
jmp SPI_STC ; SPI Transfer Complete Handler
jmp USART_RXC ; USART RX Complete Handler
jmp USART_UDRE ; UDR Empty Handler
jmp USART_TXC ; USART TX Complete Handler
jmp ADC_COMP ; ADC Conversion Complete Handler
jmp EE_RDY ; EEPROM Ready Handler
jmp ANA_COMP ; Analog Comparator Handler
jmp TWSI ; Two-wire Serial Interface Handler
jmp EXT_INT2 ; IRQ2 Handler
jmp TIM0_COMP ; Timer0 Compare Handler
jmp SPM_RDY ; Store Program Memory Ready Handler

;**************
;Inicializar el Stack Pointer
;**************
Reset:
ldi r16, high(RAMEND)
out SPH, r16
ldi r16, low(RAMEND)
out SPL, r16 


;*********************************
;Aqu? comienza el programa...
;No olvides configurar al inicio todo lo que utilizar?s
;*********************************
LDI R16, 0b1111_1000
OUT DDRK, R16
SER R16
OUT DDRC, R16
OUT DDRD, R16
OUT DDRB, R16
CLR R16
OUT PORTC, R16
OUT PORTD, R16
OUT PORTB, R16
LDI R16, 0b0110_1100
OUT TCCR0, R16

START:
	CLR R16
	OUT TCNT0, R16
	LDI R16, 30
	OUT OCR0, R16
	CLR R20
	LDI R21, 1
	CLR R22
	RCALL PRINT


;...

TECLADO: 
	LDI R16, 0b0111_0111 ;PULL-UPS ENTRADAS, MANDO PRIMER TIERRA A PIN 3
	OUT PORTK, R16
	NOP ;PIERDE CICLO DE RELOJ
	NOP
	SBIS PINK, 0
	RJMP TRES
	SBIS PINK, 1
	RJMP DOS
	SBIS PINK, 2
	RJMP UNO
	SBI PORTK, 3 ;REGRESA 5v
	CBI PORTK, 4 ;CAMBIA GND
	NOP
	NOP
	SBIS PINK, 0
	RJMP SEIS
	SBIS PINK, 1
	RJMP CINCO
	SBIS PINK, 2
	RJMP CUATRO
	SBI PORTK, 4 
	CBI PORTK, 5 
	NOP
	NOP
	SBIS PINK, 0
	RJMP NUEVE
	SBIS PINK, 1
	RJMP OCHO
	SBIS PINK, 2
	RJMP SIETE
	SBI PORTK, 5 
	CBI PORTK, 6 
	NOP
	NOP
	SBIS PINK, 0
	RJMP GATITO
	SBIS PINK, 1
	RJMP CERO
	SBIS PINK, 2
	RJMP ASTERISCO
RJMP TECLADO

REGRESA: 
	LSL R21
RJMP TECLADO

UNO:
	;CODIGO AL PRESIONAR
	RCALL DELAY
	TRABA_UNO:
		SBIS PINK, 2
	RJMP TRABA_UNO
	RCALL DELAY
	;CODIGO AL SOLTAR
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B1000_0000
	SWAP R22
	ORI R22, 1
	RCALL PRINT
RJMP REGRESA
DOS:
	RCALL DELAY
	TRABA_DOS:
		SBIS PINK, 1
	RJMP TRABA_DOS
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B0100_0000
	SWAP R22
	ORI R22, 2
	RCALL PRINT
RJMP REGRESA
TRES:
	RCALL DELAY
	TRABA_TRES:
		SBIS PINK, 0
	RJMP TRABA_TRES
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B1100_0000
	SWAP R22
	ORI R22, 3
	RCALL PRINT
RJMP REGRESA
CUATRO:
	RCALL DELAY
	TRABA_CUATRO:
		SBIS PINK, 2
	RJMP TRABA_CUATRO
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B0010_0000
	SWAP R22
	ORI R22, 4
	RCALL PRINT
RJMP REGRESA
CINCO:
	RCALL DELAY
	TRABA_CINCO:
		SBIS PINK, 1
	RJMP TRABA_CINCO
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B1010_0000
	SWAP R22
	ORI R22, 5
	RCALL PRINT
RJMP REGRESA
SEIS:
	RCALL DELAY
	TRABA_SEIS:
		SBIS PINK, 0
	RJMP TRABA_SEIS
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B0110_0000
	SWAP R22
	ORI R22, 6
	RCALL PRINT
RJMP REGRESA
SIETE:
	RCALL DELAY
	TRABA_SIETE:
		SBIS PINK, 2
	RJMP TRABA_SIETE
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B1110_0000
	SWAP R22
	ORI R22, 7
	RCALL PRINT
RJMP REGRESA
OCHO:
	RCALL DELAY
	TRABA_OCHO:
		SBIS PINK, 1
	RJMP TRABA_OCHO
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B0001_0000
	SWAP R22
	ORI R22, 8
	RCALL PRINT
RJMP REGRESA
NUEVE:
	RCALL DELAY
	TRABA_NUEVE:
		SBIS PINK, 0
	RJMP TRABA_NUEVE
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	ORI R20, 0B1001_0000
	SWAP R22
	ORI R22, 9
	RCALL PRINT
RJMP REGRESA
ASTERISCO:
	RCALL DELAY
	TRABA_ASTERISCO:
		SBIS PINK, 2
	RJMP TRABA_ASTERISCO
	RCALL DELAY
	SBRS R21, 2
	RJMP TECLADO
	
	MOV R16, R22
	MOV R17, R22
	SWAP R16
	ANDI R16, $0F
	ANDI R17, $0F
	LDI R18, 10
	MUL R16, R18
	ADD R17, R0
	LDI R16, 30
	CPI R17, 90
	BRSH CIENG
	CPI R17, 70
	BRSH OCHENTAG
	CPI R17, 50
	BRSH SESENTAG
	CPI R17, 30
	BRSH CUARENTAG
	CPI R17, 10
	BRSH VEINTEG

	SERVO: 
		OUT OCR0, R16
RJMP TECLADO
CERO:
	RCALL DELAY
	TRABA_CERO:
		SBIS PINK, 1
	RJMP TRABA_CERO
	RCALL DELAY
	SBRC R21, 2
	RJMP TECLADO
	SWAP R20
	SWAP R22
	RCALL PRINT
RJMP REGRESA
GATITO:
	RCALL DELAY
	TRABA_GATITO:
		SBIS PINK, 0
	RJMP TRABA_GATITO
	RCALL DELAY

	/* RESETEA SERVO */
	RCALL START
RJMP TECLADO

CIENG: INC R16
OCHENTAG: INC R16
SESENTAG: INC R16
CUARENTAG: INC R16
VEINTEG: INC R16
RJMP SERVO


PRINT: 
	MOV R16, R20
	MOV R17, R20
	SWAP R17
	ANDI R16, $0F
	ANDI R17, $0F
	OUT PORTD, R16
	OUT PORTC, R17
RET

DELAY:						//400,000 ciclos: 50 ms 8mhz
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
RET



;*********************************
;Aqu? est? el manejo de las interrupciones concretas
;*********************************
EXT_INT0: ; IRQ0 Handler
reti
EXT_INT1: 
reti ; IRQ1 Handler
TIM2_COMP: 
reti ; Timer2 Compare Handler
TIM2_OVF: 
reti ; Timer2 Overflow Handler
TIM1_CAPT: 
reti ; Timer1 Capture Handler
TIM1_COMPA: 
reti ; Timer1 CompareA Handler
TIM1_COMPB: 
reti ; Timer1 CompareB Handler
TIM1_OVF: 
reti ; Timer1 Overflow Handler
TIM0_OVF: 
reti ; Timer0 Overflow Handler
SPI_STC: 
reti ; SPI Transfer Complete Handler
USART_RXC: 
reti ; USART RX Complete Handler
USART_UDRE: 
reti ; UDR Empty Handler
USART_TXC: 
reti ; USART TX Complete Handler
ADC_COMP: 
reti ; ADC Conversion Complete Handler
EE_RDY: 
reti ; EEPROM Ready Handler
ANA_COMP: 
reti ; Analog Comparator Handler
TWSI: 
reti ; Two-wire Serial Interface Handler
EXT_INT2: 
reti ; IRQ2 Handler
TIM0_COMP: 
reti
SPM_RDY: 
reti ; Store Program Memory Ready Handler



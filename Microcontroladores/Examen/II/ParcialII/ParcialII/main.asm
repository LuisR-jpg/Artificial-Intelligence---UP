;
; ParcialII.asm
;
; Created: 19/10/2021 12:24:06 p. m.
; Author : lalor
;

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


LDI R16, $0E
OUT DDRK, R16
LDI R16, $FF
OUT DDRB, R16
OUT DDRC, R16
OUT DDRD, R16
RCALL RST
;...

TECLADO:
	OUT PORTB, R17
	OUT PORTC, R18
	OUT PORTD, R19
 
	LDI R16, $FD ;PULL-UPS ENTRADAS, MANDO PRIMER TIERRA A PIN 1
	OUT PORTK, R16
	NOP ;PIERDE CICLO DE RELOJ
	NOP
	SBIS PINK, 4
	RJMP UNO
	SBIS PINK, 5
	RJMP CUATRO
	SBIS PINK, 6
	RJMP SIETE
	SBIS PINK, 7
	RJMP ASTERISCO
	SBI PORTK, 1 ;REGRESA 5v
	CBI PORTK, 2 ;CAMBIA GND
	NOP
	NOP
	SBIS PINK, 4
	RJMP DOS
	SBIS PINK, 5
	RJMP CINCO
	SBIS PINK, 6
	RJMP OCHO
	SBIS PINK, 7
	RJMP CERO
	SBI PORTK, 2 
	CBI PORTK, 3 
	NOP
	NOP
	SBIS PINK, 4
	RJMP TRES
	SBIS PINK, 5
	RJMP SEIS
	SBIS PINK, 6
	RJMP NUEVE
	SBIS PINK, 7
	RJMP GATITO

	SBIS PINA, 0
	RCALL RST
RJMP TECLADO

UNO:
	;CODIGO AL PRESIONAR
	LDI R21, 1
	RCALL DELAY
	TRABA_UNO:
		SBIS PINK, 4
	RJMP TRABA_UNO
	RCALL DELAY
	;CODIGO AL SOLTAR
RJMP PROCESAN
DOS:
	LDI R21, 2

	RCALL DELAY
	TRABA_DOS:
		SBIS PINK, 4
	RJMP TRABA_DOS
	RCALL DELAY
RJMP PROCESAN
TRES:
	LDI R21, 3

	RCALL DELAY
	TRABA_TRES:
		SBIS PINK, 4
	RJMP TRABA_TRES
	RCALL DELAY
RJMP PROCESAN
CUATRO:
	LDI R21, 4
	RCALL DELAY
	TRABA_CUATRO:
		SBIS PINK, 5
	RJMP TRABA_CUATRO
	RCALL DELAY
RJMP PROCESAN
CINCO:
	LDI R21, 5

	RCALL DELAY
	TRABA_CINCO:
		SBIS PINK, 5
	RJMP TRABA_CINCO
	RCALL DELAY
RJMP PROCESAN
SEIS:
	LDI R21, 6

	RCALL DELAY
	TRABA_SEIS:
		SBIS PINK, 5
	RJMP TRABA_SEIS
	RCALL DELAY
RJMP PROCESAN

SIETE:
	LDI R21, 7

	RCALL DELAY
	TRABA_SIETE:
		SBIS PINK, 6
	RJMP TRABA_SIETE
	RCALL DELAY
RJMP PROCESAN
OCHO:
	LDI R21, 8

	RCALL DELAY
	TRABA_OCHO:
		SBIS PINK, 6
	RJMP TRABA_OCHO
	RCALL DELAY
RJMP PROCESAN
NUEVE:
	LDI R21, 9

	RCALL DELAY
	TRABA_NUEVE:
		SBIS PINK, 6
	RJMP TRABA_NUEVE
	RCALL DELAY
RJMP PROCESAN
ASTERISCO: ; + 
	LDI R21, 0
	
	RCALL DELAY
	TRABA_ASTERISCO:
		SBIS PINK, 7
	RJMP TRABA_ASTERISCO
	RCALL DELAY
RJMP PROCESAOP
CERO:
	CLR R21

	RCALL DELAY
	TRABA_CERO:
		SBIS PINK, 7
	RJMP TRABA_CERO
	RCALL DELAY
RJMP PROCESAN
GATITO: ; -
	LDI R21, 1

	RCALL DELAY
	TRABA_GATITO:
		SBIS PINK, 7
	RJMP TRABA_GATITO
	RCALL DELAY
RJMP PROCESAOP

PROCESAN:
	SBRC R20, 0
	OR R18, R21
	SBRC R20, 3
	OR R19, R21
	SWAP R21
	SBRC R20, 1
	OR R18, R21
	SBRC R20, 4
	OR R19, R21
	SBRC R20, 4 ; HORA DE CALCULAR
	RCALL CALCULATE
	SBRC R20, 2
	LSR R20
	SBRS R20, 5
	LSL R20
RJMP TECLADO

PROCESAOP:
	SBRS R20, 2
	RJMP TECLADO
	MOV R22, R21
	LSL R20
RJMP TECLADO

CALCULATE:
	MOV R23, R18
	SWAP R23
	ANDI R23, $0F
	MOV R24, R19
	SWAP R24
	ANDI R24, $0F
	
	MOV R25, R18
	ANDI R25, $0F
	MOV R26, R19
	ANDI R26, $0F

	SBRS R22, 0
	RCALL CALCULATEADD
	SBRC R22, 0
	RCALL CALCULATESUB
	
	SWAP R25
	ANDI R25, $F0
	CLR R17
	OR R17, R23
	OR R17, R25
	SWAP R17
RET

CALCULATEADD:
	ADD R23, R24
	CPI R23, 10
	BRGE SUMUNI
CONTINUESUM:
	ADD R25, R26

RET
SUMUNI:
	INC R25
	SUBI R23, 10
RJMP CONTINUESUM

CALCULATESUB:
	SUB R23, R24
	BRMI SUBUNI
CONTINUESUB:
	SUB R25, R26
RET

SUBUNI:
	DEC R25
	LDI R16, 10
	ADD R23, R16
RJMP CONTINUESUB

RST:
	CLR R17
	CLR R18
	CLR R19
	LDI R20, 1 //Waits for first number
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



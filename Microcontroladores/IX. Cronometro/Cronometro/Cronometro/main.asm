;
; Cronometro.asm
;
; Created: 09/11/2021 03:52:39 p. m.
; Author : lalor
;

.include "m16adef.inc"     
   
;*******************
;Registros (aqu? pueden definirse)
;.def temporal=r19

;Palabras claves (aqu? pueden definirse)
;.equ LCD_DAT=DDRC
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

LDI R16, $FF
OUT DDRC, R16
OUT DDRD, R16
LDI R16, $7E
OUT DDRA, R16
LDI R16, $FF
OUT PORTA, R16
CLR R16
OUT PORTC, R16
OUT PORTD, R16

; Programar t = 0.01s Necesitamos 100 de esos
LDI R16, 155
OUT OCR0, R16
LDI R16, 3
OUT TIFR, R16
LDI R16, 2
OUT TIMSK, R16
LDI R16, 0
OUT TCNT0, R16
LDI R16, 0b00001100 ; Prescaler 256
RCALL CLEAR
CLR R20	;Seg

;*********************************
;Aqu? comienza el programa...
;No olvides configurar al inicio todo lo que utilizar?s
;*********************************

BOTONES:
	SBIC PINA, 0
	RCALL INICIAR
	SBIC PINA, 7
	RCALL CLEAR
RJMP BOTONES

CLEAR:
	CLR R17
	CLR R18
	CLR R19
RET
INICIAR:
	SEI
	OUT TCCR0, R16
RET
SECONDU:
	CLR R20
	INC R17
	CPI R17, 10
	BREQ SECONDD
	CONTSECU:
	OUT PORTC, R19
	CLR R22
	OR R22, R18
	SWAP R22
	OR R22, R17
	OUT PORTD, R22
RJMP CONTINUA
SECONDD:
	INC R18
	CPI R18, 6
	BREQ MINUTE
	CONTSECD:
RJMP CONTSECU

MINUTE: 
	INC R19
	CPI R19, 5
	BREQ FINISH
	CONTMINUTE:
RJMP CONTSECD

FINISH:
	CLI
RJMP CONTMINUTE

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
	IN R21, SREG
	INC R20
	CPI R20, 10
	BREQ SECONDU
	CONTINUA:
		
	OUT SREG, R21
reti
SPM_RDY: 
reti ; Store Program Memory Ready Handler



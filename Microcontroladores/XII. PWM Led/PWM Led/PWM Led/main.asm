;
; PWM Led.asm
;
; Created: 18/11/2021 05:22:36 p. m.
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


;*********************************
;Aqu? comienza el programa...
;No olvides configurar al inicio todo lo que utilizar?s
;*********************************

CLR R16
OUT DDRA, R16
SER R16
OUT PORTA, R16
OUT DDRB, R16
LDI R16, 1
OUT PORTB, R16

CLR R16
OUT TCNT0, R16		;EMPIEZA A CONTAR EN 0
CLR R17				;VARIABLE DE OCR0
LDI R16, 0b0110_1011
OUT TCCR0, R16		;CONFIGURO 

BOTONES:
	OUT OCR0, R17
	SBIS PINA, 0
	RCALL INCREMENTA
	SBIS PINA, 1
	RCALL DECREMENTA
RJMP BOTONES

INCREMENTA:
	CPI R17, 250
	BREQ MAXI
	CBI PORTB, 0
	CBI PORTB, 1
	LDI R18, 10
	ADD R17, R18
	REGRESAI:
		RCALL DELAY
		STAYI:
			SBIS PINA, 0
		RJMP STAYI
		RCALL DELAY
RET
MAXI:
	LDI R16, 6
	OUT PORTB, R16
RJMP REGRESAI

DECREMENTA:
	CPI R17, 0
	BREQ MINI
	CBI PORTB, 0
	CBI PORTB, 1
	SUBI R17, 10
	REGRESAD:
		RCALL DELAY
		STAYD:
			SBIS PINA, 1
		RJMP STAYD
		RCALL DELAY
RET
MINI:
	LDI R16, 5
	OUT PORTB, R16
RJMP REGRESAD

DELAY:						//50,000 ciclos: 50ms 1MHz
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



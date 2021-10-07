;
; Keyboard and Displays.asm
;
; Created: 07/10/2021 03:17:55 p. m.
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
LDI R16, $F0
OUT DDRK, R16
LDI R16, $FF
OUT PORTK, R16
OUT DDRD, R16
CLR R16
OUT PORTD, R16
;...

TECLADO: 
	LDI R16, $EF ;PULL-UPS ENTRADAS, MANDO PRIMER TIERRA A PIN 4
	OUT PORTK, R16
	NOP ;PIERDE CICLO DE RELOJ
	NOP
	SBIS PINK, 0
	RJMP UNO
	SBIS PINK, 1
	RJMP CUATRO
	SBIS PINK, 2
	RJMP SIETE
	SBI PORTK, 4 ;REGRESA 5v
	CBI PORTK, 5 ;CAMBIA GND
	NOP
	NOP
	SBIS PINK, 0
	RJMP DOS
	SBIS PINK, 1
	RJMP CINCO
	SBIS PINK, 2
	RJMP OCHO
	SBIS PINK, 3
	RJMP CERO
	SBI PORTK, 5 
	CBI PORTK, 6 
	NOP
	NOP
	SBIS PINK, 0
	RJMP TRES
	SBIS PINK, 1
	RJMP SEIS
	SBIS PINK, 2
	RJMP NUEVE
	SBI PORTK, 6 
	CBI PORTK, 7 
	NOP
	NOP
RJMP TECLADO

PREPARE:
	IN R16, PIND
	SWAP R16
	ANDI R16, $0F
	OR R16, R17
	OUT PORTD, R16
	RET

UNO:
	LDI R17, 0B1000_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_UNO:
		SBIS PINK, 0
	RJMP TRABA_UNO
	RCALL DELAY
	;CODIGO AL SOLTAR
RJMP TECLADO
DOS:
	LDI R17, 0B0100_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_DOS:
		SBIS PINK, 0
	RJMP TRABA_DOS
	RCALL DELAY
RJMP TECLADO
TRES:
	LDI R17, 0B1100_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_TRES:
		SBIS PINK, 0
	RJMP TRABA_TRES
	RCALL DELAY
RJMP TECLADO

CUATRO:
	LDI R17, 0B0010_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_CUATRO:
		SBIS PINK, 1
	RJMP TRABA_CUATRO
	RCALL DELAY
RJMP TECLADO
CINCO:
	LDI R17, 0B1010_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_CINCO:
		SBIS PINK, 1
	RJMP TRABA_CINCO
	RCALL DELAY
RJMP TECLADO
SEIS:
	LDI R17, 0B0110_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_SEIS:
		SBIS PINK, 1
	RJMP TRABA_SEIS
	RCALL DELAY
RJMP TECLADO

SIETE:
	LDI R17, 0B1110_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_SIETE:
		SBIS PINK, 2
	RJMP TRABA_SIETE
	RCALL DELAY
RJMP TECLADO
OCHO:
	LDI R17, 0B0001_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_OCHO:
		SBIS PINK, 2
	RJMP TRABA_OCHO
	RCALL DELAY
RJMP TECLADO
NUEVE:
	LDI R17, 0B1001_0000
	RCALL PREPARE
	RCALL DELAY
	TRABA_NUEVE:
		SBIS PINK, 2
	RJMP TRABA_NUEVE
	RCALL DELAY
RJMP TECLADO

CERO:
	CLR R17
	RCALL PREPARE
	RCALL DELAY
	TRABA_CERO:
		SBIS PINK, 3
	RJMP TRABA_CERO
	RCALL DELAY
RJMP TECLADO



DELAY:
          ldi  R29, $65
WGLOOP0:  ldi  R30, $A4
WGLOOP1:  dec  R30
          brne WGLOOP1
          dec  R29
          brne WGLOOP0
          ldi  R29, $01
WGLOOP2:  dec  R29
          brne WGLOOP2
          nop
          nop
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
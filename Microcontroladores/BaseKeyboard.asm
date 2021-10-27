;
; BaseKeyboard.asm
;
; Created: 05/10/2021 03:59:18 p. m.
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
SBIS PINK, 3
RJMP ASTERISCO
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
SBIS PINK, 3
RJMP GATITO
SBI PORTK, 6 
CBI PORTK, 7 
NOP
NOP
SBIS PINK, 0
RJMP A
SBIS PINK, 1
RJMP B
SBIS PINK, 2
RJMP C
SBIS PINK, 3
RJMP D
RJMP TECLADO

UNO:
	;CODIGO AL PRESIONAR
	RCALL DELAY
	TRABA_UNO:
		SBIS PINK, 0
	RJMP TRABA_UNO
	RCALL DELAY
	;CODIGO AL SOLTAR
RJMP TECLADO
DOS:
	RCALL DELAY
	TRABA_DOS:
		SBIS PINK, 0
	RJMP TRABA_DOS
	RCALL DELAY
RJMP TECLADO
TRES:
	RCALL DELAY
	TRABA_TRES:
		SBIS PINK, 0
	RJMP TRABA_TRES
	RCALL DELAY
RJMP TECLADO
A:
	RCALL DELAY
	TRABA_A:
		SBIS PINK, 0
	RJMP TRABA_A
	RCALL DELAY
RJMP TECLADO
CUATRO:
	RCALL DELAY
	TRABA_CUATRO:
		SBIS PINK, 1
	RJMP TRABA_CUATRO
	RCALL DELAY
RJMP TECLADO
CINCO:
	RCALL DELAY
	TRABA_CINCO:
		SBIS PINK, 1
	RJMP TRABA_CINCO
	RCALL DELAY
RJMP TECLADO
SEIS:
	RCALL DELAY
	TRABA_SEIS:
		SBIS PINK, 1
	RJMP TRABA_SEIS
	RCALL DELAY
RJMP TECLADO
B:
	RCALL DELAY
	TRABA_B:
		SBIS PINK, 1
	RJMP TRABA_B
	RCALL DELAY
RJMP TECLADO
SIETE:
	RCALL DELAY
	TRABA_SIETE:
		SBIS PINK, 2
	RJMP TRABA_SIETE
	RCALL DELAY
RJMP TECLADO
OCHO:
	RCALL DELAY
	TRABA_OCHO:
		SBIS PINK, 2
	RJMP TRABA_OCHO
	RCALL DELAY
RJMP TECLADO
NUEVE:
	RCALL DELAY
	TRABA_NUEVE:
		SBIS PINK, 2
	RJMP TRABA_NUEVE
	RCALL DELAY
RJMP TECLADO
C:
	RCALL DELAY
	TRABA_C:
		SBIS PINK, 2
	RJMP TRABA_C
	RCALL DELAY
RJMP TECLADO
ASTERISCO:
	RCALL DELAY
	TRABA_ASTERISCO:
		SBIS PINK, 3
	RJMP TRABA_ASTERISCO
	RCALL DELAY
RJMP TECLADO
CERO:
	RCALL DELAY
	TRABA_CERO:
		SBIS PINK, 3
	RJMP TRABA_CERO
	RCALL DELAY
RJMP TECLADO
GATITO:
	RCALL DELAY
	TRABA_GATITO:
		SBIS PINK, 3
	RJMP TRABA_GATITO
	RCALL DELAY
RJMP TECLADO
D:
	RCALL DELAY
	TRABA_D:
		SBIS PINK, 3
	RJMP TRABA_D
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



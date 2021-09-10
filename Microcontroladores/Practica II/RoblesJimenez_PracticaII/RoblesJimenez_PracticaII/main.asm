;*******************
; Micro como 7447
;
; Created: 09/09/2021
; Author : Luis Eduardo Robles Jiménez
;*******************

.include "m16adef.inc"     
   
;*******************
;Registros (aquí pueden definirse)
;.def temporal=r19

;Palabras claves (aquí pueden definirse)
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
;Aquí comienza el programa...
;No olvides configurar al inicio todo lo que utilizarás
;*********************************
LDI R16, $00
OUT DDRA, R16
LDI R16, $FF
OUT PORTA, R16
OUT DDRC, R16
LEER: 
COM R16
OUT PORTC, R16
IN R16, PINA
CPI R16, 0
BREQ CERO
CPI R16, 1
BREQ UNO
CPI R16, 2
BREQ DOS
CPI R16, 3
BREQ TRES
CPI R16, 4
BREQ CUATRO
CPI R16, 5
BREQ CINCO
CPI R16, 6
BREQ SEIS
CPI R16, 7
BREQ SIETE
CPI R16, 8
BREQ OCHO
CPI R16, 9
BREQ NUEVE
LDI R16, $FF
RJMP LEER

CERO:
LDI R16, 0b01000000
RJMP LEER
UNO:
LDI R16, 0b00000110
RJMP LEER
DOS:
LDI R16, $20
RJMP LEER
TRES:
LDI R16, $30
RJMP LEER
CUATRO:
LDI R16, $40
RJMP LEER
CINCO:
LDI R16, $50
RJMP LEER
SEIS:
LDI R16, $60
RJMP LEER
SIETE:
LDI R16, $70
RJMP LEER
OCHO:
LDI R16, $80
RJMP LEER
NUEVE:
LDI R16, $90
RJMP LEER




;*********************************
;Aquí está el manejo de las interrupciones concretas
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




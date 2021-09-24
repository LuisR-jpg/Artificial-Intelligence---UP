;
; ContadoresIndependientes.asm
;
; Created: 23/09/2021 03:59:16 p. m.
; Author : lalor
;

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


//Puerto parcial de entrada y completo de salida
LDI R16, 0
OUT DDRA, R16
LDI R16, $FF
OUT PORTA, R16
OUT DDRC, R16
LDI R16, 0
OUT PORTC, R16
LDI R17, 0 //CONTADOR UNO
LDI R18, 0 //CONTADOR DOS

BOTONES:
SBIS PINA, 0
RCALL RESETUNO
SBIS PINA, 2
RCALL AUMENTAUNO
SBIS PINA, 4
RCALL RESETDOS
SBIS PINA, 6
RCALL AUMENTADOS
RJMP BOTONES

AUMENTAUNO:
INC R17
CPI R17, $10
BREQ RESETRUNO
RCALL PRINT
RCALL DELAY
STAYUNO:
SBIS PINA, 2
RJMP STAYUNO
RCALL DELAY
RET

AUMENTADOS:
RCALL DELAY
STAYDOS:
SBIS PINA, 6
RJMP STAYDOS
RCALL DELAY
INC R18
CPI R18, $10
BREQ RESETRDOS
RCALL PRINT
RET

RESETUNO:
RCALL RESETRUNO
RCALL PRINT
RCALL DELAY
STAYRUNO:
SBIS PINA, 0
RJMP STAYRUNO
RCALL DELAY
RET

RESETDOS:
RCALL DELAY
STAYRDOS:
SBIS PINA, 4
RJMP STAYRDOS
RCALL DELAY
RCALL RESETRDOS
RCALL PRINT
RET

RESETRUNO:
LDI R17, 0
RET
RESETRDOS:
LDI R18, 0
RET

PRINT:
MOV R19, R17
SWAP R19
OR R19, R18
OUT PORTC, R19
RET

DELAY:
;     50000 cycles:
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

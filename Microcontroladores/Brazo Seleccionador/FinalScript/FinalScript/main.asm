;
; FinalScript.asm
;
; Created: 21/11/2021 3:29 pm
; Author : Sara y Lalo
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
//STEPPER BASE 
LDI R16, $FF						
OUT DDRA, R16
LDI R16, $FF
OUT PORTA, R16
//SERVO
LDI R16, $FC
OUT DDRB, R16
SER R16
OUT PORTB, R16

BOTON:
	SBIS PINB, 0
	RCALL EXECUTE
RJMP BOTON

EXECUTE:

	CLR R16
	OUT TCNT0, R16		;EMPIEZA A CONTAR EN 0
	LDI R17, 30			;VARIABLE DE OCR0
	OUT OCR0, R17
	LDI R16, 0b0110_1011
	OUT TCCR0, R16		;CONFIGURO 

	RCALL FINISHED
	RCALL GODOWN
	RCALL FINISHED
	RCALL CLOSE
	RCALL FINISHED
	RCALL GOUP
	RCALL FINISHED
	SBIS PINB, 1
	RJMP BLACK
	RJMP WHITE
	CHOSE:
	RCALL FINISHED
	RCALL GOVDOWN
	RCALL FINISHED
	RCALL OPEN
	RCALL FINISHED
	RCALL GOVUP
	RCALL FINISHED
	SBRS R18, 0
	RJMP RETBLACK
	RJMP RETWHITE
	GOBACK:
		RCALL FINISHED
		RCALL CLOSE

	RCALL DELAYBUTTON
	TRABA:
		SBIS PINB, 0
	RJMP TRABA
	RCALL DELAYBUTTON
RET

LDI R30, $FF
FOREVER:
	SBRC R30, 7
	RJMP FOREVER
BLACK:
	RCALL GORIGHT
	CLR R18
RJMP CHOSE
WHITE:
	RCALL GOLEFT
	SER R18
RJMP CHOSE
RETBLACK:
	RCALL GOLEFT
RJMP GOBACK
RETWHITE:
	RCALL GORIGHT
RJMP GOBACK
FINISHED:
	RCALL DELAYONESEC
	CLR R17
RET
OPEN:
	LDI R17, 30
	OUT OCR0, R17
RET
CLOSE: 
	LDI R17, 10
	OUT OCR0, R17
RET
RETURN: RET
GODOWN:
	INC R17
	CPI R17, 50
	BREQ RETURN 
	RCALL DOWN
RJMP GODOWN
GOVDOWN:
	INC R17
	CPI R17, 120
	BREQ RETURN
	RCALL DOWN
RJMP GOVDOWN

GOUP:
	INC R17
	CPI R17, 55
	BREQ RETURN
	RCALL UP
RJMP GOUP
GOVUP:
	INC R17
	CPI R17, 125
	BREQ RETURN
	RCALL UP
RJMP GOVUP

GORIGHT:
	INC R17
	CPI R17, 80
	BREQ RETURN
	RCALL RIGHT
RJMP GORIGHT

GOLEFT:
	INC R17
	CPI R17, 80
	BREQ RETURN
	RCALL LEFT
RJMP GOLEFT
DOWN:
	LDI R16, 0b1000_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0100_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0010_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0001_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
RET
UP:
	LDI R16, 0b0001_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0010_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0100_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b1000_0000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
RET
RIGHT:
	LDI R16, 0b0000_1000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0000_0100
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0000_0010
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0000_0001
	OUT PORTA, R16
	RCALL DELAYSTEPPER
RET
LEFT:
	LDI R16, 0b0000_0001
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0000_0010
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0000_0100
	OUT PORTA, R16
	RCALL DELAYSTEPPER
	LDI R16, 0b0000_1000
	OUT PORTA, R16
	RCALL DELAYSTEPPER
RET

DELAYSTEPPER:
; ============================= 
;    delay loop generator 
;     3000 cycles:
; ----------------------------- 
; delaying 2997 cycles:
          ldi  R29, $09
WGLOOP0:  ldi  R30, $6E
WGLOOP1:  dec  R30
          brne WGLOOP1
          dec  R29
          brne WGLOOP0
; ----------------------------- 
; delaying 3 cycles:
          ldi  R29, $01
WGLOOP2:  dec  R29
          brne WGLOOP2
; ============================= 
ret

DELAYBUTTON:						//50,000 ciclos: 50ms 1MHz
	; ============================= 
	;    delay loop generator 
	;     50000 cycles:
	; ----------------------------- 
	; delaying 49995 cycles:
			  ldi  R29, $65
	loop0:  ldi  R30, $A4
	loop1:  dec  R30
			  brne loop1
			  dec  R29
			  brne loop0
	; ----------------------------- 
	; delaying 3 cycles:
			  ldi  R29, $01
	loop2:  dec  R29
			  brne loop2
	; ----------------------------- 
	; delaying 2 cycles:
			  nop
			  nop
	; ============================= 
RET

DELAYONESEC:
; ============================= 
;    delay loop generator 
;     500000 cycles:
; ----------------------------- 
; delaying 499995 cycles:
          ldi  R29, $0F
OOP0:  ldi  R30, $37
OOP1:  ldi  R31, $C9
OOP2:  dec  R31
          brne OOP2
          dec  R30
          brne OOP1
          dec  R29
          brne OOP0
; ----------------------------- 
; delaying 3 cycles:
          ldi  R29, $01
OOP3:  dec  R29
          brne OOP3
; ----------------------------- 
; delaying 2 cycles:
          nop
          nop
; ============================= 
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
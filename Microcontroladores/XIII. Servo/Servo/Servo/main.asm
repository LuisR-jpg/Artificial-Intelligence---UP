;
; Servo.asm
;
; Created: 29/11/2021 10:58:47 a. m.
; Author : lalor
;

.include "m16adef.inc"     
   
;******************************************************
;Registros (aqu? pueden definirse)
;.def temporal=r19

;Palabras claves (aqu? pueden definirse)
;.equ LCD_DAT=DDRC
;.equ ESA = DDRA
;.equ ESA = DDRB
;.equ ESA = DDRC
;.equ ESA = DDRD
.equ DDR_TEC = DDRD	
.equ PORT_TEC = PORTD 
.equ PIN_TEC = PIND
;******************************************************

.org 0x0000
;Comienza el vector de interrupciones.
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
; Termina el vector de interrupciones.

;******************************************************
;
;******************************************************

Reset:
;Primero inicializamos el stack pointer...
ldi r16, high(RAMEND)
out SPH, r16
ldi r16, low(RAMEND)
out SPL, r16 

//Teclado
ldi R16, 0xF0 ;es lo mismo que declararlo como 0b1111_0000
out DDR_TEC, R16 ; configur? el puerto del teclado SALIDAS:ENTRADAS

//Display
ldi R16, $FF						;salidas
out DDRC, R16
ldi R16, $03						;encendidos en "3"
out PORTC, R16

//Servo (funciona a 50 Hz) /*entonces, busco en la tablita el Fpwm(Hz) que mejor me convenga y a?ado el tiempo necesario al excel*/
ldi R16, $FF						;salidas
out DDRB, R16
ldi R16, $FF						;encendido al inicio
out PORTB, R16
ldi R16, 0							;inicializo en 0
out TCNT0, R16
ldi R16, 22							;lo dice el excel (segs=0.001)
out OCR0, R16
ldi R16, 0b0110_1011				;prescaler = 64
out TCCR0, R16

TECLADO: //ciclo
	;ldi R16, 0b1110_1111			;para ahorrarme el "cbi PORT_TEC, 4"
	ldi R16, 0xFF
	out PORT_TEC, R16				;5v:Salidas // pullups:entradas
	cbi PORT_TEC, 4					;A4=0 (pin 4 con 0)
	nop								;pierde un ciclo de reloj
	nop								;pierde otro ciclo de reloj
	

	//1,4,7,*  ---------------------------------------------------------
	sbis PIN_TEC,0					;si tiene un 1 se brinca la l?nea
	rjmp UNO
	sbis PIN_TEC,1
	rjmp CUATRO
	sbi PORT_TEC, 4					;A4=1 --5v
	cbi PORT_TEC, 5					;A5=0 --0v
	nop
	nop


	//2,5,8,0   ---------------------------------------------------------
	sbis PIN_TEC,0					;tiene un 1 se brinca la l?nea
	rjmp DOS
	sbis PIN_TEC,1
	rjmp CINCO

	sbi PORT_TEC, 5					;A5=1 --5v
	cbi PORT_TEC, 6					;A6=0 --0v
	nop
	nop


	//3,6,9,#   ---------------------------------------------------------
	sbis PIN_TEC,0					;tiene un 1 se brinca la l?nea
	rjmp TRES

rjmp TECLADO  //regresa al ciclo


UNO:	//0?
	;c?digo al presionar
	rcall RETARDO50m
	TRABA_UNO	:					;mientras tenga 0 se cicla
		sbis PIN_TEC, 0				;A0 porque entr? el UNO en A0
	RJMP TRABA_UNO
	rcall RETARDO50m
	;c?digo al soltar
	ldi R16, 1						;para mostrar la posici?n en el display
	out PORTC, R16
	//Servo
	ldi R16, 5						
	out OCR0, R16
	ldi R16, 0b0110_1011				
	out TCCR0, R16
rjmp TECLADO

DOS:	//45?
	;c?digo al presionar
	rcall RETARDO50m
	TRABA_DOS:						;mientras tenga 0 se cicla
		sbis PIN_TEC, 0				;A0 porque entr? el UNO en A0
	RJMP TRABA_DOS
	rcall RETARDO50m
	;c?digo al soltar
	ldi R16, 2
	out PORTC, R16
	//Servo
	ldi R16, 14						
	out OCR0, R16
	ldi R16, 0b0110_1011				
	out TCCR0, R16
rjmp TECLADO

TRES:	//90?
	;c?digo al presionar
	rcall RETARDO50m
	TRABA_TRES:						;mientras tenga 0 se cicla
		sbis PIN_TEC, 0				;A0 porque entr? el UNO en A0
	RJMP TRABA_TRES
	rcall RETARDO50m
	;c?digo al soltar
	ldi R16, 3
	out PORTC, R16
	//SERVO
	ldi R16, 22						
	out OCR0, R16
	ldi R16, 0b0110_1011				
	out TCCR0, R16
rjmp TECLADO

CUATRO:	//135?
	;c?digo al presionar
	rcall RETARDO50m
	TRABA_CUATRO:					;mientras tenga 0 se cicla
		sbis PIN_TEC, 1				;A0 porque entr? el UNO en A0
	RJMP TRABA_CUATRO
	rcall RETARDO50m
	;c?digo al soltar
	ldi R16, 4
	out PORTC, R16
	//Servo
	ldi R16, 31						
	out OCR0, R16
	ldi R16, 0b0110_1011				
	out TCCR0, R16
rjmp TECLADO

CINCO:	//180?
	;c?digo al presionar
	rcall RETARDO50m
	TRABA_CINCO:					;mientras tenga 0 se cicla
		sbis PIN_TEC, 1				;A0 porque entr? el UNO en A0
	RJMP TRABA_CINCO
	rcall RETARDO50m
	;c?digo al soltar
	ldi R16, 5
	out PORTC, R16
	//Servo
	ldi R16, 39						
	out OCR0, R16
	ldi R16, 0b0110_1011				
	out TCCR0, R16
rjmp TECLADO

RETARDO50m:						//50,000 ciclos
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


;******************************************************
;Aqu? est?n las rutinas para el manejo de las interrupciones concretas
;******************************************************
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
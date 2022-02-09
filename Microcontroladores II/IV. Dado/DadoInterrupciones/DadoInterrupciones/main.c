/*
 * DadoInterrupciones.c
 *
 * Created: 8/2/2022 15:42:41
 * Author : lalor
 */ 

#define F_CPU 1000000
#define isClear(r, i) (!(r & (1 << i)))
#define isSet(r, i) (r & (1 << i))
#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <stdlib.h>
#include <time.h>
uint8_t print(uint8_t n){
	switch(n){
		case 1: return 0b00001000;
		case 2: return 0b00010010;
		case 3: return 0b01001001;
		case 4: return 0b01100011;
		case 5: return 0b01101011;
		case 6: return 0b01110111;
	}
	return 0;
}
ISR(INT0_vect){
	_delay_ms(50);
	while(isClear(PIND, 2));
	_delay_ms(50);
	PORTA = print(rand() % 6 + 1);
}
int main(void)
{
	DDRA = 0xFF;
	PORTA = 0;
	DDRD = 0xFB;
	PORTD = 0x00;
	sei();
	GIFR = 0xE0;
	MCUCR = 0x02;
	GICR = 0x40;
	srand(time(NULL));
    for(;;);
}


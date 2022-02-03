/*
 * III. Matricial.c
 *
 * Created: 3/2/2022 15:34:57
 * Author : lalor
 */ 

#define F_CPU 1000000
#define print(n) ((n % 10) | ((n / 10) << 4))
#define isClear(r, i) (!(r & (1 << i)))
#define isSet(r, i) (r & (1 << i))
#define PINX PINA
#define PORTX PORTA
#define DDRX DDRA
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

uint8_t keyboard[4][4] = 
{
	{0x7, 0x8, 0x9, 0xA},
	{0x4, 0x5, 0x6, 0xB},
	{0x1, 0x2, 0x3, 0xC},
	{0xE, 0x0, 0xF, 0xD}
};

uint8_t hastaTecla(){
	for(uint8_t i = 0;; i++){
		if(i == 4) i = 0;
		PORTX = ~(1 << i);
		asm("nop");
		asm("nop");
		for(uint8_t j = 4; j < 8; j++){
			if(isClear(PINX, j)){
				_delay_ms(50);
				while(isClear(PINX, j));
				_delay_ms(50);
				return keyboard[7 - j][3 - i];
			}
		}
	}
}

int main(){
    DDRX = 0x0F;
    PORTX = 0xFF;
	DDRC = 0xFF;
	PORTC = 0x00;
	DDRD = 0xFF;
	PORTD = 0x00;
    uint8_t tecla, c = 0, d = 0;
    for(;;){
	    tecla = hastaTecla();
		d = c >> 4;
		c <<= 4;
		c |= tecla;
		PORTC = c;
		PORTD = d;
    }
}


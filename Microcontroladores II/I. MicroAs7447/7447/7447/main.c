/*
 * 7447.c
 *
 * Created: 30/1/2022 13:19:26
 * Author : lalor
 */ 

#include <avr/io.h>
#include <stdint.h>

#define dZERO	0b11000000
#define dONE	0b11111001
#define dTWO	0b10100100
#define dTHREE	0b10110000
#define dFOUR	0b10011001
#define dFIVE	0b10010010
#define dSIX	0b10000010
#define dSEVEN	0b11111000
#define dEIGHT	0b10000000
#define dNINE	0b10010000

int main(void)
{
	DDRA = 0x0F;
	PORTA = 0xFF;
	DDRC = 0xFF;
    for(;;){
		//PINA >> 4 should work, but fails in proteus
		/*
		int8_t dip = 0, r = 0xFF, read = PINA;
		for(int8_t i = 0; i < 4; i++)
			dip += ((read >> 4) & (1 << i));
		*/
		int8_t dip = PINA >> 4, r = 0xFF;
		if(dip == 0) r = dZERO;
		if(dip == 1) r = dONE;
		if(dip == 2) r = dTWO;
		if(dip == 3) r = dTHREE;
		if(dip == 4) r = dFOUR;
		if(dip == 5) r = dFIVE;
		if(dip == 6) r = dSIX;
		if(dip == 7) r = dSEVEN;
		if(dip == 8) r = dEIGHT;
		if(dip == 9) r = dNINE;
		PORTC = ~r;
    }
}


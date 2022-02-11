/*
 * ServoKeyboardDisplay.c
 *
 * Created: 10/2/2022 16:03:25
 * Author : lalor
 */ 

#define F_CPU 4000000
#define PINX PINA
#define DDRX DDRA
#define PORTX PORTA
#define isClear(r, i) (!(r & (1 << i)))
#define isSet(r, i) (r & (1 << i))
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
uint8_t print(uint8_t cont){
	return (((cont & 1) << 5) | ((cont & 2) << 3) | ((cont & 4) << 1) | ((cont & 8) >> 1));
}
uint8_t hastaTecla(){
	for(uint8_t i = 0;; i++, i %= 4){
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
	PORTC = (5 << 2);
	uint8_t tecla, cont = 0;
	for(;;){
		PORTC = print(cont);
		tecla = hastaTecla();
		if(tecla == 0x9 && cont < 9) cont++;
		if(tecla == 0x1 && cont > 0) cont--;
		//if(tecla == 0xD) servo(cont);
	}
}

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
#define swapB(r) ((r & 0xAA) >> 1 | (r & 0x55) << 1)
#define swapP(r) ((r & 0xCC) >> 2 | (r & 0x33) << 2)
#define swap(r) (r << 4 | r >> 4)
#define reverse(r) swap(swapP(swapB(r)))

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
	PORTX = DDRC = DDRB = 0xFF;
	uint8_t tecla, cont = 0;
	TCNT0 = 0, OCR0 = 14, TCCR0 = 0b01101100;
	for(;;){
		PORTC = reverse(cont) >> 2;
		tecla = hastaTecla();
		if(tecla == 0x9 && cont < 9) cont++;
		if(tecla == 0x1 && cont > 0) cont--;
		if(tecla == 0xD) OCR0 = 14 + 2*cont;
	}
}

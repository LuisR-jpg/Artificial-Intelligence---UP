/*
 * IncDecCounter.c
 *
 * Created: 1/2/2022 15:16:29
 * Author : lalor
 */ 

#define F_CPU 1000000
#define isClear(r, i) (!(r & (1 << i)))
#define isSet(r, i) (r & (1 << i))
#define print(n) (((n % 10) << 4) | (n / 10))
#include <avr/io.h>
#include <stdint.h>
#include <util/delay.h>

//int8_t print(int8_t n){
	//int8_t u = ((n % 10) << 4), d = n / 10;
	//return u | d;
//}

int main(void)
{
	DDRA = 0x7E;
	PORTA = 0xFF;
	DDRC = 0xFF;
	PORTC = 0;
	int8_t cnt = 0;
    for(;;){
		if(isClear(PINA, 0)){
			_delay_ms(50);
			while(isClear(PINA, 0));
			_delay_ms(50);
			if(cnt < 99) cnt++;
			PORTC = print(cnt);
		}
		if(isClear(PINA, 7)){
			_delay_ms(50);
			while(isClear(PINA, 7));
			_delay_ms(50);
			if(cnt) cnt--;
			PORTC = print(cnt);
		}
    }
}

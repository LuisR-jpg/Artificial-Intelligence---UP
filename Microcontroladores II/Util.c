#include <avr/io.h> //Loads basic C functions
#include <stdint.h> //Includes fixed size integers
#include <util/delay.h>
#define F_CPU 1000000 //Sets frequency for delays

//[0 - 99] number to displays with units in most significant nibble
#define print(n) (((n % 10) << 4) | (n / 10))

//Bit in any register is set or clear
#define isClear(r, i) (!(r & (1 << i)))
#define isSet(r, i) (r & (1 << i))
//RTR usando las funciones de arriba
if(isClear(PINx, y)){
    //Al presionar
    _delay_ms(50);
    while(isClear(PINx, y));
    _delay_ms(50);
    //Al soltar
}

//Display 7 segmentos anodo comun pines 0-6
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


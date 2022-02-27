//[0 - 99] number to displays with units in most significant nibble
#define print(n) (((n % 10) << 4) | (n / 10))

//Detect and wait for button
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

//Servo
//	OCR0 = 5 para 0 grados; 38 para 180 grados
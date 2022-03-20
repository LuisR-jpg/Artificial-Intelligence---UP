/*
 * EEPROM.c
 *
 * Created: 17/3/2022 16:25:25
 * Author : lalor
 */ 

#include <avr/io.h>
#include <stdint.h>
#include <stdlib.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#define F_CPU 1000000
#define isClear(r, i) (!isSet(r, i))
#define isSet(r, i) (r & (1 << i))
#define setBit(r, i) (r | (1 << i))
#define clearBit(r, i) (r & ~(1 << i))
#define swapB(r) ((r & 0xAA) >> 1 | (r & 0x55) << 1)
#define swapP(r) ((r & 0xCC) >> 2 | (r & 0x33) << 2)
#define swap(r) (r << 4 | r >> 4)
#define reverse(r) swap(swapP(swapB(r)))

#define DDRLCD DDRC
#define PORTLCD PORTC
#define PINLCD PINC
#define RS 4
#define RW 5
#define E 6
#define BF 3
#define LCD_Cmd_Clear      0b00000001
#define LCD_Cmd_Home       0b00000010
//#define LCD_Cmd_Mode     0b000001 ID  S
#define LCD_Cmd_ModeDnS	   0b00000110 //sin shift cursor a la derecha
#define LCD_Cmd_ModeInS	   0b00000100 //sin shift cursor a la izquierda
#define LCD_Cmd_ModeIcS	   0b00000111 //con shift desplazamiento a la izquierda
#define LCD_Cmd_ModeDcS	   0b00000101 //con shift desplazamiento a la derecha
//#define LCD_Cmd_OnOff    0b00001 D C B
#define LCD_Cmd_Off		   0b00001000 //apagar el display
#define LCD_Cmd_OnsCsB	   0b00001100 //On sin cursor sin blinking
#define LCD_Cmd_OncCsB     0b00001110 //On con cursor sin blinking
#define LCD_Cmd_OncCcB     0b00001111 //On con cursor con blinking
//#define LCD_Cmd_Shift    0b0001 SC  RL 00
//#define LCD_Cmd_Function 0b001 DL  N  F  00
#define LCD_Cmd_Func2Lin   0b00101000 //para dos lineas
#define LCD_Cmd_Func1LinCh 0b00100000 //para una linea con letra chica
#define LCD_Cmd_Func1LinG  0b00100100 //para una linea con letra grande
//#define LCD_Cmd_DDRAM    0b1xxxxxxx
void LCD_wr_lines(uint8_t *a, uint8_t *b){
	LCD_wr_instruction(LCD_Cmd_Clear);
	LCD_wr_instruction(LCD_Cmd_Home);
	LCD_wr_string(a);
	LCD_wr_instruction(0b11000000);
	LCD_wr_string(b);
}
void LCD_wr_string(volatile uint8_t *s){
	uint8_t c;
	while((c=*s++)){
		LCD_wr_char(c);
	}
}
void LCD_init(void){
	DDRLCD=(15<<0)|(1<<RS)|(1<<RW)|(1<<E); //DDRLCD=DDRLCD|(0B01111111)
	_delay_ms(15);
	LCD_wr_inst_ini(0b00000011);
	_delay_ms(5);
	LCD_wr_inst_ini(0b00000011);
	_delay_us(100);
	LCD_wr_inst_ini(0b00000011);
	_delay_us(100);
	LCD_wr_inst_ini(0b00000010);
	_delay_us(100);
	LCD_wr_instruction(LCD_Cmd_Func2Lin);	//4 Bits, n?mero de l?neas y tipo de letra
	LCD_wr_instruction(LCD_Cmd_Off);		//apaga el display
	LCD_wr_instruction(LCD_Cmd_Clear);		//limpia el display
	LCD_wr_instruction(LCD_Cmd_ModeDnS);	//Entry mode set ID S
	LCD_wr_instruction(LCD_Cmd_OnsCsB);		//Enciende el display
}
void LCD_wr_char(uint8_t data){
	//saco la parte m?s significativa del dato
	PORTLCD=data>>4; //Saco el dato y le digo que escribir? un dato
	saca_uno(&PORTLCD,RS);
	saca_cero(&PORTLCD,RW);
	saca_uno(&PORTLCD,E);
	_delay_ms(10);
	saca_cero(&PORTLCD,E);
	//saco la parte menos significativa del dato
	PORTLCD=data&0b00001111; //Saco el dato y le digo que escribir? un dato
	saca_uno(&PORTLCD,RS);
	saca_cero(&PORTLCD,RW);
	saca_uno(&PORTLCD,E);
	_delay_ms(10);
	saca_cero(&PORTLCD,E);
	saca_cero(&PORTLCD,RS);
	LCD_wait_flag();
	
}
void LCD_wr_inst_ini(uint8_t instruccion){
	PORTLCD=instruccion; //Saco el dato y le digo que escribir? un dato
	saca_cero(&PORTLCD,RS);
	saca_cero(&PORTLCD,RW);
	saca_uno(&PORTLCD,E);
	_delay_ms(10);
	saca_cero(&PORTLCD,E);
}
void LCD_wr_instruction(uint8_t instruccion){
	//saco la parte m?s significativa de la instrucci?n
	PORTLCD=instruccion>>4; //Saco el dato y le digo que escribir? un dato
	saca_cero(&PORTLCD,RS);
	saca_cero(&PORTLCD,RW);
	saca_uno(&PORTLCD,E);
	_delay_ms(10);
	saca_cero(&PORTLCD,E);
	//saco la parte menos significativa de la instrucci?n
	PORTLCD=instruccion&0b00001111; //Saco el dato y le digo que escribir? un dato
	saca_cero(&PORTLCD,RS);
	saca_cero(&PORTLCD,RW);
	saca_uno(&PORTLCD,E);
	_delay_ms(10);
	saca_cero(&PORTLCD,E);
	LCD_wait_flag();
}
void LCD_wait_flag(void){
	//	_delay_ms(100);
	DDRLCD&=0b11110000; //Para poner el pin BF como entrada para leer la bandera lo dem?s salida
	saca_cero(&PORTLCD,RS);// Instrucci?n
	saca_uno(&PORTLCD,RW); // Leer
	while(1){
		saca_uno(&PORTLCD,E); //pregunto por el primer nibble
		_delay_ms(10);
		saca_cero(&PORTLCD,E);
		if(isSet(PINLCD,BF)) {break;} //uno_en_bit para protues, 0 para la vida real
		_delay_us(10);
		saca_uno(&PORTLCD,E); //pregunto por el segundo nibble
		_delay_ms(10);
		saca_cero(&PORTLCD,E);
	}
	saca_uno(&PORTLCD,E); //pregunto por el segundo nibble
	_delay_ms(10);
	saca_cero(&PORTLCD,E);
	//entonces cuando tenga cero puede continuar con esto...
	saca_cero(&PORTLCD,RS);
	saca_cero(&PORTLCD,RW);
	DDRLCD|=(15<<0)|(1<<RS)|(1<<RW)|(1<<E);
}
void saca_uno(volatile uint8_t *LUGAR, uint8_t BIT){
	*LUGAR=*LUGAR|(1<<BIT);
}
void saca_cero(volatile uint8_t *LUGAR, uint8_t BIT){
	*LUGAR=*LUGAR&~(1<<BIT);
}

#define PINX PIND
#define DDRX DDRD
#define PORTX PORTD
//uint8_t keyboard[4][4] =
//{
//{0x7, 0x8, 0x9, 0xA},
//{0x4, 0x5, 0x6, 0xB},
//{0x1, 0x2, 0x3, 0xC},
//{0xE, 0x0, 0xF, 0xD}
//};
/*
uint8_t keyboard[4][4] =
{
	{0x1, 0x2, 0x3, 0xA},
	{0x4, 0x5, 0x6, 0xB},
	{0x7, 0x8, 0x9, 0xC},
	{0xE, 0x0, 0xF, 0xD}
};
*/
uint8_t keyboard[4][4] =
{
	{'7', '8', '9', 'A'},
	{'4', '5', '6', 'B'},
	{'1', '2', '3', 'C'},
	{'E', '0', 'F', 'D'}
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
				return keyboard[i][j-4];
			}
		}
	}
}
void KB_init(){
	DDRX = 0x0F;
	PORTX = 0xFF;
}

#define PORTADC PORTA
#define PINADC PINA
#define DDRADC DDRA
void ADC_init(){
	ADMUX = 0b01000010; 
		/*
			7, 6: 01 = Connect AREF to 5v, connect pins 10, 11, 30 and 31
			5: 0 = 10 bits adjusted to the right (using full precision of the ADC)
			2, 1, 0: Specify the PIN to be read in binary
		*/
	SFIOR = 0b00000011;
		/* 
			Last 3 bits: 
				000 - Free running mode (we ask to do the conversion)
				011 - Compare match timer 0
			When using something different to free running mode: Bit 5 of ADCSRA has to be 1.
		*/
	ADCSRA =  0b11111011; //Fdiv = 32 CON INTERRUPCIONES
		/* 
			7: ADC Enable. 1 ON; 0 OFF
			6: When 'free running mode' a 1 indicates when to start the conversion
				
				ADCSRA |= (1<<ADSC); Needed whenever we want to start
				
			5: Has to be 1 when not in free running mode
			4: Flag of interruption when the conversion finishes (1 to clear interruption)
			3: Tells if we want an interruption when the conversion ends (SEI is needed)
			2 - 0: Divisor Factor. Helps to keep the needed frequency of the ADC between 50kHz - 200kHz
				Bits Divisor
				000		2
				001		2
				010		4
				011		8
				100		16
				101		32
				110		64
				111		128
				Fmicro/Divisor has to be between the valid range.
		*/
			
	DDRADC = 0b00000000;
	PORTADC = 0b00000000; //ADC doesnt need pull up
}
ISR(ADC_vect){ //Entra aqu? solito despu?s de la conversion
	uint16_t rej = ADC;
	
	//C?digo
	
	rej >>= 2;
	PORTC = OCR2 = rej;
}

void Timer0_init(){
	TIFR = 0b00000011; // Clear interruptions
	TIMSK = 0b00000010; // Set interruption. Bit 0: Overflow; Bit 1: Compare
	//sei();
	TCNT0 = 0; //Counts
	OCR0 = 97; //When the compare interruption will be called
	TCCR0 = 0b00001101; //CTC, last 3 bits to set prescaler (1024)
}
ISR(TIMER0_COMP_vect){
	
}

void EEPROM_write(uint8_t address, uint8_t data) {
	while(isSet(EECR, EEWE));
	EEAR = address;
	EEDR = data;
	EECR = setBit(EECR, EEMWE);
	EECR = setBit(EECR, EEWE);
}
uint8_t EEPROM_read(uint8_t address) {
	while(isSet(EECR, EEWE));
	EEAR = address;
	EECR = setBit(EECR, EERE);
	return EEDR;
}

int main(void)
{
	LCD_init();
	KB_init(); 
	uint8_t n = 4;
	for(;;){
		LCD_wr_instruction(0b10001100);
		for(uint16_t i = 0; i < n; i++)
			LCD_wr_char(EEPROM_read(i));
		uint8_t t = hastaTecla();
		DDRA = 0xff;
		PORTA = t;
		for(uint16_t i = n - 1; i > 0; i--) {
			uint8_t p = EEPROM_read(i - 1);
			EEPROM_write(i, p);
		}
		EEPROM_write(0, t);
	}
}
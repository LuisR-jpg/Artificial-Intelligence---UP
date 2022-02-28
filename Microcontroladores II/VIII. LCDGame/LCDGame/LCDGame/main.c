/*
 * LCDGame.c
 *
 * Created: 24/2/2022 15:08:23
 * Author : lalor
 */ 

#define F_CPU 1000000
#include <avr/io.h>
#include <util/delay.h>
#include <stdint.h>
#include <stdlib.h>
#include <avr/interrupt.h>

#define isClear(r, i) (!isSet(r, i))
#define isSet(r, i) (r & (1 << i))
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
#define LCD_Cmd_Off		   0b00001000
#define LCD_Cmd_OnsCsB	   0b00001100
#define LCD_Cmd_OncCsB     0b00001110
#define LCD_Cmd_OncCcB     0b00001111
//#define LCD_Cmd_Shift    0b0001 SC  RL 00
//#define LCD_Cmd_Function 0b001 DL  N  F  00
#define LCD_Cmd_Func2Lin   0b00101000
#define LCD_Cmd_Func1LinCh 0b00100000
#define LCD_Cmd_Func1LinG  0b00100100
//#define LCD_Cmd_DDRAM    0b1xxxxxxx

uint8_t seed = 0;
uint8_t uno[16], dos[16], points;
const uint8_t wait = 500;
uint8_t squares[2][10] = {0};

void saca_uno(volatile uint8_t *LUGAR, uint8_t BIT);
void saca_cero(volatile uint8_t *LUGAR, uint8_t BIT);
void LCD_wr_inst_ini(uint8_t instruccion);
void LCD_wr_char(uint8_t data);
void LCD_wr_instruction(uint8_t instruccion);
void LCD_wait_flag(void);
void LCD_init(void);
void LCD_wr_string(volatile uint8_t *s);

//Teclado
#define PINX PINA
#define DDRX DDRA
#define PORTX PORTA
/*
uint8_t keyboard[4][4] =
{
	{'7', '8', '9', 'A'},
	{'4', '5', '6', 'B'},
	{'1', '2', '3', 'C'},
	{'E', '0', 'F', '+'}
};
*/
uint8_t keyboard[4][4] =
{
	{'1', '2', '3', 'A'},
	{'4', '5', '6', 'B'},
	{'7', '8', '9', 'C'},
	{'E', '0', 'F', '+'}
};
uint8_t hastaTecla(){
	for(uint8_t i = 0;; i++, i %= 4, seed++){
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

uint8_t hastaTeclaWrapper(){
	uint8_t t = hastaTecla();
	if(t == 'E'){
		LCD_wr_instruction(LCD_Cmd_Home);
		LCD_wr_instruction(LCD_Cmd_Clear);
		LCD_wr_string("Tu puntaje es: ");
		LCD_wr_char('0' + points);
		_delay_ms(wait);
		LCD_wr_lines(uno, dos);
	}
	return t;
}

void KB_init(){
	DDRX = 0x0F;
	PORTX = 0xFF;
}

	
void LCD_wr_lines(uint8_t *a, uint8_t *b){
	LCD_wr_instruction(LCD_Cmd_Clear);
	LCD_wr_instruction(LCD_Cmd_Home);
	LCD_wr_string(a);
	LCD_wr_instruction(0b11000000);
	LCD_wr_string(b);
}

int main(void)
{
	LCD_init();
	KB_init();	
	
	for(;;){
		srand(seed);
		uint8_t t, try;
		points = 0;
		sprintf(uno, "Cuantas coordena");
		sprintf(dos, "");
		LCD_wr_lines(uno, dos);
		do t = hastaTeclaWrapper();			
		while(t < '0' || t > '9');
		try = t - '0';
		sprintf(uno, "Escondere %c", t);
		sprintf(dos, "coordenada");
		if(try > 1) sprintf(dos, "coordenadas");
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
		sprintf(uno, "Tu debes buscar ");
		sprintf(dos, "%c coordenada.", t);
		if(try > 1) sprintf(dos, "%c coordenadas.", t);
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
		sprintf(uno, "2 filas (0,1)");
		sprintf(dos, "10 cols (0-9)");
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
		sprintf(dos, "para continuar..");
		sprintf(uno, "Presiona +");
		LCD_wr_lines(uno, dos);
		do t = hastaTeclaWrapper();
		while(t != '+');
		sprintf(dos, "memorizar...");
		sprintf(uno, "Trata de");
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
		uint8_t x, y, nAtt = 2*try;
		for(uint8_t i = 0; i < try; i++){
			do x = rand() % 2, y = rand() % 10;
			while(squares[x][y]);
			squares[x][y]++;
			sprintf(uno, "Cuadrito %d", i + 1);
			sprintf(dos, "%d, %d", x, y);
			LCD_wr_lines(uno, dos);
			_delay_ms(wait);
		}
		sprintf(uno, "Tienes %d", nAtt);
		sprintf(dos, "intentos");
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
		while(nAtt--){
			sprintf(uno, "Intento %0d", 2*try - nAtt);
			sprintf(dos, "");
			LCD_wr_lines(uno, dos);
			do t = hastaTeclaWrapper();
			while(t < '0' || t > '9');
			x = t - '0';
			sprintf(uno, "Intento %0d (%d,", 2*try - nAtt, x);
			sprintf(dos, "");
			LCD_wr_lines(uno, dos);
			do t = hastaTeclaWrapper();
			while(t < '0' || t > '9');
			y = t - '0';			
			sprintf(uno, "Intento %0d (%d, %d)", 2*try - nAtt, x, y);
			if(x < 2){
				if(squares[x][y] == 0) sprintf(dos, "Error");
				else if(squares[x][y] == 1) sprintf(dos, "Acierto"), points++, squares[x][y]++;
				else sprintf(dos, "Ya estaba!"), nAtt++;
			}
			else sprintf(dos, "No existe lugar");
			LCD_wr_lines(uno, dos);
			_delay_ms(wait);
			if(points == try){
				sprintf(uno, "Tienes excelente");
				sprintf(dos, "memoria !!!");
				break;
			}
		}
		if(points != try){
			sprintf(uno, "Tu memoria no es");
			sprintf(dos, "tan buena =(");
		}
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
		if(points == try){
			sprintf(uno, "Ganaste!!!");
			sprintf(dos, "Felicidades!");
		}
		else {
			
			sprintf(dos, "Intenta de nuevo");
			sprintf(uno, "Perdiste!!!");
		}
		LCD_wr_lines(uno, dos);
		_delay_ms(wait);
	}
}

void LCD_wr_string(volatile uint8_t *s){
	uint8_t c;
	while((c = *s++)){
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
	LCD_wr_instruction(LCD_Cmd_Func2Lin); //4 Bits, n?mero de l?neas y tipo de letra
	LCD_wr_instruction(LCD_Cmd_Off); //apaga el display
	LCD_wr_instruction(LCD_Cmd_Clear); //limpia el display
	LCD_wr_instruction(LCD_Cmd_ModeDnS); //Entry mode set ID S
	LCD_wr_instruction(LCD_Cmd_OnsCsB); //Enciende el display
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


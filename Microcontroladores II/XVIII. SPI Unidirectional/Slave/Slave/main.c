/*
 * main.c
 *
 * Created: 5/5/2022 12:12:36 PM
 *  Author: david
 */ 

#define F_CPU 8000000
#define isClear(r, i) (!(r & (1 << i)))
#define isSet(r, i) (r & (1 << i))

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
// #include <cstdlib>
#include <time.h>

void SPI_INIT_SLAVE(){
	// MISO como salida, MOSI, SCK y SS como entrada
	DDRB = (1<<6); // MOSI 5  SCK 7  MISO 6 
	// Configurar SPCR (Habilitarlo y ponerlo como esclavo…), si hiciera falta también SPSR (para interrupciones o velocidad).
	SPCR = (1 << SPE) | (0 << MSTR) | (1<< SPR1) | (1<< SPR0); // Enable, Slave, 128 Fosc
	SPDR = 0x00;
}

uint8_t SPI_RECEIVE(){
	// Esperar hasta que el bit SPIF tenga un 1 (o bien hasta que se genere la interrupción).
	while( !( SPSR &  (1<<SPIF)) ){}
	// Leer el valor del SPDR.
	uint8_t data = SPDR;
	SPDR = 0x00;
	return data;
}

void start(){
	
	SPI_INIT_SLAVE();
	
	DDRC = 0xFF;
	PORTC = 0x00;
	
}

int main(void)
{
	start();
    while(1)
    {
        uint8_t data = SPI_RECEIVE();
		PORTC = data;
		_delay_ms(1000);
		PORTC = 0x00;
    }
}
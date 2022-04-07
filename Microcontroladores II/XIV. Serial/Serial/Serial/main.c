/*
 * Serial.c
 *
 * Created: 24/3/2022 15:26:13
 * Author : lalor
 */ 

#include <avr/io.h>
#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>

#define FCPU 4000000//clock speed
#define BAUD 2400 //bps
#define MYUBRR FCPU/16/BAUD-1

int main(void)
{
    /* Replace with your application code */
    while (1) 
    {
    }
}

void USART_Init(uint16_t ubrr){
	DDRD |= 0b00000010; //or por si estabamos usando el puerto D (pin 1: TX, pin0: RX) (lo mismo que DDRD|=(1<<1))

	/* Set baud rate */

	/* Enable receiver and transmitter */
	UCSRB = (1<<RXEN) | (1<<TXEN) | (1<<RXCIE);
	/* Set frame format: 8data, 2stop bit */
	UCSRC = (1<<URSEL) | (1<<USBS) | (3<<UCSZ0);
}

void USART_Transmit(uint8_t data){
	/* Wait for empty transmit buffer */
	while(!( UCSRA & (1<<UDRE) )){}
	
	/* Put data into buffer, sends the data */
	UDR = data;
}

uint8_t USART_Receive(void){
	/* Wait for data to be received */
	while(!(UCSRA & (1<<RXC))){} //traba
		
	/* Get and return received data from buffer */
	return UDR;
}
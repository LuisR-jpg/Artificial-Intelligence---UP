Con interrupciones
    ADMUX =     0b01000111;
    SFIOR =     0b00000000;
    ADCSRA =    0b10011101; //4 MHz, Fdiv = 32 CON INTERRUPCIONES
    DDRx =      0b00000000;
    PORTA =     0b00000000; //ADC doesnt need pull up

    sei();
    while(1){
        ADCSRA |= (1<<ADSC); //le digo que inicie
    }



    ISR(ADC_vect){ //entra aquí solito después de la interrupción
        uint16_t rej = ADC;
        //código después 

    }


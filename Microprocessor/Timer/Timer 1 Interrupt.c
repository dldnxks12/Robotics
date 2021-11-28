#include <avr/io.h>
#include <avr/interrupt.h>

typedef unsigned char byte;

byte cnt, led = 0xEF;

// Timer 1 Interrupt Routine
SIGNAL(SIG_OVERFLOW1){
    TCNT1 = 0xF000;
    led = (led << 1) | 0x01;
    if(led == 0xFF)
        led = 0XEF;
    PORTD = led;
}

int main(void){

    DDRD = 0xF0;
    PORTD = led;

    TIMSK = 0x04;
    TCCR1B = 0x05;
    TCNT1 = 0xF000;

    SREG |= 0x80;
    while(1);

}
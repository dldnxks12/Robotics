#include <avr/io.h>
#include <avr/interrupt.h>

typedef unsigned char byte;

byte cnt, led = 0xEF; // 1110 1111

// 1 clock : 16 Mhz ---> 1024 분주비 => 1clock ==  1 / 1562 s
// 255/1562 s에 한번 ISR 진입
SIGNAL(SIG_OVERFLOW0) // Time 0 Overflow Interrupt
{
    TCNT0 = 0x00;
    if(++cnt >= 10)
    {
        cnt =0;
        led = (led << 1);
        if(led == 0xF0)
            led = 0xEF;
        PORTD = led;
    }
}

int main(void){

    DDRD = 0xF0;
    PORTD = led;

    cli();
    TIMSK = 0x01; // OCIE0 ON
    TCCR0 = 0x07; // 분주비 1024
    TCNT0 = 0;
    SREG |= 0x80;  // Global Interrupt Enable
    sei();


    while(1);
}
// 무한 루프를 도는 중 외부 인터럽트 (스위치 입력)이 들어오면 ISR 진입

#include <avr/io.h>
#include <avr/interrupt.h>

char flag = 0;

// External Interrupt Routine 0
SIGNAL(SIG_INTERRUPT0){

    cli();
    switch(flag)
    {
        case 0:
            PORTB = 0x00;
            flag = 1;
            break

        case 1:
            PORTB = 0xFF;
            flag = 0;
            break
    }
    sei();
}

int main(){

    DDRD = 0x00; // D Port INPUT MODE
    PORTD = 0x00;

    DDRB = 0xFF: // B PORT OUTPUT MODE
    PORTB = 0xFF;

    cli();

    EICRA = 0x03; // External Interrupt On Falling Egde or Rising Edge
    EICRB = 0x00;

    EIMSK = 0x01; // External Interrupt 0 ~ 7 Enable

    sei();

    while(1);

    return 0;
}
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/signal.h>

SIGNAL(SIG_ADC){
    OCR3AH = (ADCW >> 8); // AD 변환된 16 bit ㅔ이터 중에서 상위 8 bit만 추출
    OCR3AL = (ADCW & 0xFF); // AD 변환된 16 bit ㅔ이터 중에서 하위 8 bit만 추출
}

int main(){

    char i =0;
    TCCR3A = 0x82;
    TCCR3B = 0x1B;

    TCNT3H = 0x00;
    TCNT3L = 0x00;

    ICR3H = (1023 >> 8);
    TCR3L = 1023 & 0xFF;

    ADCSRA = 0x8F;
    DDRE = 0x08;
    SREG |= 0x80;

    do{
        ADMUX = 0x01; // AD 입력채널 1
        ADCSRA |= 0x40; // 변환 시작
        for(i=0; i<10; i++)
        {
            _delay_ms(10);
        }
    }while(1)
}
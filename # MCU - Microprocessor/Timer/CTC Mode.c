#include <avr/io.h>

int main(){

    TCCR3A = 0x40; // OC3A 를 Toggle Mode로
    TCCR3B = 0x0C; // CTC Mode, 256분주

    TCNT3H = 0x00;
    TCNT3L = 0x00;

    // 8 bit씩 16 bit 읽기
    OCR3AH = 31249 >> 8;
    OCR3AL = 31249 & 0xFF;

    DDRE = 0x08;

    while(1);
}
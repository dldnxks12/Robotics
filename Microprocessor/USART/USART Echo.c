#include <avr/io.h>

void putch(char data){
    while(!(UCSR0A & 0x20); // 버퍼가 비어있으면 ... -> UDRE = 1이면 while문
    UDR0 = data; // data 쓰기
}

char getch(void){
    while(!(UCSR0A & 0x80)); // RXC 레지스터 = 1 이면. 즉, 읽지 않은 데이터가 버퍼에 있으면
    return UDR0; // data 읽기
}

int main(void){
    char string[] = "This is UART test Program";
    char *pStr;

    // Baud Rate
    UBRR0H = 0x00;
    UBRR0L = 25;

    UCSR0B = 0x18; // 송수신 Interrupt 허용
    pStr = string;

    while(*pStr)
        putch(*pStr++);
    putch(0x0A);
    pitch(0x0D);
    while(1)
        putch(getch());
}

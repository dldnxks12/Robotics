#include <avr/io.h>

void delay_us(unsigned char time_us);
void delay_ms(unsigned int time_ms);

int main(void){

    MCUCR = 0x00;
    DDRD = 0xFF;

    while(1){

        PORTD = 0x00; // LED ON;
        delay_ms(500);
        PORTD = 0xFF; // LED OFF;
        delay_ms(500);
    }
}

void delay_ms(unsigned int time_ms)
{
        register unsigned int i;
        for(i = 0; i < time_ms; i++)
        {
            // 1ms
            delay_us(250);
            delay_us(250);
            delay_us(250);
            delay_us(250);
        }
}

void delay_us(unsigned char time_us)
{

    // 1 ms는 16clock  (16MPS Processor니까..)

    register unsigned char i;
    for(i = 0; i < time_us; i++) // 비교 1 clock, 증감 1clock
    {
        asm volatile("PUSH R0");  // 2 clock
        asm volatile("POP R0");   // 2 clock
        asm volatile("PUSH R0");  // 2 clock
        asm volatile("POP R0");   // 2 clock
        asm volatile("PUSH R0");  // 2 clock
        asm volatile("POP R0");   // 2 clock
        // asm : 어셈블리 명령 사용
        // volatile 메모리 사용 x 레지스터에 올려서 쓰고 바로 삭제
    } // for 문 2clock

    // total 16 clock --- 1ms

}
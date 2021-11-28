#include <avr/io.h>
#include <avr/delay.h>

int main(void){

    char i, j, led; // Port 크기 8 bit -- char type 사용
    DDRD = 0xF0; // 1111 0000 : 상위 4 비트만 Output Mode

    do{
            led = 0xEF; // 1110 1111 : LED 1개만 ON
            for (i = 0; i < 3; i++)
            {
                PORTD = led;
                led = (led << 1); // LED 한 비트씩 왼쪽으로 이동
                for (j = 0; j < 20; j++)
                {
                        _delay_ms(10);
                }
            }

            led = 0x7F; // 0111 1111

            for (i = 0; i < 3; i++)
            {

                PORTD = led;
                led = (led >> 1) | 0x80;  // 오른쪽으로 한 비트씩 이동 + 최상위 비트 Always OFF
                for (j = 0; j < 20; j++)
                {
                        _delay_ms(10);
                }

            }
    }while(1)
}

// LED On-Off with Switch at PB1

// PIN B1에 Switch를 달아서 LED 제어

#include <avr/io.h>

unsigned char In;

int main(void){

    MCUCR = 0x00;
    DDRD = 0xFF; // D PORT Output Mode ---- PORT D가 모두 VCC에 연결되있고, 0V 입력을 주면 동작
    DDRB = 0x00; // B PORT Input Mode ----- PORT B가 모두 GND에 연결되있고, 5V 입력을 주면 동작


    while(1){

        In = PINB & 0x02; // 0x0000 0010 --- PINB와 하위 2번 째 Bit랑 AND --- 해당 bit만 살림

        if(In = 0x02)
            PORTD = 0xFF; // LED OFF
        else
            PORTD = 0x00;
    }

}

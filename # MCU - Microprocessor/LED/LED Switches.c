#include <avr/io.h>
#include <avr/delay.h>

typedef unsigned char byte; // 8 bit

byte i, led;

void delay_200ms(){
    byte k;
    for(k = 0; k < 20; k ++)
        _delay_ms(10);
}

void right(){
    led = 0xEF; // 1110 1111
    for(i=0;i<4;i++)
    {
        PORTD = led;
        led = (led << 1);
        delay_200ms();
    }
}

void left(){
    led = 0x7F; // 0111 1111
    for(i=0;i<4;i++)
    {
        PORTD = led;
        led = (led >> 1) | 0x80;
        delay_200ms();
    }
}

void up(){

    led = 0xE0;
    for(i=0;i<4;i++)
    {
        PORTD = led;
        led = (led << 1);
        delay_200ms();
    }
}

void down(){

    led = 0x7F;
    for(i=0;i<4;i++)
    {
        PORTD = led;
        led = (led >> 1);
        delay_200ms();
    }
}

void blink(){

    PORTD = 0x00;
    delay_200ms();
    PORTD = 0xFF;
    delay_200ms()
}

int main(void){

    byte sw; // Switch

    DDRD = 0xF0;
    DDRE = 0x00;

    PORTE = 0xF0;

    do{
        sw = PINE & 0xF0;

        switch(sw)
        {
            case 0xE0:
                right();
                break
            case 0xD0:
                left();
                break
            case 0xB0;
                up();
                break
            case 0x70:
                down();
                break
            default:
                blink();
        }
    }while(1)
}

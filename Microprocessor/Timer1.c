#include <avr/io.h>
#include <avr/interrupt.h>

unsigned char led_flag;
unsigned char data = 0x80;
unsigned char j = 1;

void LED_Blink(void);

//  16 bit TIMER 1 사용
// Timer Overflow Flag 뜨면 해당 ISR로 진입
SIGNAL(SIG_OVERFLOW1) // ISR --- 0.088576 s 마다 한 번씩 진입
{
        led_flag = 1;
        TCNT1 = 60000;
}

int main(void){

    cli(); // SREG 7 bit Disable
    MCUCR = 0x00;
    DDRD = 0xFF; // D PORT Output Mode

    // TCCR Register Set
    TCCR1A = 0x00; // Normal Count , OC Disconnected
    TCCR1B = (1 << CS12); // 256 분주
    TCCR1C = 0x00;

    // Flag Register Set
    TIFR = 0x00;
    ETIFR = 0x00;

    TCNT1 = 60000; // Timer Counter Value 60000으로 Set

    // 65535 - 60000 = 5535 + 1 번 Count 하면 Overflow 발생 -> TOV Flag Set
    //  1 clock 주기 : 16MHZ의 256 분주 = 62.5KHz = 1/62500 초 마다 1 Clock
    // 5536 x 1/6255 s = 0.088576 마다 한 번씩 ISR 발생

    TIMSK = (1 << TOIE1); // Timer Overflow Interrupt Enable
    ETIMSK = 0x00;

    sei(); // SREG 7 bit Enable;


    // Main Loop

    while(1)
    {
        LED_Blink();
    }
}

void LED_Blink(void){

    if(leg_flag = 1)
    {
        led_flag = 0;
        if(j < 4)
        {
            PORTD = ~(data);
            data >> 1;
            j++;
        }
        else if(j < 7)
        {
            PORTD = ~(data);
            data << 1;
            j++;
            if(j == 7)
                j = 1;
        }
    }
}

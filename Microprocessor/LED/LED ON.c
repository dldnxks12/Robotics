#include <avr/io.h>

int main(void)
{

    MCUCR = 0x00; // MCU Control Register --- External Memory X

    DDRD = 0xFF; // All D Port Output Mode

    while(1)
    {
        PORTD = 0x00; // LED ON

        // MCU 내부 VCC에서 출력 모드이므로 PIN이 0으로 떨어져야 전류가 흐른다.
    }
}
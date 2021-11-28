### PWM

Timer의 TCCR에서 WGM으로 설정가능 

1. Fast PWM 
2. PC PWM
3. PFC PWM


- Fast PWM 


    0 ~ Max 까지 Counting하며 OCR 값을 만나면 OC Value 출력
    
    TCNT 값은 단순 증가 , OCR Value는 Bottom에서 Update

    Pulse Width Modulation 가능 

- PC PWM


    Up counting하며 만날 때, Down counting하며 만날 때 OC Pin 출력 변경
    
        OCR 값을 Top에서 Update

- PFC PWM 


    Up counting하며 만날 때, Down counting하며 만날 때 OC Pin 출력 변경

        OCR 값을 Bottom에서 Update
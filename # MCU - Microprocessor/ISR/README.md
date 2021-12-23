### Interrupt Service Routine

제어할 시, ISR로 Sampling Time을 생성 

        EX) 1ms 마다 모터를 제어 == 1ms 마다 ISR 수행 


- ISR in Motor Control

      ISR은 항상 똑같은 Sampling Time을 가져야한다.

       ISR에서 HW제어를 먼저하고 계산은 그 다음에 한다.
            (HW 제어 시간은 항상 똑같아야 하기 때문)


- ISR

      ISR Start

      1. Encoder 읽기 (얼마나 돌았나?)
      2. D/A or A/D Access
      3. 목표 값 계산 (현재 값이랑 목표값 비교해서 Error 계산)
      4. Controller / Filtering (입력 : 위치 , 속도, 가속도 에러. 출력 : 제어 출력)
  
      ISR End


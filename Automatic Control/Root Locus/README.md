## Root Locus for System Stability Check

Root Locus는 시스템의 TF를 알 때 사용할 수 있는 안정성 확인 방법이다.

`Root Locus` : 시스템 TF의 CE를 1+KL(s) 형태로 바꾸고 K에 따라 발생할 수 있는 모든 Pole을 싹다 그리는 방법

<br>

<br>

- Drawing `Root Locus`

            1. 궤적의 시작과 끝, 발산 Branch 파악
            2. Real axis 위의 Pole
            3. 발산 각과 무게중심
            4. branch의 시작 각도, 종료 각도
            5. 중근 
            6. K Value Crossing Imaginary Axis 

![image](https://user-images.githubusercontent.com/59076451/133105563-8604a0ea-ef3d-414a-96d2-710b3663fc51.png)

![image](https://user-images.githubusercontent.com/59076451/133106019-d54c560d-cae4-4efb-985a-658f85e15adf.png)

<br>

- `Lead Compensator / Lag Compensator`

`Lead Compensator` 

    Transient Response 개선 - PD 제어

`Lag Compensator`

    Steady State Response 개선 - PI 제어
    
![image](https://user-images.githubusercontent.com/59076451/133106238-16834788-02db-483a-9ab6-41bad428ee3e.png)
    


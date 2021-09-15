### Automatic Emergency Braking (AEB)

- List 

        1. AEB
        2. Sensors for AEB
        3. Derivation of AEB


<br>


#### `AEB`

- `AEB  (자동 긴급 제동 시스템)`

        1. Rader를 통해 반사체 감지 
        2. Camera를 이용해 반사체의 형상 분석 
        3. Lidar를 통해 거리 센싱
        4. TTC를 이용한 제동 

<br>

#### `Sensors for AEB`

1. `Camera`

        RGB - D Camera : Color + Depth  
        Stereo Camera  : 2 Camera , Depth  
        Monocular Camera : 1 Camera Depth with Deep Learning    

2. `Rader`

3. `Ultra Sonic`
       
4. `Lidar`

        2D Lidar
        3D Lidar : 2D Lidar를 회전시키거나, 2D Lidar를 쌓아서 구성 
        Solid-state Lidar : 회전 x 작은 Field of View
        
<br>        
        
#### `Derivation of AEB`        
               
`L2 Distance`를 기준으로 차량의 제동을 수행하기엔 무리가 있다. 

        L2 Distance 기준의 제동은 다음과 같은 장단점이 있다.
        
            장점 : 연산이 편하며, 거리만 정확하게 재면 된다.
            단점 : 속도를 고려하지 않는다. FN, FP의 확률이 높다.

따라서 `TTC`를 기준으로 차량 제동을 수행한다.

<br>

- `TTC(Time to Collision)`

    내 차량과 다른 물체가 현재의 방향과 속도를 유지할 때, 서로 부딪히기 까지의 시간이다.
    
<div align=center>
    
![image](https://user-images.githubusercontent.com/59076451/133386746-dffbac43-f638-473b-bc9a-5126a2150f97.png)

`물체와의 간격이 늘어나면 TTC는 무한대의 값을 갖는다.`
    
</div>    

<br>

- `How to Compute Range-rate`

<div align=center>
    
![image](https://user-images.githubusercontent.com/59076451/133387172-327d0c57-9873-4e9b-a3c8-37c48925395d.png)

`Range-rate는 현재 내 속도와 물체와의 각도의 cos으로 구할 수 있다.`    
    
</div>    

<br>


- `How to Use TTC`

TTC를 사용하는 기준은 `T = min TTC`이다.

만일 주변에 5개의 물체가 있어, TTC1, TTC2, TTC3, TTC4, TTC5를 계산해내었다고 하자.

`제동의 기준치가 3 초 였을 때, 위의 5가지 물체 중 가장 작은 TTC가 2초라면 제동을 수행하는 방식이다.`

    
    

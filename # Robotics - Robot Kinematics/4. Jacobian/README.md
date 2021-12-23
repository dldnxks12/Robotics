## Jacobian

`정지된 상태가 아니라 움직이는 End-Effector를 표현하는 방법`

    Robot이 더이상 Static하지 않다.
    
    Rigid body의 속도와 각속도를 알아보고, 이를 이용해서 Robot의 움직임을 살펴볼 수 있다.
    
            End-Effector의 속도는 점의 속성, 각속도는 몸체의 속성이다.

<br>

`Jacobian`의 용도

    1. End-Effector의 속도와 가속도가 주어졌을 때, Joint 변수들의 변화는 어떤가?
    2. End-Effector에 힘이 가해질 때, 이를 버텨내기 위해 필요한 힘은?
    
<div align=center>    
  
![image](https://user-images.githubusercontent.com/59076451/133144531-5307ba7e-892f-44a3-8508-12adda8a0ba9.png)
  
</div>  


<br>

- List

            1. Velocity, Angular Velocity
            2. Linear Velocity, Angular Velocity of Object
            3. Representation on Robot
            4. Jacobian 


<br>

`Static한 상황`에서의 End-Effector에서 나아가 `움직이는 상황`을 생각해본다.

        가속도와 각가속도에 대해서는 추후 로봇 제어에서 다룬다.
        
<br>

<br>

#### `Velocity, Angular Velocity`

Chapter 2에서 다뤘던 위치와 방향에 대한 미분은 다음과 같은 Notation으로 사용한다.

<div align=center>
    
![image](https://user-images.githubusercontent.com/59076451/133607342-321efd02-c503-404b-bc33-b000f1bb0bc0.png)
    
</div>    

<br>

<br>

#### `Linear Velocity, Lotational Velocity, Angular Velocity `
                
<br>        

- `Linear Velocity`

Mapping의 개념으로 공간 상의 물체의 위치와 방향을 나타내는 것을 잘 기억해야한다.

`Linear Velocity`는 물체가 Trasient 운동을 할 때의 속도이다. 따라서 `Rotation Matrix`는 Constant이다.

        속도가 분해된 Frame과 표현되는 Frame에 대해 잘 이해해야 한다.
        
        속도는 점의 속성이므로 기준 Frame에 대해서 물체에 붙어있는 Frame의 원점이 멀어지는 속도로 생각할 수 있다.   
    
<br>  

- `Angular Velocity`

동일하게 Mapping의 개념으로 공간 상의 물체의 위치와 방향을 나타낸다.

여기서 `Rotation Matrix`는 더이상 상수가 아니며, `Rotation Matrix`에 대해 벡터 미분을 수행한다.

<div align=center>    

![image](https://user-images.githubusercontent.com/59076451/133607040-b88c4c1d-6cce-4426-a5a5-1e1567ceeec2.png)
    
`Rotation Matrix`는 SO(3) Group Matrix이다. 따라서 `전치행렬이 역행렬과 같다.` 
    
여기서 `의문의 Term`이 생기며, 뒤에서 알아보겠지만 이는 `각속도 행렬의 Skew-Matrix`이다.
    
</div>            

<br>  


`Angular Velocity` 또는 `Angular Matrix`의 방향 : {A}에 대해 회전하는 {B}의 순간 회전축 - Instantaneous Axis  
`Angular Velocity` 또는 `Angular Matrix`의 크기 : {A}에 대해 회전하는 {B}의 회전 속도 


<br>

<br>

#### `Representation on Robot`

이제 Frame을 로봇에 붙여 각 Link의 속도와 각속도를, 그리고 결국엔 End-Effector의 속도, 각속도를 표현할 수 있다.

기본적으로 Mapping 개념을 미분한 속도 방정식은 다음과 같고, 이를 Robot위의 Frame 관계로 표현하면 다음과 같다. 

<div align=center>

![image](https://user-images.githubusercontent.com/59076451/133607850-e9bc3e22-de2d-4c63-8390-5a34ca90847a.png)

</div>


<br>

<br>

#### `More on Angular Velocity`

<br>

각속도는 로드리게스 Axis 방법, 오일러 방법으로 구할 수 있다.

이 둘의 차이는 Chapter 2에서 살펴본 바와 같이 `Premultiply와 Postmultiply`의 차이이다. 

<div align=center>
    
`로드리게스`
    
![image](https://user-images.githubusercontent.com/59076451/133608252-90d7f914-f2f7-49fd-833b-a83892b341a5.png)
   
<br>
    
`오일러`    
    
![image](https://user-images.githubusercontent.com/59076451/133608314-c5ed2c53-f328-4114-ac08-decfb5324d95.png)
    
    
</div>    

        


        



    

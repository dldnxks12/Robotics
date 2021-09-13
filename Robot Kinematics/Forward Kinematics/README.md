### Forward Kinematics

`Robot의 각 Link(Body)에 좌표계를 달고, 이를 통해 한 로봇의 모든 위치와 방향을 정의할 수 있다.`

- List

      1. Joint Variable
      2. DH-Parameter

<br>

`summary before start `

    1. Joing Variable을 통해 각 Link를 정의한다.
    
    2. 각 Link에 좌표계를 정의하고, 좌표계 간의 관계를 통해 Link 간의 상대적인 위치와 방향을 정의한다.
    

---

<br>

<br>    


#### `Joint Variable`

1개의 Link 내에서 정의되는 변수 
      
      Link Length : Link의 두 개의 Axis 사이의 수직 거리
      Link Twist  : 두 Axis가 이루는 각도
      
2개의 Link 사이에서 정의되는 변수
      
      Link offset : 각 Link의 서로 수직인 두 직선이 Common Axis와 만나는 점 사이의 거리
      Joint Angle : 각 Link의 서로 수직인 두 직선이 이루는 각도 
      
      
![image](https://user-images.githubusercontent.com/59076451/133093112-78b52429-e96f-4daa-8da8-6576d3efe664.png)


주의할 것은 `0번 째와 마지막 Link`이다.

각 Link는 다른 축과 결합하고 있기에 축을 2개씩 가지고 있다.

하지만 0번 째와 마지막 Link는 축이 1개만 존재한다. 

따라서 위 두 가지 경우는 `축을 겹친다.`

    a = 0 
    α = 0
    
    if Link 1 == Prismatic Joint : Joint Variable = 0    
    if Link 1 == Revolute Joint  : Link offset = 0 
    
    
![image](https://user-images.githubusercontent.com/59076451/133093578-f6094d5d-6d59-4a0e-83f2-e1589dc2b71f.png)


---

<br>

<br>


#### `DH Parameter`

우리는 결국 로봇의 각 몸체의 상대적인 위치와 방향을 알고 싶다. 이제 각 Link의 좌표계를 붙이자.

    구체적으로 우리가 많이 해볼 것은 Ground Link에서 Tool Link의 위치와 방향을 알아내는 것이다.
    

`Z axis` : 각 Link의 Axis 방향으로 설정 <br>
`X axis` : Link Length의 방향으로 설정  
`Y axis` : Z x X 로 설정

    if Link Length == 0 
    
        then Zi-1 과 Zi의 외적이 이루는 방향으로 X 설정

![image](https://user-images.githubusercontent.com/59076451/133094452-193411d7-c96b-487a-9319-1173c4d8ccb8.png)


<br>

<br>


이제 각 Link의 상대적인 위치와 방향을 나타내는 방법을 알아보자.

이는 Homogeneous Matrix Form을 이용한다. `Compound Arithmatic`과 `Inverse Transformation`을 사용한다.
      
    회전하고 밀고, 회전하고 밀고!      


![image](https://user-images.githubusercontent.com/59076451/133094887-b3fdaa71-311c-4e76-abed-d4c8ae971120.png)

    
    



 

    
    
    





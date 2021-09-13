### 위치와 방향 

`Object에 좌표계를 붙이고, 이를 이용하여 위치와 방향을 정의할 수 있다.`

- List

      1. Position and Orientation
      2. Mapping and Operating
      3. Homogeneous Matrix
          - Compound Arithmatic
          - Inverse Transformation

      4. More on Orientataion   


<br>

<br>

<div align=center>

`결국 우리가 할 것은 기준 좌표계에서 바라본 어떤 물체의 위치와 방향을 찾는 것이다.`  
  
![image](https://user-images.githubusercontent.com/59076451/133087266-dfd65526-df41-41b7-8fd9-f3a5e10ca208.png)


</div>

---  

<br>  
  
<br>  
  
- `Position and Orientation  `

![image](https://user-images.githubusercontent.com/59076451/133087150-80bac398-c069-460a-9691-1980b89e3849.png)

<br>

원점이 일치하는 상태에서 A 좌표계의 `한 벡터의 위치`를 나타내는 방법과, A 좌표계에서 본 `B 좌표계의 방향`을 나타내는 방법은 위와 같다.

또한 `좌표계를 나타내는 방법`도 적혀있다. 

      Frame B : { Rotataion Matrix, Position Vector}

<br>

여기서 중요한 것은 방향을 의미하는 `Rotation Matrix`이다.

    Rotataion Matrix

    1. B 좌표계의 각 축의 벡터가 A 좌표계의 축 벡터와 이루는 각과 크기를 이용해서 구할 수 있다.
    2. A 좌표계의 각 축을 순차적으로 회전시켜 B좌표계를 만들 수 있다. (고정 축 방법 or 오일러 방법 사용)
    
    
---

<br>

<br>

- `Mapping and Operating`

`Mapping`: 관측자의 변경 (표현 좌표계의 변경) <br>
`Operating` : 벡터 변경 (표현 좌표계 유지)

    돌리고 엉댕이 밀고 

![image](https://user-images.githubusercontent.com/59076451/133089170-724188d5-0188-4ca7-96da-da2eb711509a.png)

---

<br>

<br>

- `Homogeneous Matrix`

위의 식들을 `Homogeneous Matrix` 형태로 표현하기도 한다.

    간단하게 표현할 수 있기 때문에 사용. 실제 계산은 풀어서 수행
    
![image](https://user-images.githubusercontent.com/59076451/133089373-b2b1aed6-8d08-40f4-8362-2a1059b6a698.png)
    
<br>

<br>

`Rotation Matrix`과 `Homogeneous Matrix`의 차이는 다음과 같이 정리하면 된다.

![image](https://user-images.githubusercontent.com/59076451/133089550-e6033875-47c2-4649-9184-727eec4dc0d5.png)

<br>

<br>


이후 `Forward Backward Kinematics`에서 Robot Link에 좌표를 설정하고 수식을 계산할 때 다음과 같은 성질을 이용한다.


    아래 두 가지 모두 Homogeneous Matrix로 이루어져 있다.
    
    1. Compound Arithmatic
    2. Inverse Transformation

![image](https://user-images.githubusercontent.com/59076451/133089836-d22c7a1a-21fb-46bf-a6dc-daae16483b48.png)

<br>

위 두 가지 성질은 굉장히 유용하게 사용되므로 잘 알아두자.

---

<br>

<br>

- `More On Orientation`

Rotation Matrix를 구하는 두 가지 방법 중 두 번째 방법 

1. `Fixed Axis` : 고정된 X, Y, Z 축에 대해서 a, b, c 도 씩 회전해서 만들어지는 좌표계

      - Pre-Multiply

2. `Eular Angle` : X 축에 대해 회전해서 만들어지는 좌표계의 Y' 축에 대해서 회전, 그리고 그로 인해 만들어지는 Z'' 축에 대해 회전 

      - Post Multiply


![image](https://user-images.githubusercontent.com/59076451/133090568-cf609720-2042-4349-a421-3d728e399cda.png)


3. `로드리게스 Form` : R_k(a)

위의 두 방법은 모두 순차적인 방법으로 X, Y, Z에 대해서 회전해서 좌표계를 만들었다.

로드리게스 Form은 하나의 축을 회전시켜 해당 좌표계를 만들어내는 방법이다. 

![image](https://user-images.githubusercontent.com/59076451/133090824-614a309d-3ba4-4d14-814e-4f2308626384.png)


    
    
    


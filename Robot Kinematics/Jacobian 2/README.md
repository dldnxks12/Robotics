### Jacobian

    공간 상의 물체의 속도와 각속도를 정의하고, Link의 상대적인 속도, 각속도를 표현하는 방법을 이해했다.
    
    이제 이를 이용해서 0번 째 Link에서 N번 째 Link의 속도와 각속도를 표현하는 방법을 정리해보자.
    
    그리고 이 과정에서 Jacobian이 어떤 의미를 갖는 지도 이해하자.
    
<br>    

- List

      1. Velocity , Angular Velocity Propagation   
      2. Jacobian
      3. Static Forces

---

<br>    

<br>    

#### `Velocity , Angular Velocity Propagation`

이 방법은 Step by Step으로 `우리가 원하는 Link의 속도 각속도를 찾는 방법이다.`

`한마디로 하면 i 번째 정보로 i+1 번째 정보를 얻는 방법이다.`

    1. Link 1 에서 본 Link 2 의 속도, 가속도.
    2. Link 0 에서 본 Link 1 의 속도, 가속도.
    3. 위 두 가지 정보를 이용해서 Link 0 에서 본 Link 2 의 속도, 가속도를 구한다.

<div align=center>
  
![image](https://user-images.githubusercontent.com/59076451/133618940-d12bedba-adad-4b6c-877b-1a7e40eb23ea.png)
  
</div>  

<br>

- `Angular Velocity Propagation`

Link i+1 의 각속도는 Link i의 각속도에 i+1번째 joint에 의해 생긴 새 Component들을 더하면 된다.    
`Vector 연산은 같은 Frame에 표현된 Vector끼리 수행해야 한다.`

우선 Link i+1의 Joint 종류에 따라 2가지 경우로 나누어 생각한다.

    1. Revolute Joint 2. Prismatic Joint

<br>

`1. Revolute Joint `

Revolute Joint 의 경우는 다음과 같이 생각하자. 

Link i가 도는 속도에 i+1이 도는 속도를 더해주면 된다. 

<div align=center>

![image](https://user-images.githubusercontent.com/59076451/133619251-b6b6e4cb-18ba-4c46-a4aa-5577dda1eb4f.png)
  
이제 이를 Link i+1에 대해 표현하면 다음과 같다.
  
![image](https://user-images.githubusercontent.com/59076451/133619224-faa3dbc2-53c8-4b10-bad0-35cf75f8ce04.png)
  
조금 더 간단히  
  
![image](https://user-images.githubusercontent.com/59076451/133619317-07e8b7a0-448c-4e69-bd46-78401b714f27.png)
  
</div>  

<br>

`2. Prismatic Joint `

이 경우는 Link i+1가 Link i에 대해 회전하지 않기 떄문에 상대속도는 0이다. 따라서 표현 Frame만 바꿔주면 된다.

<div align=center>
  
![image](https://user-images.githubusercontent.com/59076451/133619386-7f0da91f-67c1-4f39-b57e-bd4a7dfdfac8.png)
  
</div>  

<br>

- `Linear Veloicity Propagation`

각속도와 동일하게 기준 Link(좌표계)에 대해서 변화하는 만큼만 더해주면 된다. 

    즉, Link i+1가 Link i에 대해서 병진하고 회전하면서 생기는 Component 만큼 더해준다.

<br>

1. `Revolute Joint`

Link i+1가 `Revolute Joint`일 떄, 병진 운동에 의한 변화는 없다. 따라서 수식은 다음과 같다. 

<div align=center>
  
![image](https://user-images.githubusercontent.com/59076451/133620539-066018f1-7c5b-4f8f-b8e4-1f807a24b97d.png)

이를 Link i+1에 대해 표현하면 ..

![image](https://user-images.githubusercontent.com/59076451/133620489-094a01f0-f184-48db-8acd-0737b906c5d2.png)
  
</div>  
          
<br>          

2. `Prismatic Joint`

`Prismatic Joint`일 때는 회전 운동과 병진 운동 두 가지 모두 고려해주어야한다.

회전 운동이 외적에 의해 발생하기에 속도 변화에 영향을 미치기 때문이다.

<div align=center>
  
사실 다음 수식은 우리가 이미 정리해두었던 Link에서의 속도, 각속도 표현에서 가장 뒷 Term만 바꾼 것이다.
  
![image](https://user-images.githubusercontent.com/59076451/133620938-a99cd5df-9568-4657-ac93-1bed838cd4e1.png)
 
Link i+1에 대해 표현..
  
![image](https://user-images.githubusercontent.com/59076451/133620970-1c317939-3655-482f-a71a-9d65baa9dca0.png)
     
</div>  

<br>

`따라서 위와 같은 방법으로 우리는 Link 0 에서 Link N의 속도와 각속도를 표현하거나 알아낼 수 있다.`

---

<br>

<br>

#### `Jacobian`

먼저 미분에서의 독립변수와 종속변수의 의미에 대해 생각해보자.

- `1변수`

![image](https://user-images.githubusercontent.com/59076451/133627940-1bfdb1f0-e802-4fee-a30c-67d3304c4b1f.png)

<br>

- `다변수`

![image](https://user-images.githubusercontent.com/59076451/133627965-5e34d9fb-8d9b-45a6-9d14-bb9283e8833e.png)

![image](https://user-images.githubusercontent.com/59076451/133628060-69962439-a1d3-44ff-ad9d-fb991c02bf80.png)


<br>

정리하자면 `Jacobian`은 다음과 같이 정리할 수 있다. 

        1. 다변수 함수의 편미분 행렬이다.
        2. 독립변수에 대한 종속변수의 변화율 행렬이다.


- `Cartesian Vel , Joint Vel`

![image](https://user-images.githubusercontent.com/59076451/133632396-b2552d53-d615-466d-a4a0-ef53664e6109.png)


---

<br>

<br>

#### `Static Forces`

![image](https://user-images.githubusercontent.com/59076451/133632514-009bdeeb-51bf-4c66-8fbb-7d59c30171f5.png)

우리가 위에서 구한 Jacobian이 어떤식으로 다음 변수들을 관계시키는 지 이해해야한다.

    1. End-Effector의 속도 가속도 = (Jacobian) Joint Rate

    2. End-Effector의 토크 = (Jacobian_transpose) (Forces and Moments)

![image](https://user-images.githubusercontent.com/59076451/133632533-987b69e9-0818-43bb-a4fe-ec694b526f49.png)










    
    
    

## Backward Kinematics

`역위치해석` 

<br>

`Forward Kinematics (Forward Position Analysis)`   : Joint 변수들을 주고, 로봇의 위치와 방향 구하기 <br>
`Backward Kinematics (Backward Position Analysis)` : 로봇의 위치와 방향을 가지고 Joint 변수들 구하기 

<br>

- List 

      1. Solution의 존재 
      2. Inverse Position Analysis

---

<br>

<br>

`Forward Kinematics`에서 T의 결과를 살펴보니 `위치 벡터 Px, Py, Pz는 θ4, θ5, θ6와는 무관`했다. <br>
(6개의 Revolute joint and Intersect at Ankle Robot의 경우)

<br>

`Backward Kinematics Process`    

      Puma 560과 같이 6개의 Revolute joint and Intersect at Ankle Robot의 경우

                  1. 위치 성분을 이용해서 θ1, θ2, θ3을 먼저 찾는다.
                  2. 방향 성분을 이용해서 θ4, θ5, θ6을 찾는다.

![image](https://user-images.githubusercontent.com/59076451/133143050-bc4b808a-9966-4075-9bb6-06c64ab038b4.png)

---

<br>

<br>

#### `Solution의 존재`

`Work Space` : End-Effector가 닿는 거리

`Reacheable Space` : End-Effector가 적어도 1개의 방향에서 닿을 수 있는 거리

`Dexturous Space` : End-Effector가 모든 방향에서 닿을 수 있는 거리 

<br>

`주어진 End-Effector의 위치와 방향에 대해서 모든 Joint 변수들을 구할 수 있다면, 해당 Manipulator는 Solvable하다.`

---

<br>

<br>

#### `Inverse Position Analysis`

`Method of Solution`

- Method 1 : `Closed Form `

`Closed Form`은 공식이 존재한다. (Iterative 방법 x)

            A) 대수적 방법
            B) 기하학적 방법

<br>

- Method 2 : `Numerical Form `

`Numerical Form`은 공식이 존재하지 않는다. 다만 Iterative하게 수행하며 점점 해답을 찾아나가는 방법이다.

<br>

`Series 형태의 Revolute, Prismatic Joint로만 이루어진 6DOF Robot은 모두 Solvable 하다.`

일반적으로는 Method 2를 사용하지만, 특별히 `3개의 이웃한 Axis가 1개 점에서 교차`하면 Closed Form을 사용할 수 있다.

<br>

![image](https://user-images.githubusercontent.com/59076451/133143930-94b8c371-f872-4d37-914d-91b243be2926.png)


                  1. 위치 성분을 이용해서 θ1, θ2, θ3을 먼저 찾는다.
                  2. 방향 성분을 이용해서 θ4, θ5, θ6을 찾는다.


![image](https://user-images.githubusercontent.com/59076451/133144094-e4e9fec9-e7e6-496d-9417-c9fcbb3acc37.png)




           










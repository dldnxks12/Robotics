#### Pratice DC Motor Modeling with Simulink 

- `DC Motor Block Diagram`

![image](https://user-images.githubusercontent.com/59076451/133050799-ec12845b-7f0b-47b8-b94b-c4d861d84e23.png)


`Actual DC Motor Example Block Diagram`

![image](https://user-images.githubusercontent.com/59076451/133053833-cb47fd8b-9e12-45df-b8d5-f27968e80c68.png)


<br>

<br>

- `DC Motor Parameter Value`

![image](https://user-images.githubusercontent.com/59076451/133050890-1136b579-30b9-4926-93b9-cb99b73bcde2.png)

<br>

Datasheet에서의 단위를 그대로 사용하면 안되고, 기본 단위로 변경해서 사용해야한다.

![image](https://user-images.githubusercontent.com/59076451/133051033-37922902-8925-4fb3-acf1-6143866148f7.png)

<br>

<br>

- `마찰 계수 b`

`마찰 계수 b`는 DC Motor Datasheet에서 제공해주지 않는다. 

    간단한 기계 시정수를 이용해서 구할 수 있다. 

![image](https://user-images.githubusercontent.com/59076451/133050991-9dd7d3c7-a04d-4637-a891-75b4db318eaf.png)

`기계적 시정수`

    Steady State Value의 약 63%에 도달하기 까지 걸리는 시간 (second)

<br>

<br>


#### `Result`


`Output Value of Circuit Eqn (Current)` && `Output Value of Mechanical Eqn (Angular Velocity)`

![image](https://user-images.githubusercontent.com/59076451/133053341-a5d2e137-5283-41f5-a589-5462509733cb.png)


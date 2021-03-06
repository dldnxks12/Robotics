### `About BLDC Motor`

- 브러쉬가 없는 DC Motor
- BLDC Motor의 회전자는 영구자석, 그리고 고정자는 코일이다. (DC Motor와는 반대)

---

<br>

- `회전자(로터)`

회전자는 영구자석이다.

![img.png](img.png)

<br>

- `고정자(Stator)`

고정자는 코일이 감겨져있다.

![img_1.png](img_1.png)

<br>

코일은 다음과 같이 하나의 쌍을 이루고 있고, 전류를 흘려주게 되면 같은 쌍의 코일에 전류가 흐른다.

![img_2.png](img_2.png)


<br>

이때 코일에 DC 전류를 넣어주면 해당 코일에 자기장이 형성된다. `즉, N극과 S극이 생긴다.`  

![img_3.png](img_3.png)

<br>

- `BLDC의 동작`

BLDC는 `회전자의 영구자석` 과 `고정자의 전자석` 과의 인력, 척력으로 동작한다!   

![img_4.png](img_4.png)

A 코일 -> B 코일 -> C 코일에 순서대로 전류를 흘려보내 회전자가 돌 수 있게 만든다.

        전류를 알맞은 타이밍에 알맞은 코일에 흘려보내기 위해 모터 컨트롤러를 사용한다. 

        이를 위해 센서를 사용하는데 대부분 홀-효과 센서를 사용한다. 

<br>

- `BLDC Motor Control`

알맞은 타이밍에 알맞은 코일에 전류를 흘려 전자석은 만들어주어야한다.

따라서 센서를 이용하여 회전자의 위치를 측정하고, 이 신호를 이용해서 모터 컨트롤러가 전류를 흘려보낸다.

`BLDC Motor and Transistor Switching (Motor Controller)`

![img_5.png](img_5.png)

<br>

`Transistor Switching Sequence`

![img_6.png](img_6.png)

## Feedback 시스템의 해석

Feedback System을 설계할 때 고려할 것은 다음 4 가지이다.

      1. Stability   : 시스템이 발산하지 않도록 Pole이 모두 OLHP
      2. Tracking    : 주어진 입력에 대해 출력이 잘 따라가는 지
      3. Regulation  : 외란에도 주어진 입력에 대해 잘 따라가는 지
      4. Sensitivity : Controller 또는 Plant의 TF가 변할 때, 시스템 전체의 TF가 얼마나 변하는 지
            
<br>

<br>

- `Stability `

`Open Loop System`은 stability의 제어가 불가능하다.

`Feedback System`은 Controller와 Plant에 대한 Loop Gain을 통해 제어가 가능하다.

<br>

- `Tracking`

시스템의 TF가 Origin Pole이 몇 개인지에 따라 System Type이 결정된다.

`System Type` : 다항식 입력에 대해 제어 시스템의 오차가 0이 아닌 상수가 될 때, 그 떄의 입력 차수

    왜 다항식? 
    
        입력이 항상 다항식일 수는 없지만, 쪼개서 보면 다항식으로 근사하여 사용할 수 있다. 

![image](https://user-images.githubusercontent.com/59076451/133104327-9e3602ba-ea86-417c-abc2-e624389814e3.png)

<br>

- `Regulation`

일반적으로 센서 노이즈는 고주파 영역이다. 또한 우리가 주는 입력과 외란은 저주파 영역에 속한다.

따라서 `제어기 D를 주파수에 맞게 설계`하면 외란에도 Regulation을 잘 할 수 있다.

<br>

- `Sensitivitiy`

`Open Loop System`은 변화에 대한 영향을 100% 반영한다.

`Feedback System`은 변화에 대한 영향을 1 / 1+DG 만큼 반영한다. 

<br>
<br>

- `PID 제어기의 Gain`

`Zigler-Nichols Tuning Method`




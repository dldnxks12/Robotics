## `Dynamic Response`


#### `Key Word`

`1. Transfer Function` <br>
`2. Stability` 

      Routh's Stability Criterion - TF Known
      Root-Locus - TF Known
      Nyquist Plot - TF Unknown
      
`3. Pole / Zeros`

<br>

<br>

- `Transfer Function`

시스템이 어떻게 동작하는지는 `Transfer Function`을 통해 확인한다.

time domain에서의 LTI 시스템의 출력 `y(t)`는 입력 `u(t)`와 natural response `h(t)`의 Convolution을 통해 얻을 수 있다.

      y = u*h : Convolution
      
하지만 u(t), h(t)의 Convolution이 복잡하기 때문에 Laplace Transform을 통해 `H(s)`를 구하고 Inverse Laplace를 통해 `h(t)`를 구한다.

      Y(s) = U(s) x H(s) : multiplication
      
      
`h(t) : natural Response`

    h(t)는 해당 시스템의 고유한 파형을 모두 나타내준다.
    
    시스템에 Impulse 입력을 가하면 해당 출력을 얻을 수 있다.
    
    h(t) = h(t)*δ(t)
       

<br>            
    
- `Pole / Zero`   

`Pole` : 시스템의 `Stability`에 관련 

      System(Controller + Plant) TF의 Pole은 분모 = 0이 되는 Point들이다.
      
            TF의 분모는 특별히 Characteristic Eqn 즉, 특성방정식으로 부른다.
            
`Zero` : `Pole`의 가중치 역할

      Zero가 Pole 가까이에 위치할 때는, 해당 Pole에 의한 파형의 영향이 작아진다.
      
      
`h(t) and Pole / Zero`

      Pole과 Zero의 조합으로 H(s)가 만들어진다. 따라서 이 들은 결국 h(t)의 특성을 만들어낸다.

<br>                  
            
`Stability`

        TF의 Pole이 모두 OLHP에 위치할 때 해당 시스템은 안정하다
        
<br>                  
              
        
- `Final Value Theorem Steady State Value`

`Steady State Value`  : 시간이 충분히 흐른 뒤의 y(t)의 값

`Final Value Theroem` : Pole들이 모두 OLHP일 때 사용 가능 

`DC Gain` : 해당 TF를 갖는 시스템에 Step Input을 넣었을 때, `Steady State에서 갖는 값`

      TF에 0을 넣으면 된다.        

![image](https://user-images.githubusercontent.com/59076451/133099754-cda2cb29-787f-4e2b-aa94-84250056c0e4.png)

<br>

- `Complex Poles`

![image](https://user-images.githubusercontent.com/59076451/133101540-f8b52c8c-1baf-47e4-a880-2f1848ef4639.png)

<br>

- `Effect of Pole Locations`

![image](https://user-images.githubusercontent.com/59076451/133101722-4aff98e3-7afe-423d-bde9-7e13ed53bb92.png)




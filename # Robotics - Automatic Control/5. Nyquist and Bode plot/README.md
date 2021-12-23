## Frequency 기반 설계

System TF의 Pole을 이용해서 안정성을 검사했는데, 그럼 `System TF를 모를 때 Stability를 확인하는 방법`은 뭘까?

다행히도 Sine Wave를 LTI System에 통과시켰을 때, 시스템의 `주파수 응답`에서 `Magnitude`와 `Phase`를 알아낼 수 있다.

    이를 통해 알아낼 수 있는 건 Open Loop TF이다.
   
이 Open Loop TF로 Closed Loop System의 안정성을 검사할 수 있나? `Yes`

    Nyquist Plot과 Bode Plot을 이용해서 시스템 안정도를 검사할 수 있다.
    
    
- List 

1. Bode Plot
2. Neutral Stability 
3. Nyquist Plot / Nyquist Stability Criterion
4. Stability Margin
     

---

<br>    

<br>    

#### `Bode Plot`

`Bode plot`과 `Root Locus`는 모두 Open Loop TF를 이용해서 그린다.

<br>

`Bode Plot`  : Open Loop TF이용

`Root Locus` : Closed Loop TF의 CE 1+KL(s)에서 L(s)를 이용 (즉, Open Loop TF) 

      사용한 것은 OLTF지만 그린 것은 CL의 Pole들이다. 
      
      따라서, Root Locus는 CL의 특성이다.

<br>    

- `How to Draw Bode Plot?`

![image](https://user-images.githubusercontent.com/59076451/133126707-e7da53c2-c5fd-4471-a0cf-d1b3340c617a.png)


<br>    

<br>    

#### `Neutral Stability Condition`

`Neutral Stability Condition`은 Root Locus, Bode plot, Nyquist Plot을 관통하는 중요한 개념이다.

우선 `Neutral Stability Condition`은 Root Locus와 Bode Plot 사이의 관계를 알려준다. 

![image](https://user-images.githubusercontent.com/59076451/133126969-386560ff-6619-4937-98ce-4859b0eaf81c.png)

    일반적으로 `Neutral Stability Condition`에서 K 값이 커지면 불안정해지고, K 값이 작아지면 안정해진다.
    

위 방법은 90% 이상의 시스템에 적용할 수 있다.

하지만 100%를 위해서라면 `Nyquist Stability Condition`을 사용하자.

<br>

<br>

#### `Nyquist Stability Condition`

우리는 `OLTF`로 `CL`의 안정성을 검사하고 싶다.

    OLTF는 실험적으로 알아내기 쉽다.
    
<br>    
    
`Nyquist Stability Condition`은 다음과 같다.

`Z = N+P = 0` 이면 안정하다. 

<br>    

- `N, P, Z ?`

OLTF로 Nyquist Plot을 그리고, S = -1/k를 시계 방향으로 몇 바퀴 도는 지 확인한다.  `N`

Z = 1 + KG(s)의 Zero인데, Z는 동시에 CL의 Pole이기도 하다 `Z`

P = KG(s)의 불안정한 Pole `P`

    Z = N+P은 CL의 불안정한 Pole의 개수이다.

![image](https://user-images.githubusercontent.com/59076451/133127991-62fbccef-377b-4cbe-b23a-baeaae3f7727.png)


<br>

<br>

#### `Compensator Desing` 

![image](https://user-images.githubusercontent.com/59076451/133128074-dacfc7c5-95f2-4f07-acbe-b2f989faa4bf.png)














      

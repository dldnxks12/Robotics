## DC Motor

- Goal 

      기본적인 모터 구조에 대해 이해하고, Simulink를 이용해서 모델링해보자 

- List

      1. DC Motor의 구조 및 구동 원리      
      
            - 모터의 원리 , 발전기 원리

      2. Motor 이론
      3. DC Motor Modeling
      4. Simulink

---

<br>

<br>


### `DC Motor 구조 및 구동 원리 `

<div align=center>

![image](https://user-images.githubusercontent.com/59076451/133031653-ea892e00-c2f4-4347-99a4-ab72b44a1912.png)
      
</div>

`플레밍의 왼손 법칙`

      - 원인 : 자기장과 전류
      - 결과 : 힘 
      
            자기장 내의 도선에 전류가 흐르면 힘이 발생한다.
      
      예를 들어 선풍기는 전기에너지를 얻어서 모터에서 운동에너지가 발생 (모터 회전)

`플레밍의 오른손 법칙`

      - 원인 : 자기장과 힘
      - 결과 : 전류 (전압 차)
      
            자기장을 끊는 방향으로 도체가 움직이면 전류가(전압 차가) 발생한다.
      
      예를 들어 모터가 도는 운동에너지로 부터 전기에너지가 발생 
      
      


<br>

<br>

- `전동기(모터)의 원리`

<div align=center>

![image](https://user-images.githubusercontent.com/59076451/133030976-a996e2a5-0802-4ddb-b1aa-bfbf42007e66.png)
      
</div>

            고정자 : 자기장 생성
            회전자 : 전류가 흐르고 있는 도선
            정류자, 브러쉬 : 전류의 흐름 제어 
            
<br>            

DC 모터는 `로렌츠의 법칙`에 의해 발생하는 `로렌츠 힘`으로 회전하는 구조이다.

            자기장 내의 도선에 전류가 흐르면 힘이 발생한다. (로렌츠 힘)
            
            자기장과 전류, 힘의 방향은 플레밍의 왼손 법칙을 따른다.
            
                  * 발전기의 원리는 플레밍의 오른손 법칙
                  
<br>
    
DC 모터에서 `정류자와 브러쉬`가 존재하는 이유는, `모터를 일정한 방향으로 계속 회전시키기 위함`이다.

            일정 주기로 전류 흐름의 방향을 바꿔주는 역할

<br>            
            
- `발전기의 원리`

발전기는 기계식 에너지로 부터 전기 에너지를 발생시키는 원리이다.

            풍력 발전기와 같이 바람으로 인해 모터가 회전하면서 발생하는 에너지로 부터 전기를 얻어낼 때 사용한다.
            
                       
---

<br>        

<br>        


### `Motor 관련 기초 이론`

      - 유도 기전력 (EMF)
      - 회전력 (Torque)
      - 에너지 보존 법칙 

<br>        

<br>        

- `회전력 Torque`

플레밍의 왼손 법칙에 의해 자기장에 존재하는 도선에 전류가 흐르면 힘이 발생한다.      

      F = Bli

![image](https://user-images.githubusercontent.com/59076451/133032835-d02d19e1-b5a4-4d6d-bddb-4a5261d6a24f.png)

<br>        

- `유도 기전력`

플레밍의 오른손 법칙에 의해 자기장을 끊는 방향으로 도선이 운동하면 유도기전력(전압차 or 전류)이 발생한다.

      e = Blv

![image](https://user-images.githubusercontent.com/59076451/133032779-726b0fa2-3b5b-46d6-8425-0e940c65b342.png)


<br>        

- `에너지 보존 법칙`


전류에 의해 Torque가 발생하고, Torque에 의해 전류가 발생한다.

            ex) 모터가 회전하면 유도기전력이 발생한다.
            
<br>

<div align=center>

`에너지 등가 : 모터의 회전 (운동 에너지) == 유도기전력 (전기 에너지)`
      
![image](https://user-images.githubusercontent.com/59076451/133033500-a5c36e02-557b-4b3c-b3cd-f315092d366f.png)

</div>      



### `DC Motor Modeling`


      - 전기방정식
      - 기계방정식 (운동 방정식)
      - Motor Modeling
      

<br>

- `전기방정식`

<div align=center>

![image](https://user-images.githubusercontent.com/59076451/133033769-50d14b0e-7406-4547-bb09-e2f79cf91079.png)

<br>

모터가 회전하며 생기는 전압차 : `유도기전력 e(volt)`

![image](https://user-images.githubusercontent.com/59076451/133033826-4f6e3f3f-fc38-410a-9815-b8ca61a3abb4.png)

직류 전동기에 전압 V를 인가했을 때, 그 때 전류를 구하기 위해서는 `유도기전력 e`를 알아야한다!
      
</div>      

<br>

- `기계방정식 (운동 방정식)`

<div align=center>
     
![image](https://user-images.githubusercontent.com/59076451/133034091-eac26962-382b-4387-a027-30be0b4e0b3d.png)
      
      
모터의 속도 θ' 을 구하기 위해서는 모터에 가해지는 `Torque Te`를 알아야한다!      
      
</div>      

<br>

- `Motor Modeling`

System Modeling을 위하며 먼저 `Transfor Function`을 구한다.

<div align=center>
      
Transfer function은 전기 방정식과 운동 방정식의 Laplace Transform을 통해 구할 수 있다.       
      
![image](https://user-images.githubusercontent.com/59076451/133034489-37220e84-4b59-411f-be0b-cd5df2049477.png)
      
</div>      

위의 Laplace Transform의 결과로 전류 I(s)와 각속도  θ'(s)에 대한 방정식을 구할 수 있다.

이 두 개의 식에서 입력 전압 V(s)와 출력 각속도 θ'(s)에 대한 Transfer function을 구하면 되겠다.

<br>

**주의할 점**

수식상으로는 단순히 대입하여 입력 전압에 대한 출력 각속도 Transfer function을 구할 수 있다.

하지만 실제 시스템을 구성할 때는 다음과 같은 `Feedback Block Diagram`으로 구성해야한다.

      넣어주는 전압에 대한 전기 방정식의 출력을 얻은 다음, 이를 운동 방정식에 넣어 결과를 얻는 방식으로 Sequential하게 해야한다.
      

<br>

다음과 같이 Model Block Diagram을 구성한다. 
           
![image](https://user-images.githubusercontent.com/59076451/133035099-fd65f496-a139-4a5f-8760-f4dcb39183e0.png)



<br>

먼저 `전기방정식`의 출력을 얻기 위한 Step이다.

![image](https://user-images.githubusercontent.com/59076451/133035173-bef8d283-a901-41c7-b6d3-8f3294456aca.png)

<br>

다음으로 이 출력을 가지고 `기계 방정식`의 출력을 유도한다.

![image](https://user-images.githubusercontent.com/59076451/133035099-fd65f496-a139-4a5f-8760-f4dcb39183e0.png)

<br>

<br>

결과적으로 입력 전압과 출력 각속도에 대한 전달함수를 얻을 수 있다. 

<div align=center>

![image](https://user-images.githubusercontent.com/59076451/133035292-413173ca-0378-4b50-b6d1-94e7b3aeecb4.png)
      
</div>      



           

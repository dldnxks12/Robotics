## Jacobian

`정지된 상태가 아니라 움직이는 End-Effector를 표현하는 방법`

    Robot이 더이상 Static하지 않다.
    
    Rigid body의 속도와 가속도를 알아보고, 이를 이용해서 Robot의 움직임을 살펴볼 수 있다.

<br>

`Jacobian`의 용도

    1. End-Effector의 속도와 가속도가 주어졌을 때, Joint 변수들의 변화는 어떤가?
    2. End-Effector에 힘이 가해질 때, 이를 버텨내기 위해 필요한 힘은?
    
<div align=center>    
  
![image](https://user-images.githubusercontent.com/59076451/133144531-5307ba7e-892f-44a3-8508-12adda8a0ba9.png)
  
</div>  

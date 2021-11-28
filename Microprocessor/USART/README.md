### USART 직렬 통신

보내기 UDR = 0xFF;  

받기 a = UDR; 

            UDR : 같은 메모리 주소 


- USART Register
    
    `UDR` : 입출려 데이터 레지스터  
    `UCSRnA` : 제어 및 상태 레지스터 A  
    `UCSRnB` : 제어 및 상태 레지스터 B  
    `UCSRnC` : 제어 및 상태 레지스터 C  
     `UBRRnH/H` : 보드레이드 레지스터 
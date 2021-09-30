%% Clear Variables, Plots
clear all;
close all;
clc;

%% Common Variable

%Va = 1;  

%% Gear motor Variable

La = 0.000658;
Ra = 1.76;
Ja = 0.00000995;   
B  = Ja/0.00376;
Ke = 0.0683;
Kt = 0.0683;

Gear_Ratio = 1/81;
Jg = 0.0000005; 
Bg = Jg/0.00376;
Jeq = Ja + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Jg);
Beq = B + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Bg);
Jload = ((1/3)*(0.175)*(0.09+0.00015625)) + ((0.5)*(0.34)*(0.0025)) + ((0.34)*(0.09));
Bload = ( Jeq + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Jload) ) / 0.00376;
Jnew = ((1/0.72)*(Gear_Ratio*Gear_Ratio)*Jload) + Jeq;
Bnew = ((1/0.72)*(Gear_Ratio*Gear_Ratio)*Bload) + Beq;

%% Current Controller Variable

Wcc = 2*3.14*200; % 2 x Pi x (2000 / 10) Hz 
Kp_current = La*Wcc;
Ki_current = Ra*Wcc;

%% Execute 

Va = 1;
result = sim('motor_control_current');
Current = result.Current.signals.values;
Current_time = result.Current.time;

Va = 5;
result2 = sim('motor_control_current');
Current2 = result2.Current.signals.values;
Current_time2 = result2.Current.time;

Va = 10;
result3 = sim('motor_control_current');
Current3 = result3.Current.signals.values;
Current_time3 = result3.Current.time;

Va = 25;
result4 = sim('motor_control_current');
Current4 = result4.Current.signals.values;
Current_time4 = result4.Current.time;

%% Plotting result 

figure(1)
plot(Current_time, Current)
hold on 
plot(Current_time2, Current2)
hold on 
plot(Current_time3, Current3)
hold on 
plot(Current_time4, Current4)

title("Current")
xlabel("t(sec)")
ylabel("current(A)")
legend("current 1A","current 5A","current 15A","current 25A")


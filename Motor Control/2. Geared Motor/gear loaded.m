%% Clear Variables, Plots
clear all;
close all;
clc;

%% Common Variable

Va = 48;

%% Gear motor Variable

La = 0.000658;
Ra = 1.76;
Ja = 0.00000995;   
B  = Ja/0.00376;
Ke = 0.0683;
Kt = 0.0683;

Gear_Ratio = 1/81;
Jg = 0.0000005; % 달려있는 부하가 없으니 매우 작은 값
Bg = Jg/0.00376;
Jeq = Ja + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Jg);
Beq = B + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Bg);
Jload = ((1/3)*(0.175)*(0.09+0.00015625)) + ((0.5)*(0.34)*(0.0025)) + ((0.34)*(0.09));
Bload = ( Jeq + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Jload) ) / 0.00376;
Jnew = ((1/0.72)*(Gear_Ratio*Gear_Ratio)*Jload) + Jeq;
Bnew = ((1/0.72)*(Gear_Ratio*Gear_Ratio)*Bload) + Beq;


%% Execute 

result = sim('gear_load');

%% Geared Motor Values
%Current 
Current = result.Current.signals.values;
Current_time = result.Current.time;

% Angular Velocity
OmegaG = result.OmegaG.signals.values;
OmegaG_time = result.OmegaG.time;

% Angle
ThetaG = result.ThetaG.signals.values;
ThetaG_time = result.ThetaG.time;


%% Plotting result 

figure(1)
plot(Current_time, Current)
title("Current")
xlabel("t(sec)")
ylabel("current(A)")
legend("Gear")

figure(2)
plot(ThetaG_time, ThetaG)
title("Angle")
xlabel("t(sec)")
ylabel("degree")
legend("Gear")

figure(3)
plot(OmegaG_time, OmegaG)
xlabel("t(sec)")
ylabel("rad/sec")
title("Angular Velocity")
legend("Gear")
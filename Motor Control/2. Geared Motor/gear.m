%% Clear Variables, Plots
clear all;
close all;
clc;

%% Common Variable

Va = 48;
TL = 0;

%% DC motor Variable

La = 0.000658;
Ra = 1.76;

Ja = 0.00000995;
B  = Ja/0.00376;

Ke = 0.0683;
Kt = 0.0683;

%% Gear motor Variable

Gear_Ratio = 1/81;
Jg = 0.0000005; % 달려있는 부하가 없으니 매우 작은 값
Bg = Jg/0.00376;
Jeq = Ja + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Jg);
Beq = B + ( (1/0.72)*(Gear_Ratio*Gear_Ratio)*Bg);


%% Execute

result = sim('gear');

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

%% DC Motor Values
% DC Angular Velocity
DC_Angular = result.DC_Angular.signals.values;
DC_Angular_time = result.DC_Angular.time;

% DC Angle
DC_Angle = result.DC_Angle.signals.values;
DC_Angle_time = result.DC_Angle.time;

% DC current
DC_current = result.DC_Current.signals.values;
DC_current_time = result.DC_Current.time;

%% Plotting result

figure(1)
plot(DC_current_time, DC_current, '-o')
hold on
plot(Current_time, Current)
title("Current")
xlabel("t(sec)")
ylabel("current(A)")
legend("DC","Gear")

figure(2)
plot(DC_Angle_time, DC_Angle)
hold on
plot(ThetaG_time, ThetaG)
title("Angle")
xlabel("t(sec)")
ylabel("degree")
legend("DC","Gear")

figure(3)
plot(DC_Angular_time, DC_Angular)
hold on
plot(OmegaG_time, OmegaG)
xlabel("t(sec)")
ylabel("rad/sec")
title("Angular Velocity")
legend("DC","Gear")
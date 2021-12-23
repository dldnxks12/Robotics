%% Clear Variables, Plots
clear all;
close all;
clc;

%% Common Variable

V = 1; 

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

% 3/Wcc : 0.00238853503184713375796178343949
Wcc = 2*3.14*200; % 2 x Pi x (2000 / 10) Hz 
Kp_current = La*Wcc;
Ki_current = Ra*Wcc;

%% Velocity Controller Variable

% 3/Wcs : 0.0238853503184713375796178343949
Wcs = Wcc/10;
Kp_velocity = (Jnew*Wcs)/Kt; % Kt : Torque Constant 
Ki_velocity = (Bnew*Wcs)/Kt;

%% Position Controller Variable

Wcp = Wcs/10;
Kp_position = Wcp;
Kd_position = (Wcp/Wcs)*7;

%% Execute 

result = sim('motor_control_position');
thetaM = result.ThetaM.signals.values;
thetaM_time = result.ThetaM.time;

thetaG = result.ThetaG.signals.values;
thetaG_time = result.ThetaG.time;

V = 10;
result2 = sim('motor_control_position');
thetaM2 = result2.ThetaM.signals.values;
thetaM_time2 = result2.ThetaM.time;

V = 45;
result3 = sim('motor_control_position');
thetaM3 = result3.ThetaM.signals.values;
thetaM_time3 = result3.ThetaM.time;

V = 90;
result4 = sim('motor_control_position');
thetaM4 = result4.ThetaM.signals.values;
thetaM_time4 = result4.ThetaM.time;

%% Plotting result 

figure(1)
plot(thetaM_time, thetaM)
hold on 
plot(thetaM_time2, thetaM2)
hold on 
plot(thetaM_time3, thetaM3)
hold on 
plot(thetaM_time4, thetaM4)

title("Angle")
xlabel("t(sec)")
ylabel("Angle[degree]")
legend("Angle[1 degree]","Angle[10 degree]","Angle[45 degree]","Angle[90 degree]")

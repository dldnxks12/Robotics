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

%% Execute 

result = sim('motor_control_velocity');
OmegaM = result.OmegaM1.signals.values;
OmegaM_time = result.OmegaM1.time;

OmegaG = result.OmegaG1.signals.values;
OmegaG_time = result.OmegaG1.time;

V = 2;
result2 = sim('motor_control_velocity');
OmegaM2 = result2.OmegaM1.signals.values;
OmegaM_time2 = result2.OmegaM1.time;

V = 3;
result3 = sim('motor_control_velocity');
OmegaM3 = result3.OmegaM1.signals.values;
OmegaM_time3 = result3.OmegaM1.time;

V = 5;
result4 = sim('motor_control_velocity');
OmegaM4 = result4.OmegaM1.signals.values;
OmegaM_time4 = result4.OmegaM1.time;

%% Plotting result 

figure(1)
plot(OmegaM_time, OmegaM)
hold on 
plot(OmegaM_time2, OmegaM2)
hold on 
plot(OmegaM_time3, OmegaM3)
hold on 
plot(OmegaM_time4, OmegaM4)
hold on 
plot(OmegaG_time, OmegaG)


title("Angular Velocity")
xlabel("t(sec)")
ylabel("Angular Velocity")
legend("Motor Angular Velocity 1[rad/s]","Motor Angular Velocity 2[rad/s]","Motor Angular Velocity 3[rad/s]","Motor Angular Velocity 5[rad/s]", "Geared Motor Angular Velocity 1[rad/s]")

% Parameter in Maxon DCX35L Motor Spec

clc; % commmand line clear
clear all; % Workspace Variable clear
close all; % plot clear

%% Parameter in Maxon DCX35L Motor Spec 

% input Voltage
Va = 5; 

% Circuit Transfer function
La = 0.000658; % 0.658 mH = 0.000658 H
Ra = 1.76; %

% Mechanical Transfer function

% 돌림 힘  : 힘 x 거리 [N x m] = [ (kg * m / s^2  )x m] = [kg * m^2 / s^2]
% 각가속도 : [1 rad / s^2]
% 돌림 힘 = 회전 관성 모멘트 x 각가속도 (I * alpha)
% 회전 관성 모멘트 I = 돌림 힘 / 각가속도 
% 따라서 단위는 [ kg * m^2 ] !

%1kg = 1000g
%1m = 100cm
%99.5 x 0.001 x 0.01 x 0.01
J = 0.00000995; 
B = 0.002647 ; % J/time constant : 0.00000995 / 0.00376 

% torque constance and emf constant
% torque constant : Nm / A
Kt = 0.0683;
Ke = 0.0683;

% Load torque
TL = 0;

%% Execute Simulink

sim('sine_sim') % simulink에서 만들어 놓은 Block Diagram 실행 명령

%% Load and Plot saved data 

% data가 저장된 work directory path 

% Output angle (Integrate Angular Velocity)
x = ans.angule.time;
y = ans.angule.signals.values;

y = rad2deg(y) % Radian to Degree

% Output Anguler Value of Mechanical Eqn
x2 = ans.anguler_vel.time;
y2 = ans.anguler_vel.signals.values;

figure(1)
plot(x, y, 'r') % x : time , y : vaule, color = red

figure(2)
plot(x2, y2, 'r') % x : time , y : vaule, color = red


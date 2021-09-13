clc; % commmand line clear
clear all; % Workspace Variable clear
close all; % plot clear

Va = 1; % input Voltage

%% Parameter
% Circuit Transfer function
La = 1; 
Ra = 1;

% Mechanical Transfer function
J = 1;
B = 1;

% torque constance and emf constant
Kt = 0.1;
Ke = 0.1;

% Load torque
TL = 1;

%% Execute Simulink

sim('sine_sim') % simulink에서 만들어 놓은 Block Diagram 실행 명령

%% Load and Plot saved data 

% data가 저장된 work directory path 

% Output Current of Circuit Eqn
x = ans.current.time;
y = ans.current.signals.values;

% Output Anguler Value of Mechanical Eqn
x2 = ans.anguler_vel.time;
y2 = ans.anguler_vel.signals.values;

figure(1)
plot(x, y, 'r') % x : time , y : vale, color = red

figure(2)
plot(x2, y2, 'r') % x : time , y : vale, color = red


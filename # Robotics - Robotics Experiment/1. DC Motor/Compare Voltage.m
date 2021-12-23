% Input Volage를 다르게 하며 출력 각도, 각속도의 차이를 확인

%% Clear Variables, Plots
clear all;
close all;
clc;

%% Define Variable
Va = 5;

La = 0.000658;
Ra = 1.76;

Ja = 0.00000995;
B  = Ja/0.00376;

Ke = 0.0683;
Kt = 0.0683;

TL = 0;

%% V = 5

result = sim('simout');

a = result.Angle.time;
b = result.Angle.signals.values;
b = rad2deg(b); % rad to degree 해야 값이 잘 나온다.

a2 = result.AngularVel.time;
b2 = result.AngularVel.signals.values;

%% V = 12

Va = 12;
result2 = sim('simout');

a3 = result2.Angle.time;
b3 = result2.Angle.signals.values;
b3 = rad2deg(b3); % rad to degree 해야 값이 잘 나온다.

a4 = result2.AngularVel.time;
b4 = result2.AngularVel.signals.values;

%% V = 24
Va = 24;
result3 = sim('simout');
a5 = result3.Angle.time;
b5 = result3.Angle.signals.values;
b5 = rad2deg(b5); % rad to degree 해야 값이 잘 나온다.

a6 = result3.AngularVel.time;
b6 = result3.AngularVel.signals.values;
%% V = 48
Va = 48;
result4 = sim('simout');
a7 = result4.Angle.time;
b7 = result4.Angle.signals.values;
b7 = rad2deg(b7); % rad to degree 해야 값이 잘 나온다.

a8 = result4.AngularVel.time;
b8 = result4.AngularVel.signals.values;

%% Plotting result
% Plot한 개에 다 그리기 , title, legend, label 필수


% 각도, 각속도 비교 분석

figure(1);
plot(a,b);
hold on
plot(a3,b3);
hold on
plot(a5,b5);
hold on
plot(a7,b7);
legend('V = 5[V]','V = 12[V]', 'V = 24[V]','V = 48[V]')
title("Angle")
xlabel("t(sec)")
ylabel("degree")

figure(2);
plot(a2,b2);
hold on
plot(a4,b4);
hold on
plot(a6,b6);
hold on
plot(a8,b8);
legend('V = 5[V]','V = 12[V]', 'V = 24[V]','V = 48[V]')
title("Angular Velocity")
xlabel("t(sec)")
ylabel("rad/sec")
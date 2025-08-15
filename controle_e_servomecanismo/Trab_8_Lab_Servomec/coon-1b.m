
%% Cohen-Coon

clc; clear; close all;

P = tf(0.05,[0.009 0.066 0.1288]);
pole(P)

figure()
step(P); grid on; hold on;
title('Step Response - Planta')

% calculo
syms s t
Y = 0.05/(0.009*s^3+0.066*s^2+0.1288*s);
y = ilaplace(Y,t)  
dy = diff(y,t)     
ddy = diff(dy,t)   
ti = 0.2671  %double(solve(ddy)) com valor de tempo negativo
yi = double(subs(y,ti))  
at = double(subs(dy,ti))  
bt = yi-at*ti  

t = 0:0.01:12;
u = zeros(length(t),1);
u(t>=0) = 10.5;

plot(t,at*t+bt,'r')

y0 = -bt/at      
y1 = (1-bt)/at   

T = y0
a = y1 - y0

% teste 

% PID
Kp = 1.35*(a/T)+0.27
Ti = (2.5*(a/T)*(1+(a/5*T)))/(1+0.6*(a/T)); Ki = Kp/Ti
Td = (0.37*(a/T))/(1+0.2*(a/T)); Kd = Kp*Td
C = tf([Kd Kp 4*Ki],[1 0]);   
MF = feedback(C*P,1);
figure(); lsim(MF,u,t); grid on;
title('Step Response - PID')



%% pidTuner
%pidTuner(P)
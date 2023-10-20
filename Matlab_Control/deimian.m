close all
clc
T = 0.05;%% Converting from Discrete to Continuous
d = 1;
z=tf('z',T);
% Gpz = (0.006358*z^3 -0.002533*z^2 -0.001035*z + 0.001769) / (z^3 -0.3594*z^2 -0.305*z -0.2046)
% Gz = (0.006432*z^2 - 0.003896*z + 0.0005106) / (z^2 - 0.4705*z - 0.3411) ;
% Gpz = (0.006432*z^2 - 0.003896*z + 0.0005106) / (z^2 - 0.4705*z - 0.3411) * z^-1;
Gpz = 0.00481  / (z-0.6888);
Gz = Gpz * z^d;
Gpz_num = Gpz.Numerator{1,1};
Gpz_den = Gpz.Denominator{1,1};
step(Gpz)
hold on
grid on
Gs = d2c(Gz)
theta = T*d;
Gps = tf([0.00481,0.1152],[1,7.456],'inputdelay',theta);
step(Gps)

t = [0:0.1:1.4];
sz = size(t,2);
plot(t,ones(sz,1).*0.0161);
plot(t,ones(sz,1).*0.0161*.632);
plot(t,ones(sz,1).*0.0161*.283);

tau = (0.1441325 - 0.054777) * 3/2;     %% PID with IAE Criterion
theta = d*T;
K = 0.1152 / 7.456;

a=  1.086; %%IAE
b= -0.869;
c=  0.74;
d= -0.13;
e=  0.348;
f=  0.914;

Kp = (1/K) * (a*(theta/tau)^b)
Taui = (tau) / (c + d*(theta/tau))
Taud = (tau) * (e * (theta/tau)^f)

Kpz = Kp - (Kp * T)/(2*Taui);
Kiz = (Kp*T)/Taui;
Kdz = (Kp*Taud)/T;
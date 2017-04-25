close all;

hold on;



t=  [0:1/20:2];

xp = sin(2*pi*t);

figure(1)
stem(t, xp)
grid on;

t2 =[0:1/10:10];
xnp = sin(2*t2);

figure(2)
stem(t2, xnp)
grid on;

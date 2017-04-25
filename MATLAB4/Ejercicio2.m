
close all;
clc;

t =0:0.01:2;

xa = 4.5*sin(210*pi*t);

figure(1)
plot(t, xa), title('xa(t)=4.5sin(210*pi*t)'), xlabel('t'), ylabel('Amplitud')

n =[0:0.05:4]
x_n = 4.5*sin(0.7*pi*n)

figure(2)
stem(n, x_n), title('x(n)=4.5sin(7/10*pi*n)'), xlabel('n'), ylabel('Amplitud')


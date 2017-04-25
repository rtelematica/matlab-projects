close all, clear all,clc;
f=4000;
T=1/f;
Fs=8000;
N=1/Fs;
F=8/N;
n=0:1/F:T;
x=cos(2*pi*f*n);
hold on 
grid on
plot(n,x);
stem(n,x)

for g=1:17
    sinal(g)=sin(pi*2*(g-1)*(g-1)/16)*x(g);
end
sinal(1)=1;
figure (2)
grid on
j=sinal/16;
plot(0:16,sinal)
stem(0:16,abs(sinal))

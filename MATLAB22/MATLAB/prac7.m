close all, clear all, clc
figure (1)
f=10;
fs=20;
n=0:1/20:2*(1/10);
x=cos(2*pi*f*n);
hold on
%plot(n,x)
%stem(n,x)


f=10;
fs=1.5*10;
n=0:1/fs:2*(1/10);
x=cos(2*pi*f*n);
hold on
%plot(n,x,'g')
%stem(n,x)

f=10;
n=0:1:3;
hold on 
y=sin(2*pi*f*n)
x=[1 1 1 1];
z=y.*x;
%stem(n,x)
%plot(n,y)

n=0:4;
x=[3 2 1 2]
u=fftn(x)
stem(n,u)




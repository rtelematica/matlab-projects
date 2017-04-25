clear all;
close all;
n=0;
fs=8192;
for n=0:1
t=0:1/fs:1;
x=cos(2*pi*1*t)+cos(2*pi*120*t);
x1=cos(2*pi*941*t)+cos(2*pi*1633*t);
x2=cos(2*pi*852*t)+cos(2*pi*1477*t);
x3=cos(2*pi*941*t)+cos(2*pi*1633*t);
x4=cos(2*pi*697*t)+cos(2*pi*1209*t);
x5=sin(2*pi*25*t) + exp(-2i*t);
xd=[x,x1,x2,x3,x4, x5]
sound(xd)
end

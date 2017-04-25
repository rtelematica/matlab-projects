clear all;
close all;
n=0;
fs=8192;
for n=0:5
t=0:1/fs:1;
x=cos(2*pi*697*t)+cos(2*pi*1209*t);
x1=cos(2*pi*941*t)+cos(2*pi*1633*t);
x2=cos(2*pi*852*t)+cos(2*pi*1477*t);
x3=cos(2*pi*941*t)+cos(2*pi*1633*t);
x4=cos(2*pi*697*t)+cos(2*pi*1209*t);
xd=[x,x1,x2,x3,x4]
sound(xd)
end

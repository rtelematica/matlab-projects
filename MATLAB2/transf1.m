%function[xpt,t]=transf1(fm)
fm = 1000;
%fm=1000;
t=0:1/fm:0.5;

xp1=sin(2*pi*60*t);
xp2=sin(2*pi*100*t);
xpt=xp1+xp2;

YFt=fftshift(fft(xpt));

figure(1)
plot(1:length(YFt), abs(YFt))

lft=floor(length(YFt)/2);
YFt=YFt(1:lft);

%Eje de frecuencia
ft=(0:lft-1)*(-fm/2)/(lft-1);

figure(2)
subplot(2,1,1), plot(t,xpt);
subplot(2,1,2), plot(ft,abs(YFt));


YF1=fft(xp1);
YF2=fft(xp2);

YFt2=YF1+YF2;

lft2=floor(length(YFt2)/2);
YFt2=YFt2(1:lft2);
%Eje de frecuencia
ft2=(0:lft2-1)*(fm/2)/(lft2-1);

figure(3)
subplot(2,1,1), plot(t,xpt);
subplot(2,1,2), plot(ft2,abs(YFt2));
function[x,t]=transf1(fm)

%fm=1000;
t=0:1/fm:1;

xp=sin(2*pi*60*t);
plot(t,xp);

YF=fft(xp);

subplot(2,1,1), plot(t,xp)
subplot(2,1,2), plot(abs(YF));
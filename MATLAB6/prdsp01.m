
fm = 200;
tf = [-2 : 1/fm : 2];

fe = exp( abs( tf ) );

figure(4)
plot( tf, fe );


f1=50;
f2=100;
fs=10000;
n=0:1/fs:0.1-1/fs;
Xn=sin(2*pi*f1*n)+cos(2*pi*f2*n);
figure(1);
plot(n,Xn);
xlabel('t');
ylabel('Amplitud');
title('x(t)');

figure(2);
stem(n,Xn);
xlabel('n');
ylabel('Amplitud');
title('X(n)');

Xf=fftshift(fft(Xn));
f=[-fs/2:fs/length(Xf):(fs/2)-fs/length(Xf)];

figure(3);
plot(f,abs(Xf));
xlabel('Hz');
ylabel('Magnitud');
title('X(f)');


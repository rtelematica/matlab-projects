%% pp

clear all, clc;

t = [ 0 : 0.001 : 2-0.001];

ttt = length(t)

f1 = 1;
f2 = 3;
f3 = 5;

%funcion a muestrear
x = 1*sin(2*pi*f1*t) + 1*sin(2*pi*f2*t) + 1*sin(2*pi*f3*t);
figure(1)
plot(t,x)

%Tren de pulsos con ts = 0.05

tren= t;
c = 0;
ts = 0.05;


for i = 1 : length( tren )
    
    if mod(tren(i), ts) == 0
        
        tren(i) = 1;
        c = c + 1;
        
    else
        tren(i) = 0;
        
    end
   
   
end

figure(2)
plot(0:length(tren)-1, tren)

%Transformada de fourier de x

X_f = fftshift(fft(x));
X_f = X_f./500;
f=[-500:0.5:500-0.5];

clc
ffff = length(X_f) 
%Grafica
figure(3)
plot(f, abs(X_f))

%Muestreo Ideal

muesI = x.*tren;

figure(4)
plot(t, muesI)

f_mues = fftshift(fft(muesI));

f_mues = f_mues./10;

figure(5)
plot(0:length(f_mues)-1,abs( f_mues));
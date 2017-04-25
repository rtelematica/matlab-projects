
%% pp

clear all, close all, clc;

t = [ 0 : 0.001 : 0.5];

f1 = 1;
f2 = 3;
f3 = 5;

%funcion a muestrear
x = sin(2*pi*f1*t) + sin(2*pi*f2*t) + sin(2*pi*f3*t);
%figure(1)
%plot(t,x)

%Tren de pulsos con ts = 0.05

tren = 0;
cont = 0;
ts = 0.05;
for i = 1 : length( t )
    tiempo = t(i)
    
    if cont*ts <= t(i)
        i
        j = cont*0.05
        tren(i) = 1;
        cont = cont + 1
        j = cont*0.05
    else
        tren(i) = 0;
        
    end
    
    cont
   
end

figure(2)
stem(0:length(tren)-1, tren)
%punto 1
%figure(1)
%stem(n, xn)

fxn = fftshift(fft(xn));


%punto 1
figure(2)
plot(0 : 1: length(fxn) - 1, abs(fxn))

%punto 2

fxn2 = abs(fxn).^2; 

figure(3)
plot(0 : 1 : length(fxn2) - 1, fxn2)


%punto 3

fm = 10000;

w = -pi : 1/fm : pi;
xw = (1 - exp(-i*5*w)) ./ (1 - exp(-i * w));

Ex1 = ( 1 / ( 2 * pi ) ) * 2 * pi / length( xw ) * sum( abs( xw ).^2 );

Ex2 = sum(abs(xn).^2);

% pendiente int = quad(@funUn, -pi, pi);

%punto 5

uno = ones(1, 5);
cer = zeros(1, 5);

xn2 = [uno, cer];


for k = -20: 20
    
    if k == 0
       ckk (21)  = 1/2;
       
    else
        
        ck = 1/10  * (1 -exp(-i*pi*k)) / (1 - exp(-i * 1 / 5 * pi * k));   
        ckk (k + 20 + 1) = ck;
    end
end


figure(4)
stem(-20 : 20, abs(ckk));

%punto 6
figure(5)
stem(-20 : 20, abs(ckk).^2 );

%punto 7

k= 1: 9;
ck2 = 1/10  * (1 -exp(-i*pi*k)) / (1 - exp(-i * 1 / 5 * pi * k));   

s1 = sum(abs(1/2 + ck2)).^2;

s2 = 1/10 * sum(abs(xn2).^2);
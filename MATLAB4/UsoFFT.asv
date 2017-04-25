% Programa para aplicar la FFT a una señal seno con ruido blanco
clear
clc

%Definición de variables
paso=0.001;
t=0:paso:2;
A1=1;
A2=5;
A3=6;
Fs=1/paso;
wo=100;
varianza=0.25;

%Creamos la señal deseada
xS=A*sin(2*pi*wo*t);
ruido=normrnd(0,sqrt(varianza),1,length(xS)); %AWGN
signal=(seno+ruido);
%frec=linspace(0,2*pi,length(signal));
%frec=linspace(0,Fs,length(signal));
frec=linspace(-Fs/2,Fs/2,length(signal));

%Obtenemos la FFT de la señal generada
%espectro_comp=fft(signal);
espectro_comp=fftshift(fft(signal)/length(signal));

%Graficamos la señales generadas
subplot(2,1,1)
plot(t,signal)
xlabel('Tiempo en segundos')
title('Señal en el dominio del tiempo')
grid
subplot(2,1,2)
plot(frec,abs(espectro_comp))
xlabel('Frecuencia en Hz')
title('Espectro de la señal')
grid























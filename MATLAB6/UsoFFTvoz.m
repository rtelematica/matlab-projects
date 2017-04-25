% Programa para aplicar la FFT a una se�al de voz
clear
clc

%Definici�n de variables
Fs=8192;
paso=1/Fs;
longitud=4e4;

%Seleccionamos una se�al de voz
load handel %handel,chirp,train,gong
voz=y(1:longitud);
t=linspace(0,8.9,longitud);

%Obtenemos la FFT de la se�al de voz completa
espectro_comp=fftshift(fft(voz)/length(voz));
frec=linspace(-Fs/2,Fs/2,length(voz));
frec2=linspace(0,Fs/2,length(voz)/2);

%Graficamos las se�ales generadas
subplot(2,1,1)
plot(t,voz)
sound(voz)
xlabel('Tiempo en segundos')
title('Se�al de Voz')
grid
subplot(2,1,2)
%Espectro generado por la funci�n fft
plot(frec,abs(espectro_comp),'r')
xlabel('Frecuencia en Hz')
title('Espectro de la se�al de voz')
grid
pause
%Espectro centrado en el origen
s=abs(fft(voz)/length(voz));
plot(frec2,s(1:length(s)/2))
xlabel('Frecuencia en Hz')
title('Espectro de la se�al de voz')
grid







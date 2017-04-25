clear all;
close all;
clc;
%Grafica del calculo analitico : x(w)=(1-e.^-j*w*5)/(1-e.^-j*w)

w = -10: 0.01 : 10;
Xw = (1 - exp(-1i*w*5))./(1 - exp(-1i*w));
plot(w, abs(Xw));

xlabel('radianes/segundo');
ylabel('Magnitud');
title('DTFT obtenida de forma analitica');
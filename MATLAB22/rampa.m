function[t,ram]=rampa(fm,D)
%La funcion escuni genera un escalon unitario con duracion D/2, en donde D
%es la duracion total de mi vector escu.

%   t -> Vector tiempo
%   escu -> Vector con el escalon unitario
%   fm -> frecuencia de muestreo
%   D -> Duracion total de la señal

t=-D:1/fm:D;
l1=floor(length(t)/2);
ceros=zeros(1,l1);
ts=0:1/fm:D;
ram=[ceros,ts];
plot(t,ram,'r*');
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Escalon Unitario');
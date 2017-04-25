function[t,escu]=escuni(fm,D)
%La funcion escuni genera un escalon unitario con duracion D/2, en donde D
%es la duracion total de mi vector escu.

%   t -> Vector tiempo
%   escu -> Vector con el escalon unitario
%   fm -> frecuencia de muestreo
%   D -> Duracion total de la señal

t=0:1/fm:D+(1/fm);
l1=floor(length(t)/2);
ceros=zeros(1,l1);
unos=ones(1,l1);
escu=[ceros,unos];
plot(t,escu);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Escalon Unitario');
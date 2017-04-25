function[t,E]=sen1(t0,t3)
%La funcion escuni genera un escalon unitario con duracion D/2, en donde D
%es la duracion total de mi vector escu.

%   t -> Vector tiempo
%   fm -> frecuencia de muestreo
%   D -> Duracion total de la se�al
%% sum
T1=t0:1/100:-3-1/100;
T2=-3:1/100:3-1/100;
T3=3:1/100:t3;
ceros=zeros(1,length(T1));
ceros2=zeros(1,length(T3));

ys=sin(6*pi*T2);
y=[ceros,ys,ceros2];
t=[T1,T2,T3];
plot(t,y);
xlabel('tiempo(s)');
ylabel('Amplitud');
title('Seno acotado ');
E=sum(ys.^2)/100;
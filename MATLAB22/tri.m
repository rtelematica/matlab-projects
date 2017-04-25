function [t,tri1]= tri(t1,t2,t3,t4,fm)
%t vector tiempo
%uni vector escalon unitario
%t1 tiempo de la señal
%t2-tiempo de escalon unitario
%t3-tiempo final de la señal
T1=t1:1/fm:(t2-(1/fm))
T2=t2 :(1/fm):t3;
T3=t3:1/fm:t4;
%t4=zeros(1,length(T3));
ceros=zeros(1,length(T1));
unos=ones(1,length(T2));
rampa1 = T2-(t2);
rampa1=[ceros,rampa1]
t=[T1,T3];
plot(t,rampa1)
xlabel('Tiempo')
ylabel('Amplitud')
title('Rampa')
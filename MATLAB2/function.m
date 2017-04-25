function [t,uni]= escuni(t1,t2,t3,fm)
%t vector tiempo
%uni vector escalon unitario
%t1 tiempo de la se�al
%t2-tiempo de escalon unitario
%t3-tiempo final de la se�al
T1=t1:1/fm:(t2-(1/fm))
T2=t2 :(1/fm):t3;
ceros=zeros(1,length(T1));
unos=ones(1,length(T2));
uni=[ceros,unos];
t=[T1,T2];
plot(t,uni)
xlabel('Tiempo')
ylabel('Amplitud')
title('Escalon unitario')
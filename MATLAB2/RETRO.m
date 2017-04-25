

clear all 
close all
clc;
P=-2:0.1:2;
T =1+ sin(pi/4*P)
%plot(T);

% inicializacion aleatoria

W1= randn (2,1);
W2= randn (1,2);
b1= randn (2,1);
b2= randn;

Q= length(P);
alfa=0.9;

for Epocas=1:100;
    for q=1:Q;
        %propagacion hacia adelante
        a1= logsig(W1*P(q)+b1);
        a2(q)= W2*a1+b2;
        %calculo de la sencibilidad 
        e(q)=T(q)-a2(q);
        s2=-2*1*e(q);
        s1= [(1-a1(1))*a1(1) 0; 0 (1-a1(2))*a1(2)]*W2'*s2;
        %actualizaciones de pesos y polarizaciones 
        W1= W1 - alfa*s1*P(q)';
        W2= W2 - alfa*s2*a1';
        b1= b1-alfa*s1;
        b2= b2-alfa*s2;
    end
    %calculo del error cuadratico medio
    ecm(Epocas)=sum(e.^2)/Q; 
    plot(P,a2)
    
end
figure(1);
plot(P,a2,P,T)
figure(2);
plot(1:100,ecm);

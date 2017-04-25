

%retropropagacion


clc
clear al
close all


%pesos sinapticos
P=[-2:0.1:2];

%targets

T=1+sin(pi/4*P);


%inicicializacion

%mnatrices y vectores
W1=randn(2,1);
W2=randn(1,2);
b1=randn(2,1);
b2=rand(1);
Q= length(P);
alfa=0.1; %SE VARIA TIENE QUE ESTAR ABAJO DE 1
for epocas=1:100
    
   for q=1:Q
        %propagacion hacia adelante
        
        a1=logsig(W1*P(q)+b1);
        %funcion lineal lleva purelim
        
        
        a2(q)=W2*a1+b2; %¿tamaño de a2
        
        %calculo d ela sensibilidad
        
        e(q)=T(q)-a2(q);
        s2=-2*1*e(q);
        
        
        
        
        s2=-2*1*(T(q)-a2(q));
        s1= [(1-a1(1))*a1(1) 0; 0 (1-a1(2))*a1(2)]*W2'*s2;
        %ACTUALIZACION DE LOS PESOS SINAPTICOS
        W1=W1-alfa*s1*P(q);
        W2=W2-alfa*s2*a1'; %se transpone
        b1=b1-alfa*s1;
        b2=b2-alfa*s2;
   end
    
   ecm(epocas)=sum(e.^2)/Q;
   
   
end
        
        plot(P,a2,P,T)
        title('aproximacion d ela funcion')
    
        figure(2);
        plot(1:100,ecm);
        title('ERROR CUADRATICO MEDIO')
        
        
        
        
        
        
          
        
        
        
        
        
        
        
        
        
        
        
        

close all;clear all;clc;
%% Definición de variables
mu=180; %seg
lambda=10; % arribos/seg
ln=0.6*lambda;
lh=0.4*lambda;
s=35; %servidores
arribos=10000%00;  %Total de arribos
N=s;
%% Esquema teórico
for B=0:5
    %calculando primer sumatoria
    suma1=1;
    for k=1:(s-B-1)
        suma1=suma1+((((ln+lh)*mu)^k)/(factorial(k)));
    end
    %calculando segunda sumatoria
    suma2=((((ln+lh)*mu)^(s-B))/(factorial(s-B)));
    for k=(s+1-B):s
        suma2=suma2+(((((ln+lh)*mu)^(s-B))*((lh*mu)^(k-(s-B))))/(factorial(k)));
    end
    %calculando Po
    Po=1/(suma1+suma2);
    %calculando Pb
    Pb(B+1)=Po*suma2;
    %calculando Pfh
    Pfh(B+1)=Po*(((((ln+lh)*mu)^(s-B))*((lh*mu)^(B)))/(factorial(s)));
end
%% Esquema practico
for B=0:5
    tiempoarribo=0;  %Arribo inicial
    tiempofin=[exprnd(mu) 0]
    pause()
    bloqueo=0;
    handoff_fallido=0;
    nuevo=0;
    handoff=0;
    for j=2:arribos
        %Generar arribo
        tipo_arribo=binornd(1,ln/lambda);
        if(tipo_arribo==1)  
            nuevo=nuevo+1;
            tiempoarribo(j)=tiempoarribo(j-1)+exprnd(1/(lambda));
            [a,b]=size(tiempofin)
            tiempofin
           
            
            %Verificando si ya se libero algun servidor
            for h=1:a
                if(tiempofin(h,2)==0) %si es 0 ese tiempo aun no libera servidor
                    if(tiempofin(h,1)<tiempoarribo(j))
                        tiempofin(h,2)=1;
                        N(j-1)=N(j-1)+1;
                    end
                end
            end
            if((N(j-1)-B)>0)
                N(j)=N(j-1)-1;
                tiempofin(j,1)=tiempoarribo(j)+exprnd(mu);
                %N(j)=N(j-1)-1;
            else
                bloqueo=bloqueo+1;
                tiempofin(j,1)=10000;
                N(j)=N(j-1);
            end
            j
            tiempoarribo;
            tiempofin;
           
            else
                handoff=handoff+1;
                tiempoarribo(j)=tiempoarribo(j-1)+exprnd(1/(lambda));
                [a,b]=size(tiempofin);  
                tiempofin
                %Verificando si ya se libero algun servidor
                for h=1:a
                    if(tiempofin(h,2)==0) %si es 0 ese tiempo aun no libera servidor
                        if(tiempofin(h,1)<tiempoarribo(j))
                            tiempofin(h,2)=1;
                            N(j-1)=N(j-1)+1;
                        end
                    end
                end
                if(N(j-1)>0)
                    N(j)=N(j-1)-1;
                    tiempofin(j,1)=tiempoarribo(j)+exprnd(mu);
                    %N(j)=N(j-1)-1;
                else
                    handoff_fallido=handoff_fallido+1;
                    tiempofin(j,1)=10000;
                    N(j)=N(j-1);
                end
                j 
                tiempoarribo;
                tiempofin;
             end
         end
         pbp(B+1)=bloqueo/nuevo;
         pfhp(B+1)=handoff_fallido/handoff;
end

figure (1)
title('Probabilidad de bloqueo y transferencia fallida');
xlabel('B (Canales Reservados)');
ylabel('P');
hold on
plot(0:5,Pb,'b');
plot(0:5,Pfh,'--r');
plot(0:5,pbp,'xb');
plot(0:5,pfhp,'or');
legend('Pb teorica','Pfh teorica','Pfh simulada','Pfh simulada');
%hold off;
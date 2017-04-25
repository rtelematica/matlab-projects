%% Transmultiplexor muestra por muestra
clc;
clear all;
format short;


%% Generador de filtros
typeofbasis='0'; %b=biortogonal, o=ortogonal
typbior='bior2.2'; %biortogonal
typor='db2'; %ortogonal

if(typeofbasis == 'b')
    [Rf,Df]=biorwavf(typbior);
    [h0,h1,g0,g1]=biorfilt(Rf,Df);
elseif (typeofbasis=='0')
    [h0,h1,g0,g1]=wfilters(typor);
end
%Para cuatro canales
% g0n2=upsample(g0,2);g0n4=upsample(g0,4);
% g1n2=upsample(g0,2);g1n4=upsample(g0,4);
% 
% h0n2=upsample(h0,2);h0n4=upsample(h0,4);
% h1n2=upsample(h0,2);h1n4=upsample(h0,4);
%
%g=[conv(g0,g0n2);conv(g0,g1n2);conv(g1,g0n2);conv(g1,g1n2)];
%h=[conv(h0,h0n2);conv(h0,h1n2);conv(h1,h0n2);conv(h1,h1n2)];

%Para dos canales
g=[g0; g1];
h=[h0; h1];

%% Declaración de vectores de entrada y vectores intermedios
x1=1:4; %Vector de entrada del primer canal
x2=5:8; %Vector de entrada del segundo canal
Nc=2;   %Número de canales
X=[x1;x2];
N=length(h0); %Número de coeficientes
tamx=length(x1);
Xin=zeros(Nc,2); %Variable de entrada de muestras
Xu=zeros(Nc,N); %Variable después del interpolador
Y=zeros(1,Nc);
Aux=zeros(1,N);
Yhu=zeros(Nc,1);
%% Inicio del transmultiplexor

for n=0:tamx+N-1
    %Entrada de muestras
    if(n<tamx)
        for i=1:Nc
            Xin(i,1)=X(i,n+1);
        end
    else
        for i=1:Nc
            Xin(i,1)=0;
        end
    end
    
    %% Muestra con dato
    Xug=zeros(Nc,Nc);
    for i=1:Nc
        Xu(i,1)=Xin(i,1);
    end
    %Xu
    for r=1:Nc
        for m=1:N
            Xug(r,1)=Xug(r,1)+g(r,m)*Xu(r,m);
        end
    end
    %Corrimiento
    for i=1:Nc
        for j=N:-1:2
            Xu(i,j)=Xu(i,j-1);
        end
    end
    %Dato=Xug
    
    %% Muestras con ceros
    for z=2:Nc
        Xu(:,1)=0;
        %CerosXu=Xu
        for r=1:Nc
            for m=1:N
                Xug(r,z)=Xug(r,z)+g(r,m)*Xu(r,m);
            end
        end
        %Corrimiento
        for i=1:Nc
            for j=N:-1:2
                Xu(i,j)=Xu(i,j-1);
            end
        end  
    end
    %Cero=Xug
    
    %% Suma de los canales
    Y=zeros(1,Nc);
    for i=1:Nc
        for j=1:Nc
            Y(1,i)=Y(1,i)+Xug(j,i);
        end
    end
    %Y
    
    %% Filtro h
    Yh=zeros(Nc,Nc);
    for i=1:Nc
        Aux(1,1)=Y(1,i);
       % Aux
        %Convolución
        for f=1:Nc
           for c=1:N
              Yh(f,i)=Yh(f,i)+h(f,c)*Aux(1,c); 
           end
        end
        %Corrimiento
        for c=N:-1:2
            Aux(1,c)=Aux(1,c-1);
        end
        %Corrimiento=Aux
    end
   % Yh
    
    %% Diezmado
    for i=1:Nc
        Yhd(i,1)=Yh(i,Nc);
        %Yhd(i,1)=Yh(i,Nc);
    end
 Yhd
   
    
end



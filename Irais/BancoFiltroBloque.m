%% Filtros de media banda de análisis y de síntesis
clc;
clear all;
format long;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db2';
if typeofbasis == 'b'
    
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
    
else
    
    [h0,h1,g0,g1] = wfilters(typor);
    
end

%% Introducir señales de entrada

x1=[1:4];
x2=[5:8];
x3=[1:4];
x4=[5:8];
%x5=[1:4];
%x6=[5:8];
%x7=[1:4];
%x8=[5:8];
fD=2; %factor diezmado
fI=2; %factor interpolado

x=[x1
   x2
  x3
  x4
 % x5
 % x6
 % x7
 % x8
]; %señales de entrada

Nc=length(x(:,1)); %numero de canales
Ne=log2(Nc); %número de etapas

%Longitud de la matriz
lx = length(x(1,:));
lf = length(h0);
lmax = lx;

%for i = 1 : Ne 
    %lmax = (lx * 2 + lf ) - 1;   
%end

m(1:Nc,1:lmax) = 0;

% for j = 1 : Nc
%     for i = 1 : lx
%         m(j,i) = x(j,i);
%     end
% end

m=x;
%% Suma
s=0;
suma=0;
for ne=1:Ne 
    
    for nc=1:Nc
        
        if mod(nc,2)== 0
            g=g1;
        else 
            g=g0;
        end
        %m
        s = s + conv(upsample(m(nc,1:length(m(1,:))),fI),g);             
        %s      
        if mod(nc, 2) == 0
               %m(nc,1:lx) = s;                
               %s = 0;
               y(1:(Nc/2),1:lx) = 0;
               %if Nc ~= 2
               %    %% siempre va a ser por g1?
               %s =  conv(upsample(s,fI),g);
               %end
               %antes: lx=length(s)
               ls = length(s);
               y((nc/2),1:ls) = s;
               %s       
               s=0;
        end
        
    end  
   
    m=y;
    Nc=Nc/2;
    
    for n=1:Nc       
        %y(n,:)
       suma = sum(y(n,:),1);
    end
 
end

%% Recuperación


Nc=2;
ss=suma;
%xRec(1:(Nc),1:lx) = 0;

for ne=1:Ne 
    
    for nc=1:Nc
        
        if mod(nc,2)== 0
            h=h1;
        else 
            h=h0;
        end
       
        for i=1:Nc/2
        %cx=conv(suma,h);

        cx=conv(ss(i,:),h) ;
        xr= downsample(cx(Nc:length(cx)),fI)
        %nc      
        lxr = length(xr)
        xRec(nc,1:lxr) = xr
        %pause
        %Nc
        %cx=0;
        end
        
    end
    ss=xRec;
    clear xRec;
    Nc=Nc*2;
       
end


%xRec




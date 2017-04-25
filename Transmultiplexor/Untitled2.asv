%% Transmultiplexor generico forma de arbol

clc;
clear all;
format short;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db2';
if typeofbasis == 'b'
    
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
    
else
    
    [h0,h1,g0,g1] = wfilters(typor);
    
end


%Canales de entrada
Nc = 4;
fases = log2(Nc);

%Señal de entrada
tamX = 4;
ini = 1;
x(1:Nc,1:tamX) = 0;
for j = 1 : Nc
    for i = 1 : tamX
      x(j,i) = ini;
      ini = ini + 1;
    end
end

%Tamaño de la señal
Lx = length(x(1,:));
Lf = length(h0);

%Buffer de interpolado
bi(1:Nc,1:2) = 0;
x_int(1:Nc,1) = 0;

for n = 1 : Lx + Lf - 1
    
    if n <= Lx
        for nc = 1 : Nc
            x_int(nc,1) = x(nc,n);
        end
    else
        x_int(nc,1) = 0;
        
    end
    
    for
        
end



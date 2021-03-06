%% Transmultiplexor
clc
clear all
%Numero de canales
Nc = 2;

%Llamamos a funcion generadora de filtros wavelet
[h0,h1,g0,g1] = filtrosWavelet('db1')
fs = getsinc(fases, length(h0));
pause


%Fases
fases = log2(Nc);

%Tama�o de la se�al de estrada para cada canal
tamX = 3;

%Factor de diezmado
FD = 2;
%Factor de interpolacion
FI = 2;

%Se�ales de entrada: La se�al se genera como una matriz de Nc filas x tamX
%columnas, cada celda de la matriz es igualada a var que se incrementa en
%cada iteracion.
var = 1;
x = 0;
for j = 1 : Nc
    for i = 1 : tamX
        x(j,i) = var;
        var = var + 1;
    end
end
x
pause

%Matriz de fases: Matriz donde se almacenran la suma obtenidoa en cada rama
tamf = length(h0);
tamInt = tamX;
%Se determina el mayor tama�o que puede alcanzar la matriz
for i = 1 : fases     
    tamInt = (tamInt * 2 + tamf ) - 1;    
end

%Inicializamos matriz intermediria
matSumInt(1:Nc, 1:tamInt) = 0;

%Asigamos x a la matriz
matSumInt(1:Nc, 1:tamX) = x;
tamM = tamX;
%Filtrado de sintesis
acusuma = 0;
acufcanal = 2*Nc;
acu = 0;

for  n = 1 : fases
    n
    acufcanal = acufcanal/2;
    fcanal = acufcanal;
    while fcanal > 0
        
        if mod(fcanal,FI) == 0
            display 'g1'
            gint = g1;
        else
            display 'g0'
            gint = g0;
        end
       
        acu = acu + conv(upsample(matSumInt(fcanal, 1:tamM),FI),gint);        
        
        if mod(fcanal+1, FI) == 0                         
            lacu = length(acu);
            matSumInt(fcanal, 1:lacu) = acu
            pause
            acu = 0;            
        end
        
        fcanal = fcanal -1;        
    end        
    
    tamM = (tamM * 2 + tamf ) - 1;    
end

y = matSumInt(1,:)
pause

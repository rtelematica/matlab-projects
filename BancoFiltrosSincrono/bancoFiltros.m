% Implementar usando procesamiento en bloque lo siguiente:
%
% *Banco de filtros con estructura de arbol simetico de 8 canales
%  usando el fitro de wavelet db2
% *Implemente como una estructura paralela
%

clc;
clear all;
format long;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db3';

if typeofbasis == 'b'
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
else
    [h0,h1,g0,g1] = wfilters(typor);
end

%Numero de canales
Nc = 2;
fases = log2(Nc);

%Señal de entrada
x = 1:100;

vector(1:fases) = 0;
uno(1:fases) = 0;
uno(fases) = 1;

%Coeficientes de h general
HH(1:Nc,1:fases*length(h0)) = 0;

h0
h1
g0
g1
pause

lh = length(h0);
lg = length(g0);

for numPar = 1 : Nc        
    
    %Elegimos entre ho y h1 dependiendo de vector    
    for i = 1 : fases
        if vector(i) == 0
            HH(numPar,lh*(i-1)+1 : lh*(i-1)+lh) = h0;            
        else
            HH(numPar,lh*(i-1)+1 : lh*(i-1)+lh) = h1;  
        end
        
    end
    
    %Realizamos convolucion entre los n filtros
    cc = 1;
    for i = 0 : fases-1
        cc = conv(cc, agregaCeros(HH(numPar,lh*i+1 : lh*i+lh),2^i-1));      
    end       
    
    %Agregamos el filtro a la matris h general
    l_cc = length(cc);
    h_gen(numPar,l_cc) = 0;
    h_gen(numPar,:) = cc;
    
    %Aumentamos en 1 vector
    vector = sumabinaria(vector,uno);
    
end


%Coeficientes de g general
vector(1:fases) = 0;
GG(1:Nc,1:fases*length(g0)) = 0;

for numPar = 1 : Nc        
    
    %Elegimos entre ho y h1 dependiendo de vector    
    for i = 1 : fases
        if vector(i) == 0
            GG(numPar,lg*(i-1)+1 : lg*(i-1)+lg) = g0;
        else
            GG(numPar,lg*(i-1)+1 : lg*(i-1)+lg) = g1;
        end
    end       
       
    %Realizamos convolucion entre los n filtros
    cc = 1;
    %ll = fases-1;
    ll = 0;
    for i = 0 : fases-1
        cc = conv(cc, agregaCeros(GG(numPar,lg*i+1 : lg*i+lg),2^ll-1));        
        %ll = ll - 1;
        ll = ll + 1;
    end
    
    %Agregamos el filtro a la matris g general
    l_cc = length(cc);
    g_gen(numPar,l_cc) = 0;
    g_gen(numPar,:) = cc;
    
    %Aumentamos en 1 vector
    vector = sumabinaria(vector,uno);
    
end
display 'Creando archivo'
conversionC(h_gen,g_gen,'CoefHG.cof')
pause
pause
h_gen
pause
g_gen
pause

%Forma paralela
res = 0;

buffer(1:length(h_gen(1,:))) = 0;
buffsin(1:Nc,1:length(h_gen(1,:))) = 0;

numSum = 0;
numMult = 0;
numDes = 0;
numAsig = 0;

display 'INICIA'
pause

y1 = 0;

ind_y = 1;

for n = 1 : length(x) + length(h_gen(1,:)) - 1
    
    if n <= length(x)
        buffer(1) = x(n);
        numAsig = numAsig + 1;
    else
        buffer(1) = 0;
        numAsig = numAsig + 1;
    end
    
    for i = 1 : Nc              
        
        %filtro de analisis
        acu = 0;
        numAsig = numAsig + 1;
        for k = 1 : length(h_gen(1,:))
            acu = acu + buffer(k) * h_gen(i,k);
            
            numMult = numMult + 1;
            numSum = numSum + 1;
            numAsig = numAsig + 1;
        
        end
        
        %diezmado
        if mod(n-1,2^fases) == 0
            dp = acu;
            numAsig = numAsig + 1;
        else
             dp = 0;
             numAsig = numAsig + 1;
        end
        
        %Interpolado
        if mod(n-1,2^fases) == 0
            ip = dp;
            numAsig = numAsig + 1;
        else
            ip = 0;
            numAsig = numAsig + 1;
        end
        
        %filtro de sintesis
                
        buffsin(i,1) = ip;
        numAsig = numAsig + 1;
        
        acu = 0;            
        numAsig = numAsig + 1;
        
        for k = 1 : length(g_gen(1,:))
            acu = acu + buffsin(i,k)*g_gen(i,k);
            
            numMult = numMult + 1;
            numSum = numSum + 1;
            numAsig = numAsig + 1;
        end
        
        %Corrimiento de buffer
        for k = length(buffsin(1,:)) : - 1 : 2
            buffsin(i,k) = buffsin(i,k-1);
            numDes = numDes + 1;
        end
        
        res = res + acu;      
        numAsig = numAsig + 1;
        
    end 
    
%     display 'INFORMACION'
% 
%     numSum
%     numMult
%     numDes
%     numAsig
    
    %Corrimiento de buffer
    for k = length(buffer) : - 1 : 2
        buffer(k) = buffer(k-1);
        numDes = numDes + 1;
    end
    
%     n
 %    res
 
    y1(ind_y) = res;
    ind_y = ind_y + 1;
     
    res = 0;
    numAsig = numAsig + 1;
        
end

y1

display 'INFORMACON'

numSum
numMult
numDes
numAsig


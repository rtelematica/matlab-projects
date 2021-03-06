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

%Se�al de entrada
x = 1:100000;

FD = Nc;
FI = Nc;

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
res(1:FI) = 0;

buffer(1:length(h_gen(1,:))) = 0;

ac_c(1:Nc,1:FI-1) = 0;
ac_m(1:Nc) = 0;

pause()

%Se rellena de ceros la se�al de entrada para que su longitud sea multiplo
%de 2^fases

x = [zeros(1,FD-1) x];
lx = length(x);
x
if mod(lx, Nc) ~= 0
    rell = mod(length(x), 2^fases);
    nz = 2^fases - rell;
    
    x = [ x zeros(1,nz) ];
end
x
pause
%Rellenamos filtro g_gen

g_gen
if mod(length(g_gen(1,:)), FI) ~= 0
    g_gen = [g_gen zeros(Nc,FI-mod(length(g_gen(1,:)),FI))];
end

g_gen
pause

buffsin_c(1:Nc,1:FI-1,1:length(h_gen(1,:))) = 0;
buffsin_m(1:Nc,1:length(h_gen(1,:))) = 0;
pause

nn = 0;


tamanio = length(x) + length(h_gen(1,:)) - 1
pause

%Contadores
numSum = 0;
numMult = 0;
numDes = 0;
numAsig = 0;

y2 = 0;
ind_y = 1;
display 'INICIO'
pause
for n = 1 : FD : length(x) + length(h_gen(1,:)) - 1
    
    if n + FD - 1 <= length(x)
        for in = 1 : FD
            buffer(in) = x(n + FD-in);
            numAsig = numAsig + 1;
        end
    else
        for in = 1 : FD
            buffer(in) = 0;
            numAsig = numAsig + 1;
        end
    end
    
   
    for i = 1 : Nc                      
        
        nn = 1;
        numAsig = numAsig + 1;
        
        %filtro de analisis seguido de diezmado conjunto                
        ac = 0;
        numAsig = numAsig + 1;
        
        for k = 1 : length(h_gen(1,:))
            ac = ac + buffer(k) * h_gen(i,k);
            
            numSum = numSum + 1;
            numMult = numMult + 1;
            numAsig = numAsig + 1;
        end

        
        %filtro de sintesis
            
        buffsin_m(i,1) = ac;
        numAsig = numAsig + 1;
        
        ac_c(i,1:FI-1) = 0;
        numAsig = numAsig + 1;
        ac_m(i) = 0;
        numAsig = numAsig + 1;
        
        for k = 1 : length(h_gen(1,:))/FI

            for nc = 1 : FI-1
                ac_c(i,nc) = ac_c(i,nc) + buffsin_c(i,nc, FI*(k-1)+nc+1) * g_gen(i,FI*(k-1)+nc+1);
                numSum = numSum + 1;
                numMult = numMult + 1;
                numAsig = numAsig + 1;
            end

            ac_m(i) = ac_m(i) + buffsin_m(i,FI*k-(FI-1)) * g_gen(i,FI*k-(FI-1));
            
            numSum = numSum + 1;
            numMult = numMult + 1;
            numAsig = numAsig + 1;
        
        end

        %Dezplazamos buffer FI posiciones
        for ir = length(h_gen(1,:)) : -1 : FI+1
            for nc = 1 : FI - 1
                buffsin_c(i,nc,ir) = buffsin_c(i,nc,ir-FI);
            end
            buffsin_m(i,ir) = buffsin_m(i,ir-FI);
            numDes = numDes + 1;
        end

        for nc = 1 : FI-1
            buffsin_c(i,nc, nc+1) = buffsin_m(i,FI+1);
            numAsig = numAsig + 1;
        end
    
        for ic = 1 : FI-1
            res(nn) = res(nn) + ac_c(i,ic);
            nn = nn + 1;
            
            numSum = numSum + 2;
            numAsig = numAsig + 2;
            
        end
        res(nn) = res(nn) + ac_m(i);
                
        numSum = numSum + 2;
        numAsig = numAsig + 2;
                
    end 
    
%     display 'INFORMACION'
% 
%     numSum
%     numMult
%     numDes
%     numAsig
%     
%     pause
    
    %Dezplazamos buffer FD posiciones
    for i = length(g_gen(1,:)) : -1 : FD + 1
        buffer(i) = buffer(i-FD);       
        numDes = numDes + 1;
    end
    
    %n
    %res(FI)
    
    for nres = 1 : Nc
        y2(ind_y) = res(nres);
        ind_y = ind_y + 1;
    end
    
    res(1:FI) = 0;
        
end

%FALTA GUARDAR TODO EN Y2
y2

display 'INFORMACION'

numSum
numMult
numDes
numAsig
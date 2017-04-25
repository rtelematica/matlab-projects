%% Prueba filtrado-diezmado interpolado-diezmado conjunto muestra x muestra

clear all
fil = [ 1 : 5];
fil2 = [ 1: 7];
x = [1:7];

FD = 3;
FI = 3;

numSum = 0;
numMult = 0;
numAsig = 0;
numDes = 0;


%Filtrado seguido de diezmado
buff(1:length(fil)) = 0;
ac = 0;
vv = 0;

x = [zeros(1,FD-1) x];
if mod(length(x),FD) ~= 0
    x = [x zeros(1,FD-mod(length(x), FD))];
end

ind_v = 1;

%Filtrado seguido de interpolado
ac_c(1:FI-1) = 0;
ac_m = 0;
v2 = 0;

if mod(length(fil),FI) ~= 0
    fil2 = [fil2 zeros(1,FI-mod(length(fil2),FI))];
end

buff_c(1:FI-1,1:length(fil2)) = 0;
buff_m(1:length(fil2)) = 0;

nn = 1;

for n = 1 : FD : length(x) + length(fil) - 1 + 5
    
    if n + FD - 1 <= length(x)
        for in = 1 : FD
            buff(in) = x(n + FD-in);
            numAsig = numAsig + 1;
        end
    else
        for in = 1 : FD
            buff(in) = 0;
            numAsig = numAsig + 1;
        end
    end
    
    ac = 0;
    
    for k = 1 : length(fil)
        ac = ac + buff(k) * fil(k);
        
        numSum = numSum + 1;
        numMult = numMult + 1;
        numAsig = numAsig + 1;
    end
    
    %Dezplazamos buffer FD posiciones
    for i = length(fil) : -1 : FD + 1
        buff(i) = buff(i-FD);
        numDes = numDes + 1;
    end
   
    %Sintesis
    buff_m(1) = ac;
        numAsig = numAsig + 1;
    
    ac_c(1:FI-1) = 0;
    numAsig = numAsig + 1;
    ac_m = 0;
    numAsig = numAsig + 1;
    for k = 1 : length(fil2)/FI
        
        for nc = 1 : FI-1
            ac_c(nc) = ac_c(nc) + buff_c(nc, FI*(k-1)+nc+1) * fil2(FI*(k-1)+nc+1);
        
            numSum = numSum + 1;
            numMult = numMult + 1;
            numAsig = numAsig + 1;
        end
        
        ac_m = ac_m + buff_m(FI*k-(FI-1)) * fil2(FI*k-(FI-1));
        
        numSum = numSum + 1;
        numMult = numMult + 1;
        numAsig = numAsig + 1;
        
    end
    
    %Dezplazamos buffer FI posiciones
    for i = length(fil2) : -1 : FI+1
        for nc = 1 : FI - 1
            buff_c(nc,i) = buff_c(nc,i-FI);
            numDes = numDes + 1;
        end
        buff_m(i) = buff_m(i-FI);
        numDes = numDes + 1;
    end
    
    for nc = 1 : FI-1
        buff_c(nc, nc+1) = buff_m(FI+1);
        numAsig = numAsig + 1;
    end
    
    for i = 1 : FI-1
        v2(nn) = ac_c(i);
        nn = nn + 1;
    end
    
    v2(nn) = ac_m;
    nn = nn + 1;
end

v2

display 'INFO 2'
numSum
numMult
numAsig
numDes
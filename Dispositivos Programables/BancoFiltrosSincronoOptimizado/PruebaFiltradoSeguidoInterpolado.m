%% Prueba filtrado seguido de interpolado
clc
clear all
FI = 2;

fil = [ 1:8];
x = [1:20];

%Interpolador
v = upsample(x,FI);

%Filtrado
y = conv(fil, v);

buf(1:length(fil)) = 0;
a = 0;
yy = 0;

numSum = 0;
numMult = 0;
numAsig = 0;
numDes = 0;

for i = 1 : length(v) + length(fil) - 1
    
    if i <= length(v)
        buf(1) = v(i);
        numAsig = numAsig + 1;
    else
        buf(1) = 0;
        numAsig = numAsig + 1;
    end
    
    a = 0;
    numAsig = numAsig + 1;
    for k = 1 : length(fil)
        a = a + fil(k) * buf(k);
        
        numSum = numSum + 1;
        numMult = numSum + 1;
        numAsig = numAsig + 1;
        
    end
    
    for d = length(fil) : -1 : 2
        buf(d) = buf(d-1);
        numDes = numDes + 1;
    end
    yy(i) = a;
end
y
yy
pause

display 'INFORMACION 1'
numSum
numMult
numAsig
numDes
pause


%Filtrado seguido de interpolado
ac_c(1:FI-1) = 0;
ac_m = 0;
vv = 0;

if mod(length(fil),FI) ~= 0
    fil = [fil zeros(1,FI-mod(length(fil),FI))];
end

buff_c(1:FI-1,1:length(fil)) = 0;
buff_m(1:length(fil)) = 0;

nn = 1;
numSum = 0;
numMult = 0;
numAsig = 0;
numDes = 0;

for n = 1 : length(x) + length(fil) - 1
   
    if n <= length(x)
        buff_m(1) = x(n);
        numAsig = numAsig + 1;
    else
        buff_m(1) = 0;
        numAsig = numAsig + 1;
    end
    
    ac_c(1:FI-1) = 0;
    numAsig = numAsig + 1;
    ac_m = 0;
    numAsig = numAsig + 1;
    for k = 1 : length(fil)/FI
        
        for nc = 1 : FI-1
            ac_c(nc) = ac_c(nc) + buff_c(nc, FI*(k-1)+nc+1) * fil(FI*(k-1)+nc+1);
        
            numSum = numSum + 1;
            numMult = numMult + 1;
            numAsig = numAsig + 1;
        end
        
        ac_m = ac_m + buff_m(FI*k-(FI-1)) * fil(FI*k-(FI-1));
        
        numSum = numSum + 1;
        numMult = numMult + 1;
        numAsig = numAsig + 1;
        
    end
    
    %Dezplazamos buffer FI posiciones
    for i = length(fil) : -1 : FI+1
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
        vv(nn) = ac_c(i);
        nn = nn + 1;
    end
    
    vv(nn) = ac_m;
    nn = nn + 1;
end

display 'INFORMACION 2'
numSum
numMult
numAsig
numDes
pause
y
vv


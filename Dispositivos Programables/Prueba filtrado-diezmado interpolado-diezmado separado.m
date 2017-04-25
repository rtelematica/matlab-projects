%% Prueba filtrado-diezmado interpolado-diezmado separado

fil = [ 1 : 5];
x = [1:10];

buf(1:length(fil)) = 0;
a = 0;

for i = 1 : length(x) + length(fil) - 1
    
    if i <= length(x)
        buf(1) = x(i);
 %       numAsig = numAsig + 1;
    else
        buf(1) = 0;
%        numAsig = numAsig + 1;
    end
    
    a = 0;
    numAsig = numAsig + 1;
    for k = 1 : length(fil)
        a = a + fil(k) * buf(k);
        
%         numSum = numSum + 1;
%         numMult = numSum + 1;
%         numAsig = numAsig + 1;
        
    end
    
    for d = length(fil) : -1 : 2
        buf(d) = buf(d-1);
        %numDes = numDes + 1;
    end
    yy(i) = a;
end
y = conv(x,fil)
yy


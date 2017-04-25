%% Prueba filtrado seguido de diezmado
clc
FD = 2  ;

fil = [ 1 2 3 4 5 6 ];
x = ( 1 : 15 );

%Filtrado
v = conv(fil, x);

%Diezmado
y = downsample(v,FD);

%Filtrado seguido de diezmado
buff(1:length(fil)) = 0;
ac = 0;
vv = 0;

x = [zeros(1,FD-1) x];
if mod(length(x),FD) ~= 0
    x = [x zeros(1,FD-mod(length(x), FD))];
end

ind_v = 1;
for n = 1 : FD : length(x) + length(fil) - 1
    
    if n + FD - 1 <= length(x)
        for in = 1 : FD
            buff(in) = x(n + FD-in);
        end
    else
        for in = 1 : FD
            buff(in) = 0;
        end
    end
    
    ac = 0;
    for k = 1 : length(fil)
        ac = ac + buff(k) * fil(k);
    end
    
    %Dezplazamos buffer FD posiciones
    for i = length(fil) : -1 : FD + 1
        buff(i) = buff(i-FD);
    end
   
    vv(ind_v) = ac;
    ind_v = ind_v + 1;
end
y
vv




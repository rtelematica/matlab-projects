clear all;
format short;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db1';

if typeofbasis == 'b'
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
else
    [h0,h1,g0,g1] = wfilters(typor);
end


x = 1:10;
lx = length(x);
lf = length(h0);

buf(1:lf) = 0;
buf1(1:lf) = 0;

for n = 1 : lx + lf - 1
    
    if n <= lx
        buf(1) = x(n);
    else
        buf(1) = 0;
    end
    
    acu1 = 0;
    acu2 = 0;
    for k = 1 : lf
        acu1 = acu1 + buf(k) * h0(k);
        acu2 = acu2 + buf(k) * h1(k);
    end
    n
    if mod(n-1,2) == 0
        
        buf1(1) = acu1;
        
        acu3 = 0;
        acu4 = 0;
        for k = 1 : lf
            acu3 = acu3 + buf1(k) * h0(k);
            acu4 = acu4 + buf1(k) * h1(k);
        end
        acu2
        acu3
        acu4
        pause
        
    else
        clear acu3;
        clear acu4;
        acu2
        acu3 = 'null'
        acu4 = 'null'
        pause
        continue;
    end
        
    
end



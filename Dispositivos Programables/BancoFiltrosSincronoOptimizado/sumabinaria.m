function y = sumabinaria(x,n)

    acu = 0;
    s = 0;
    r = 0;
    for i = length(x) :-1: 1
        
        s = x(i) + n(i) + acu;
        
        %Se comprueba si es par o impar
        
        if mod(s,2) == 0 %es par
            r(i) = 0;
            acu = s/2;
        else %es impar
            r(i) = 1;
            acu = (s-1)/2;
        end
        
    end
    
    y = r;

end
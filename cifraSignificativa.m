function y = cifraSignificativa(x, n)

    fact = 10^n;
    fx = fact * x;
    
    rx = floor(fx);
    
    if mod(rx,10) == 0
        y = 0;
    end
    
    cont = 1;
    crx = rx;
    for i = 1 : 9
        crx = crx - 1;
        if mod(crx, 10) == 0
            y = cont;
            return;
        end
        cont = cont +1;
    end   

    return,
end
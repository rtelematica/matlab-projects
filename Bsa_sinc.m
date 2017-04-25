

function y = Bsa_sinc (s,a)

    if s == 0
        
        y=1;
        return
    end    
    
    y = Bsa_sinc(s-1,a) / ((s/a) + Bsa_sinc (s-1,a) );
    
        
end

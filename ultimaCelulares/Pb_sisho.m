
function y = Pb_sisho(s,B,lmbN,lmbH,mu)

PB1=0;
P01=0;
P02=0;

    for k=0:s-B-1
        
       P01 = P01 + (((lmbN+lmbH)*mu)^k)/(factorial(k));

    end
    
    
    for k=(s-B):s

       P02 = P02 + ((((lmbH+lmbN)*mu)^(s-B))*((lmbH*mu)^(k-(s-B))))/(factorial(k));
            
    end

    P0 = (P01+P02)^(-1);
    
    
    for k=(s-B):s
        
        
        PB1 = PB1 + ((((lmbN+lmbH)*mu)^(s-B))*((lmbH*mu)^(k-(s-B))))/(factorial(k));        
        
    end    
    
    
    y = P0 * PB1
    
end
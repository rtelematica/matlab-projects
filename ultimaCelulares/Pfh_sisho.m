function y = Pfh_sisho(s,B,lmbN,lmbH,mu)

P01=0;
P02=0;

    for k=0:(s-B-1) 
        
       P01 = P01 + (((lmbN+lmbH)*mu)^k)/(factorial(k));

    end
    
    
    for k=(s-B):s

       P02 = P02 + ((((lmbH+lmbN)*mu)^(s-B))*((lmbH*mu)^(k-(s-B))))/(factorial(k));
               
    end

    P0= (P01+P02)^-1;
    
    
    y = P0 *  (((lmbN+lmbH)*mu)^(s-B))*((lmbH*mu)^B)/(factorial(s))
    
end
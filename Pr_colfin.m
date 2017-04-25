function y = Pr_colfin(s,a,K)

P01=0;
    P02=0;

    for k=0:(s-1) 

    
       P01 = P01 + a^k / factorial(k);

    end
    
    
    for k=s:(s+K)

       P02 = P02 + a^k / ((s^(k-s))*factorial(s));
            
    end

    P0= (P01+P02)^-1;
    
    y = P0 * (((a^s)/factorial(s))*((1-(a/s)^K)/(1-(a/s))));
    
end
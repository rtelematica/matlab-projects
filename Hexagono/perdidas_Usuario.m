function p = perdidas_Usuario( disUser, SIGMA, OPC )

    per = 0;
    Bi = 3;
    hb = 30;
    hm = 1.5;
    
    
    for i = 1 : length(disUser)
        
        %Ls
        
        %Ls = desEst * randn(1);
        if OPC == 0
            Ls = 0;
        else
            Ls = normrnd(0,SIGMA,1); 
        end
        
        per(i) = 10*Bi*log10(disUser(i)) - 20*log10(hb) - 20*log10(hm)+ Ls;
        
    end
    p = per;
end
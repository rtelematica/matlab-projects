function z = probabilidad_Cobertura( perdidas_User, Lth )

    NA = 0;
    N = length(perdidas_User);
    for i = 1 : N
        
        if perdidas_User(i) < Lth
            NA = NA + 1;
        end
        
    end
    
    z = NA / N;
    
end
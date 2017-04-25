function [sf] = getsinc(n_etapas, L)

% Experimentally obtained synchronization factors

if(n_etapas == 1)
    sf = 2;

elseif (n_etapas == 2)
    sf = L;

elseif L == 4    
    if(n_etapas == 3) % 8 branches
        sf = 22;
    elseif(n_etapas == 4) % 16 branches
        sf = 36;
    elseif(n_etapas == 5) % 32 branches
        sf = 82;
    end
    
elseif L == 6
    if n_etapas == 3 % 8 branches
        sf = 20;
    elseif n_etapas == 4 % 16 branches
        sf = 30;
    elseif n_etapas == 5 % 32 branches
        sf = 80;
    end
    
elseif L == 8
    if(n_etapas == 3) % 8 branches
        sf = 26;
    elseif(n_etapas == 4) % 16 branches
        sf = 32;        
    end
    
elseif L == 10
    if(n_etapas == 1)
        sf = 2;
    elseif(n_etapas == 2)
        sf = 10;
    end
end
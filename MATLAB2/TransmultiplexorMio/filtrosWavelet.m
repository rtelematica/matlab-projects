function [h0,h1,g0,g1] = filtrosWavelet(db)
    
    typeofbasis = 'o';
    typbior = 'bior2.2';
    typor = db;

    if typeofbasis == 'b'
        [Rf,Df] = biorwavf(typbior);
        [h0,h1,g0,g1] = biorfilt(Rf,Df);
    else
        [h0,h1,g0,g1] = wfilters(typor);
    end

end
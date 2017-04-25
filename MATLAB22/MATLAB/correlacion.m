function rxh = correlacion(x, h)

tamanioX = length( x );
tamanioH = length( h );

if ( tamanioX == tamanioH )
    
    seniF = x;  % señal fija
    seniM = h;  % señal que se mueve
   
elseif ( tamanioX > tamanioH )
    
    % la señal de menor longuitud es la que se mueve -> seni1
    
    seniM = h;
    seniF = x;
    
else
    
    seniM = x;
    seniF = h;
    
end;


for l = 0 : tamanioX + tamanioH - 1
    
    for i = 0: 
    correl[l+1] = 
    
    corr[l] = E 
    
end;
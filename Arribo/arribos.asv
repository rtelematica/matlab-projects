clear all;close all;
%% Simulacion 


%variables
    
    a=0;    %vector de arritbos de llamadas
    f=0;    %vector de fines de llamadas
    b=0;    %contador de bloqueos
    ta=0;   %controlador de tiempo de arribos
    tf=0;   %controlador de tiempo de fines
    N=3;    %numero de servidores
    Na=100; %numero de arribos
    t=0;     %tiempo global    
    
while i < Na
    
    %Ordenar cronologicamente
       
    %Generar arribo    
    ta=ta+rand(1) %lamda =1
    
    i=i+1;    
    %Si hay servidores    
    if ((t==ta)&&(N > 0))
        %Asigno servidor
        N=N-1;
        %Genero final de llamada
        tf= ta+rand+tf; %mu=1
            %Libero el servidor
            if (t == tf)
               N=N+1; 
            end    
    %si no 
    else
        %Contamos bloqueos
        b=b+1;
        
    end
                
end     

%Probabilidad de bloqueos
    a
    Pb = b/length(Na)
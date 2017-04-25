clear all;close all;

%% Hex�gono aislado

No_Rep = 1e2;%no. repeticiones

%Eb/No
W=1.25e6;
R=8e3;
Gp=W/R;%Ganancia de procesamiento
No_BERma=0;
et_s = 0.7943;
j=1;


x0 = 0;
y0 = 0;

r = 80;
%N = 1;
Nivel = 1; 

DELTA = 0.1;


for N=30:32 %Usuarios
    
    No_BERma=0;
    for nr = 1 : No_Rep 
        
        ua=0;%Factor de actividad de voz
        for i = 1 : N
            bt=rand();
            if(bt < 0.3750)
               ua = ua + 1;
            end   
        end   
 
        %Energ�a de bit/Densidad espectral de interferencia 
        res = escenario_interferencia( x0, y0, r, N, Nivel, DELTA );
        Eb_No = Gp/(ua + res);

        if Eb_No < 5

            No_BERma = No_BERma + 1;%No.repeticiones Eb_No<5

        end
    end

    P_BER(j)= No_BERma / No_Rep;%Probabilidad de enlace no aceptable

    j = j + 1;

end

%Gr�ficamos

semilogy(30:32,P_BER)
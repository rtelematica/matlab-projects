clear all;close all;

%% Hexágono aislado

No_Rep = 1e5;%no. repeticiones

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
DELTA = 1;
Nivel = 1; 

ra = [ rand() rand() rand() rand() rand() rand() rand()];

miArchivo = fopen('miResultado.txt', 'w');
if miArchivo == -1
    fopen('miResultado.txt', 'w');
    ferror(miArchivo)
end

if miArchivo == -1
    display('Error al leer/escribir el archivo');
    return
end

N1 = 30 :2: 40;
por = 0;

fprintf('Progreso. %d: %d', 30, por);
        
for N2 = 30 :2: 40 %Usuarios
   
    No_BERma=0;
    por = 0;
    for nr = 1 : No_Rep 
    
         if mod(nr, No_Rep*0.0001) == 0
             clc
             por = por + 0.01;
             fprintf('Progreso. %d: %.2f ', N2, por);
 
         end
         
        ua=0;%Factor de actividad de voz
        for i = 1 : N2
            bt=rand();
            if(bt < 0.3750)
               ua = ua + 1;
            end   
        end   
 
        %Energía de bit/Densidad espectral de interferencia 
        %   res = escenario_interferencia2( x0, y0, r, N2, DELTA, ua, ra);
        res = escenario_interferencia( x0, y0, r, N2, DELTA, ua);
        Eb_No = Gp/(ua + res+et_s);

        if Eb_No < 5

            No_BERma = No_BERma + 1;     %No.repeticiones Eb_No<5

        end
    end

    P_BER(j)= No_BERma / No_Rep;    %Probabilidad de enlace no aceptable

    fprintf(miArchivo, 'N = %d - PBER = %f\n ', N2, P_BER(j));
    
    j = j + 1;
   
end

if fclose(miArchivo) == -1
    display('Error al cerrar el archivo');
else
    display('El archivo se cerro exitosamente');
        
end

%Gráficamos

semilogy(N1,P_BER)
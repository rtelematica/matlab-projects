
function simulacion()

clear all

%Se realiza la simulacion para Z arribos, el algoritmo particiona a 
%2*M(arribos y finales ordenados cronologicamente) en Q
%partes, donde Q contiene N elementos (arribos y finales). La idea es que N sea lo bastante grande
%para despreciar el efecto que se tiene entre los ultimos arribos de una
%particion y los principales de la siguiente. Pues podr�a surgir el caso
%donde un arribo que se encuentra en la partici�n Qi pudier� tener su final
%en la particion Qi+1, esto ser�a un problema dado que el algoritmo no
%identificar�a su final. A lo m�s se tendr�n Q + dQ casos como este, donde
%dQ son los arribos extra a la particion Qi que tambi�n tienen su final en 
%la particion Qi+1 (osea que m�s de un arribo en la particion Qi tengan su 
%final en Qi+1). Asi si Q es bastante pequ�o (N muy grande) el efecto
%podria conciderarse despresiable para los fines de la simulaci�n.

Z = 100000;
N = 100000;  %Numero de arribos, 2N ser� el numero de elementos en la partici�n

%Parametros variables
S = 35;  %Numero de servidores
%B = 5;
lambda = 10;  

u = 180;  %Duraci�n promedio de llamadas.

H = 0;

num_aN = 1;
num_aH = 0;

acu_no_arribo = 0;
acu_no_aN = 0;
acu_no_aH = 0;

B_aN = 0;
N_aH = 0;

for B = 0 : 5
    B
    for particion = 1 : Z/N
        particion    
%         if mod(particion, 1000) == 0
%             particion
%         end
%         

        %Se generan N arribos que se almacenan en el vector A con sus respectivos
        %finales (vector F)
        A = 0;   %El tiempo del primer arribo siempre es cero.
        F = 0;
        F = exprnd(u);   
        H = 0;
        H = 1;   %1-Arribo N, 0-Arribo H
        FH = 0;
        FH = 1;
        for i = 2 : N

            A(i) = A(i-1) + exprnd(1/lambda);  %Se generan tiempos de arribo
            F(i) = A(i) + exprnd(u);  %Se generan tiempo de fin para cada arribo.

            if randi(10) > 4    %ARRIBO NORMAL
                H(i) = 1;  
                FH(i) = 1;  
                num_aN = num_aN + 1;
                
            else  %ARRIBO HANDOFF
                H(i) = 0;  %Se generan tiempos de arribo
                FH(i) = 0;  %Se generan tiempo de fin para cada arribo.

                num_aH = num_aH + 1;
            end


        end

        aux = 0;
        %Se ordena el vector F mediante el m�todo de la burbuja
        Fp=0;
        Fp = 1 : N;  %Se genera un vectror de posiciones referentes al vector F
        for j = 1 : length(F)-1
            for i = 1 : length(F)- j
                if F(i) > F(i+1)
                    %Se interambia el valor si F(i) > F(i+1)
                    aux = F(i);     
                    F(i) = F(i+1);
                    F(i+1) = aux;

                    %Se intercambia la posicion si F(i) > F(i+1), esto para saber
                    %donde quedaron los finales referentes a cada arribo.
                    aux = Fp(i);
                    Fp(i) = Fp(i+1);
                    Fp(i+1) = aux;

                    %Se intercambia la posicion si F(i) > F(i+1), esto para saber
                    %si es final normal o handoff
                    aux = FH(i);
                    FH(i) = FH(i+1);
                    FH(i+1) = aux;


                end        
            end
        end

        %AF es la concatenacion de los vectores A y F ordenados cronologicamente
        AF = 0;
        AF = A;  %Iniciamos suponiendo que AF es A para despues ir agregando los 
                 %elementos de F.


        HFH = 0;
        HFH = H;

        AFp = 0;         
        AFp = 1 : N;  %Se genera un vector de posicion para AF, se observa que son 
                      %las posiciones refrentes a los arribos
        AFc = 0;
        AFc(1:N) = 1;

%         AAFc=length(AFc)
%         pause
%         
        %Generamos el vector A_F
        k = 0;
        M = N;

        AUX = 0;
        for i = 1 : N
            for j = k+1 : M
                if j~=M & F(i) >= AF(j) & F(i) <= AF(j+1) 

                    AUX = [AF(1:j) F(i) AF(j+1:M)];
                    AF = AUX;

                    AUX = [AFp(1:j) Fp(i) AFp(j+1:M)];                     
                    AFp = AUX;

                    AUX = [AFc(1:j) 0 AFc(j+1:M)];                     
                    AFc = AUX;

                    AUX = [HFH(1:j) FH(i) HFH(j+1:M)];
                    HFH = AUX;

                    k = j;
                    M = M+1;

                    break;
                elseif j == M
                    if F(i) >= AF(j)

                        AUX = [AF F(i)];
                        AF = AUX;

                        AUX = [AFp Fp(i)];
                        AFp = AUX;

                        AUX = [AFc 0];
                        AFc = AUX;

                        AUX = [HFH FH(i)];
                        HFH = AUX;

                    end                   
                end
            end
        end

        no_aN = 0;
        no_aH = 0;

        %Se tiene ordenado a AF y AFp
        cent = 0;
        nf = 0;
        l = 0;
        no_arribo=0;
        %S = 3;
        AFs=0;
        
%         length(AFc)
%         pause

        for i = 1 : length(AFc)
            cent = 0;
            if AFc(i) == 1

                if S > B
                    S = S - 1;
                    AFs(i) = S;

                elseif S <= B & S > 0

                    if HFH(i) == 0
                        S = S - 1;
                        AFs(i) = S;
                        
                    else
                        no_arribo = no_arribo + 1;
                        
                        no_aN = no_aN + 1;

                        AFs(i) = -2;

                        %marcamos ese arribo para que no haga nada cuando encuentre su
                        %fin
                        l = l + 1; 
                        nf(l) = i;
                        
                    end

                else %marcamos el arribo que no entra
                    no_arribo = no_arribo + 1;

                    if HFH(i) == 1
                        no_aN = no_aN + 1;
                    else
                        no_aH = no_aH + 1;
                    end
                    AFs(i) = -2;

                    %marcamos ese arribo para que no haga nada cuando encuentre su
                    %fin
                    l = l + 1; 
                    nf(l) = i; 
                    

                end
            else
                
                for j = 1 : length(nf)
                    if l~=0 & AFp(i) == AFp(nf(j)) 
                        cent = 1;    
                        AFs(i) = -1;
                
                        %quitamos j de la lista
                
                        break
                    end
                end
                
                if cent == 0
                    S = S + 1;
                    AFs(i) = S;
                    cent = 0;
                end
            end
        end

        acu_no_arribo = acu_no_arribo + no_arribo;
        acu_no_aN = acu_no_aN + no_aN;
        acu_no_aH = acu_no_aH + no_aH;

    end
    
    P_aN(B+1) = acu_no_aN / num_aN;
    P_aH(B+1) = acu_no_aH / num_aH;


end

 plot(0:5, P_aN, 'x')
 hold on
 plot(0:5, P_aH, 'o')

%   AF
%   AFp
%   AFc
%   AFs
%   HFH
%   no_arribo
%   acu_no_arribo
%   Z
%   
  
 p1 = acu_no_arribo/Z
 
%  acu_no_aN
%  num_aN
 p2 = acu_no_aN / num_aN
 
%  acu_no_aH
%  num_aH
 p3 = acu_no_aH / num_aH
 
end
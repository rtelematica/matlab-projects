

%Se realiza la simulacion para Z arribos, el algoritmo particiona a 
%2*M(arribos y finales ordenados cronologicamente) en Q
%partes, donde Q contiene N elementos (arribos y finales). La idea es que N sea lo bastante grande
%para despreciar el efecto que se tiene entre los ultimos arribos de una
%particion y los principales de la siguiente. Pues podría surgir el caso
%donde un arribo que se encuentra en la partición Qi pudierá tener su final
%en la particion Qi+1, esto sería un problema dado que el algoritmo no
%identificaría su final. A lo más se tendrán Q + dQ casos como este, donde
%dQ son los arribos extra a la particion Qi que también tienen su final en 
%la particion Qi+1 (osea que más de un arribo en la particion Qi tengan su 
%final en Qi+1). Asi si Q es bastante pequño (N muy grande) el efecto
%podria conciderarse despresiable para los fines de la simulación.

%Z = 1e6;

N = 100000;  %Numero de arribos, 2N será el numero de elementos en la partición
S = 3;  %Numero de servidores
lambda = 1;  %Tasa de arribos.
u = 1;  %Duración promedio de llamadas.

%Se generan N arribos que se almacenan en el vector A con sus respectivos
%finales (vector F)
A = 0;   %El tiempo del primer arribo siempre es cero.
F = exprnd(u);   
for i = 2 : N
    A(i) = A(i-1) + exprnd(1/lambda);  %Se generan tiempos de arribo
    F(i) = A(i) + exprnd(u);  %Se generan tiempo de fin para cada arribo.
    
end

%Se ordena el vector F mediante le método de la burbuja
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
            
        end        
    end
end

%AF es la concatenacion de los vectores A y F ordenados cronologicamente
AF = A;  %Iniciamos suponiendo que AF es A para despues ir agregando los 
         %elementos de F.
         
AFp = 1 : N;  %Se genera un vector de posicion para AF, se observa que son 
              %las posiciones refrentes a los arribos
AFc(1:N) = 1;

%Generamos el vector A_F
k = 0;
M = N;

for i = 1 : N
    for j = k+1 : M
        if j~=M & F(i) >= AF(j) & F(i) <= AF(j+1) 
            
            AUX = [AF(1:j) F(i) AF(j+1:M)];
            AF = AUX;
  
            AUX = [AFp(1:j) Fp(i) AFp(j+1:M)];                     
            AFp = AUX;
            
            AUX = [AFc(1:j) 0 AFc(j+1:M)];                     
            AFc = AUX;
                                        
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
            end                   
        end
    end
end

%Se tiene ordenado a AF y AFp
cent = 0;
nf = 1;
l=0;
no_arribo=0;
%S = 3;
AFs=0;
for i = 1 : length(AFc)
    cent = 0;
    if AFc(i) == 1
        if S>0
            S = S - 1;
            AFs(i) = S;
        else %marcamos el arribo que no entra
            no_arribo = no_arribo + 1;
            AFs(i) = -2;
            
            %marcamos ese arribo para que no haga nada cuando encuentre su
            %fin
            l = l + 1; 
            nf(l) = i; 
   
        end
    else
        for j = 1 : length(nf)
            if AFp(i) == AFp(nf(j)) & l~=0 
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

AF
AFp
AFc
AFs
no_arribo
p = no_arribo/N
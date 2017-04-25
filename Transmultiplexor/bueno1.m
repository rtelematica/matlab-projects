%% Transmultiplexor

clc;
clear all;
format short;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db4';
if typeofbasis == 'b'
    
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
    
else
    
    [h0,h1,g0,g1] = wfilters(typor);
    
end

%Señal de entrada
x1 = [1 2 3 4];
x2 = [5 6 7 8];

%buffer de diezmado
bi1 = zeros(1:2);
bi2 = zeros(1:2);

%Buffer de filtros
bufSin1(1:length(h0)) = 0; 
bufSin2(1:length(h0)) = 0; 

bufAna1(1:length(h0)) = 0; 
bufAna2(1:length(h0)) = 0; 

pasa1 = 0;
pasa2 = 0;

for n = 1 : length(x1)+length(h0)-1
   
    %Sintesis
    
    %Interpolamos
    if n <= length(x1)
        bi1(2) = x1(n);
        bi2(2) = x2(n);
    else
        bi1(2) = 0;
        bi2(2) = 0;
        
    end
    
  
   for nn = 1 : 2
       
       bufSin1(1) = bi1(nn);
       bufSin2(1) = bi2(nn);
       
       
       
       ac1 = 0;
       ac2 = 0;
       for k = 1 : length(h0)
           ac1 = ac1 + bufSin1(k)*g0(k);
           ac2 = ac2 + bufSin2(k)*g1(k);
           
       end
       
       for i = length(h0):-1:2
           bufSin1(i) = bufSin1(i-1);
           bufSin2(i) = bufSin2(i-1);
       end
       
       sum = ac1 + ac2;
                   
       bufAna1(1) = sum;
       bufAna2(1) = sum;
           
       ac1 = 0;
       ac2 = 0;
       
       for k = 1 : length(h0)
           ac1 = ac1 + bufAna1(k)*h0(k);
           ac2 = ac2 + bufAna2(k)*h1(k);
       end
       
       for i = length(h0):-1:2
           bufAna1(i) = bufAna1(i-1);
           bufAna2(i) = bufAna2(i-1);
       end
       
       if mod(nn-1,2) == 0
           pasa1 = ac1
           pasa2 = ac2
           
           pause
           
       end
       
       
   end
   
end
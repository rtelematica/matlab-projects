function [Hq,SOSq] = quantsos(B,A,b)

% [Hq,SOSq] = quantsos(B,A,b)
% Genera la respuesta frecuencial Hq del filtro digital (B,A) al ser
% cuantizado con b bits utilizando secciones de 2º Orden
% SOS es una matriz que muestra los valores cuantizados de los
% coeficientes de las secciones de 2º Orden
A=[2 3 4 5 ];
B=[4 5 6 7 8];
B = fliplr(B);
    A = [1 zeros(1,length(B)-1)];
if (A==1) % Filtro FIR
   

end


[H,F]=freqz(B,A,500);  % Respuesta frecuencial del filtro con coeficientes reales
Hdb=20*log10(abs(H));

BAmax = max([B;A]);
if (BAmax >1)
   powof2 = floor(log(BAmax)/log(2));
else
   powof2 = 0;
end
Bfixed = B/(2^powof2);
Bq = round(Bfixed*(2^b))/(2^b);
Afixed = A/(2^powof2);
Aq = round(Afixed*(2^b))/(2^b);

[Hq,F]=freqz(Bq,Aq,500); % Respuesta frecuencial del filtro con coeficientes cuantizados (forma directa)
Hqdb = 20*log10(abs(Hq));

% Poner la función de transferencia como producto de secciones de 2º Orden
[Z,P,K]=tf2zp(B,A);
SOS = zp2sos(Z,P,K);   

SOSmax=ceil(max(max(abs(SOS))));     % Calcula el menor entero que es mayor que el maximo de los 
if (SOSmax > 1)
	powof2 = floor(log(SOSmax)/log(2));  % coeficientes de 2º Orden (ceil) y halla la potencia de 2 
else													% cercana a ese número.
   powof2 = 0;
end

SOSfixed=SOS/(2^powof2);      % Escala todos los coeficientes de los términos de 2º Orden por
					% esa potencia de dos (dividir por potencias de 2 es muy sencillo
					% en un microprocesador, solo hay que desplazar bits. Cualquier cosa
					% antes que realmente dividir!!)

SOSq = round(SOSfixed*2^b)/(2^b);  % Cuantización de los coeficientes en punto fijo con b bits
[r,c]=size(SOSq);			     % r es el numero de secciones de 2º Orden

Hq=ones(500,1); % Inicializar el vector de la respuesta del filtro cuantizado

for i=1:r,
  Bp=SOSq(i,1:3);Ap=SOSq(i,4:6); % Determinar los coeficientes del numerador y denominador
  Hp=freqz(Bp,Ap,500);		% Respuesta frecuencial de la seccion de 2º Orden r
  Hq=Hq.*Hp;		      % Configuración en cascada, asi que deben multiplicarse sucesivamente
end

HSOSqdb=20*log10(abs(Hq));

plot(F,Hdb,'b',F,Hqdb,'r',F,HSOSqdb,'g');grid;zoom;

return
%ecuacion de la elipse  pasa por los puntos
function elipse5(x)
clc
A=input('introduce las coordenadas A(x,y) 1� punto');
B=input('introduce las coordenadas de B(x,y) 2� punto');
C=input('introduce las coordenadas de C(x,y) 3� punto');
D=input('introduce las coordenadas de D(x,y) 4� punto');
sistema=[A(1) A(2) 1; B(1) B(2) 1; C(1) C(2) 1; D(1) D(2) 1];
columna=-[A(1)^2+A(2)^2;B(1)^2+B(2)^2;C(1)^2+C(2)^2; D(1)^2+D(2)^2];
y = sistema\columna;
format rat
disp('E'),disp(y(2))
disp('F'),disp(y(3))
end

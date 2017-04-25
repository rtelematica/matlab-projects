%% Programa que grafica el patrón de radiación de un arreglo homogeneo 

%Numero de antenas en el arreglo

clc
clear all;
close all;

eje = input('Introduce el eje del arreglo:\n  ','s');
N = input('Introduzca el numero de antenas en el arreglo:\n ');
tipo = input('Introduzca el tipo de dipolo de la antena :\n c= corto, d= lambda/2, cu=lambda/4:\n ', 's');
distancia = input('Introduzca la distancia entre cada dipolo\n:(múltiplo de lambda)\n');
corriente = input('Introduzca la corriente con la que se alimenta la antena :\n fu= fase uniforme, fp = fase progresiva \n','s');
    
    if strcmp(corriente,'fu')
        
        cv = 0;
    end    

    if strcmp(corriente,'fp')
        cv = input ('Indicar fase de la corriente:\n ');
    end
    
% F(T,F) = F(T,F)dipolo * FA     
    %F(T,F) = P
    %F(T,F)dipolo = P1
    
%Definimos variables

t = [0 : pi/16 : pi ];
f = [0 : pi/16 : 2*pi ];

[T,F] = meshgrid(t, f);

if strcmp (eje,'x')    
   
    rrok=sin(T).*cos(F);
    
end    

if strcmp (eje,'y')    
   
    rrok=sin(T).*sin(F);
    
end

if strcmp (eje,'z')    
   
   rrok=cos(T);
   
end

if strcmp(tipo,'c')

    P1 = sin(T);
    
end

if strcmp(tipo,'d')
    
    P1 = (cos((pi/2).*(cos(T))))./ (sin(T)) ; 
    
    
end

if strcmp(tipo,'cu')
    
    P1=(cos(pi*(cos(T)))+1) ./ (sin(T));
    
end

bd=distancia*2*pi;
    
 

FF = cv + bd*rrok;

FA = (sin((N/2)*FF))./(sin(FF/2));

if bd==0

    FA=1;
end    
P = P1.*FA;

%R= ((cos(pi/2*cos(T)))./(sin(T))) .* ( ( sin( 5*pi/2*(1/2+ sin(T).*cos(F)))) ./ (( sin(pi/2*(1/2 + sin(T).*cos(F))))));         
R = P;

x = R.*sin(F).*cos(T);
y = R.*sin(F).*sin(T);
z = R.*cos(F);



surfl(x,y,z);


shading interp;
colormap pink;
 
grid on;
axis equal;
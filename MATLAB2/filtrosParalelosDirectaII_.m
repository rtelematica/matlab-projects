%% Filtro IIR forma directa II en paralelo

%A = [ 1.0000    1.5948    2.1945    1.7843    0.9940    0.3201 ];
%B = [ 0.5660    1.3270    2.0508    2.0508    1.3270    0.5660 ];

%Aqui va el filtro con los coeficientes b y a
%A = [1 2 3 4 5 6 7 8 9 10 11 12 13 14];
%B = [1 2 3 4 5 6 7 8 9 10 11 12 13 1];

A = [1.0000    5.0198   16.2402   37.4714   69.5052  106.0434 138.0428  154.3837  150.6716  128.2275   95.7768   62.3365   35.3618   17.1935    7.1164    2.4123    0.6556    0.1259  0.0158];
B = [0.0150    0.0643    0.1679    0.3210    0.4987    0.6349   0.6681    0.5606    0.3223         0   -0.3223   -0.5606 -0.6681   -0.6349   -0.4987   -0.3210   -0.1679   -0.0643 -0.0150];

%señal de entrada
x = [1 2 3 4 5 6 7 8 9 10];


[b,a] = fraccionesParciales(B,A);

display 'Coeficientes de filtros en paralelo obtenidos';

b
a
display 'Presione enter'
pause()

Nf = length(b(:,1));
Nc = 3;

% crear un archivo CoeficienteAB.cof con los valores de a y b
fileID = fopen('CoeficienteAB.cof','w');
fprintf(fileID, '#define Nf %d\n', Nf);
fprintf(fileID, '#define Nc %d\n\n', Nc);
fprintf(fileID, 'float Num[Nf][Nc] = { ' )
for i = 1 : Nf
    for j = 1 : Nc
        
        if i == Nf & j == Nc
            fprintf(fileID, '%f  ', b(i,j));        
        else
            fprintf(fileID, '%f,  ', b(i,j));        
        end
    end
    
    if i == Nf
        fprintf(fileID, '\n                    };');
    else
        fprintf(fileID, '\n                      ');
    end    
end

fprintf(fileID, '\n\nfloat Den[Nf][Nc] = { ' )
for i = 1 : Nf
    for j = 1 : Nc
        
        if i == Nf & j == Nc
            fprintf(fileID, '%f  ', a(i,j));        
        else
            fprintf(fileID, '%f,  ', a(i,j));        
        end
    end
    
    if i == Nf
        fprintf(fileID, '\n                    };');
    else
        fprintf(fileID, '\n                      ');
    end
    
    
end

fclose(fileID);

display 'Se creo archivo coeficientesAB.cof y se almacenaron los valores de a y b'
display 'Presione enter'
pause()

%Inicializamos variables
a1 = 0;
a2 = 0;

v(1:Nf,1:Nc) = 0;

y = 0;

v_temp = 0;

%Forma Directa 2
for n = 1 : length(x)
    
    acu = 0;
    
    for numF = 1 : Nf
    
        a1 = 0;
        a2 = 0;

        for j = 2 : Nc
            a1 = a1 + a(numF,j) * v(numF,j-1);
        end

        for k = Nc : -1 : 2
            v(numF,k) = v(numF,k-1);
        end

        v(numF,1) = x(n) - a1;

        for k = 1 : Nc
            a2 = a2 + b(numF,k)*v(numF,k);
        end

        acu = acu + a2;
                
    end
    
    y(n) = acu;   
    
end

display ' '
display 'Señal obtenida mediante los filtros en paralelo y forma directa II'
y

display ' '
display 'Señal obtenida mediante los filter'
yy = filter(B,A,x)


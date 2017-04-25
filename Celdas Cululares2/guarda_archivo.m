

miArchivo = fopen('resultados3.dll', 'w+');
if miArchivo == -1
    fopen('resultados3.dll', 'w+');
end

if miArchivo ~= -1
    
    d = 0;
    for i = 1 : 10
        d = d + i;
       
        fprintf(miArchivo, 'N = %d - PBER = %d \n', i, d);
        
    end
        
    if fclose(miArchivo) == 0
        print('Error al cerrar el archivo');
    end
else
    print('Error al crear/abrir el archivo');
end
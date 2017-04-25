%A=rand(10,10);
%save -ascii mi_archivo.txt A
fid=fopen('gan_canales.gan', 'w');

if fid==-1
    display 'Error al abrir el archivo gn_canales'
    return
end

nc = 7;
ne = 0;
for i = 1 : nc   
    
    if i == nc
        if nc > 9
            if i < 10
                fprintf(fid, 'GC0%d(dB):1', i)            
            else
                fprintf(fid, 'GC%d(dB):1', i)
            end
            ne = 10;
        else
            fprintf(fid, 'GC%d(dB):1', i)
            ne = 9;
        end
    else
        if nc > 9
            if i < 10
                fprintf(fid, 'GC0%d(dB):1\n', i)            
            else
                fprintf(fid, 'GC%d(dB):1\n', i)
            end
            ne = 10;
        else
            fprintf(fid, 'GC%d(dB):1\n', i)
            ne = 9;
        end
    end
end



fclose(fid)

pause

fid = fopen('gan_canales.gan','r');
if fid==-1
    display 'Error al abrir el archivo'
    return;
end

val = 0;

for i = 1 : nc
    sal = fgetl(fid);
    
    lsal = length(sal);
    if lsal > ne        
        valc = [ sal(lsal-1) sal(lsal) ];
    else
        valc = sal(lsal);
    end
    
    val(i) = str2num(valc);
end


val

fclose(fid);

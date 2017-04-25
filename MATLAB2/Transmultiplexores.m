%% Transmultiplexores TDM-FDM-TDM


Nc = 4;
fases = log2(Nc);


%Se simula una secuencia de datos de entrada para cada canal
x(1:Nc,1:10)=0;
val = 1;
for j = 1 : Nc
    for i = 1 : 10
        x(j,i) = val;
        val = val + 1;
    end
end


x
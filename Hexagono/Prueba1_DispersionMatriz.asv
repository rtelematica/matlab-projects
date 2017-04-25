close all;
n = 13;
m = 9;
esp = 1;

mat = 0;
for i = 1 : m
    for j = 1 : n
    % i + j = par -> 1    
    %       = impar -> 0
    
    % esp = 3
    %if ( mod(i + j - 2 ,4) == 0 & mod(j - 1 ,4) == 0 ) || ( mod(i - 3 , 4 ) == 0 & mod(j -3 ,4) == 0 )
    
    %esp = 5
    %if ( mod(i + j - 2 ,6) == 0 & mod(j - 1 ,6) == 0 ) || ( mod(i - 4 , 6 ) == 0 & mod(j - 4 ,6) == 0 )    
    if ( mod(i + j - 2, esp+1) == 0 & mod(j - 1, esp+1) == 0 ) || ( mod(i - (esp+3)/2 , esp+1 ) == 0 & mod(j - (esp+3)/2 ,esp+1) == 0 )    
        mat(j,i) = 1;
        
    else
        mat(j,i) = 0;
    end
    
    end
end


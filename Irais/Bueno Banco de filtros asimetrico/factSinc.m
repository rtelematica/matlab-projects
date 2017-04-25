function y=factSinc(mat,fases, LF)
    
    q=LF-1;
    cerosN=2*q;%factor inter: 2
    c=cerosN;
    
    m=0;
    for i=3:fases+1
        if i > 3
        c=2*(c+q);
        end
    end
    c
    
    for i=1:fases+1
        
        if i <  3

        z=zeros(1,c);
        za=[mat(i,1:length(mat(i,:))) z];
        else
            z=zeros(1,c-cerosN);
            za=[mat(i,1:length(mat(i,:))) z]; 
            cerosN=2*(cerosN+q);
        end
        
        lza = length(za);
        zz(i,1:lza) = za;
        

    end
        zz(1,1:length(mat(1,:))) = mat(1,:);
        zz(2,1:length(mat(2,:))) = mat(2,:);
        
        y = zz;
        
end

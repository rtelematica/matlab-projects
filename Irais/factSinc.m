function y=factSinc(mat,fases, LF)
    
    q=LF-1;
    cerosN=2*q;%factor inter: 2

    m=0;
    for i=3:fases+1

        z=zeros(1,cerosN/2);
        za=[z mat(i,1:length(mat(i,:)))];
        
        lza = length(za);
        zz(i,1:lza) = za;
        cerosN=2*(cerosN+q);

    end
        zz(1,1:length(mat(1,:))) = mat(1,:);
        zz(2,1:length(mat(2,:))) = mat(2,:);
        
        y = zz;
        
end

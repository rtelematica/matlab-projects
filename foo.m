close all
i = 1;
j = 1;
for s=2:2:10

    for a=1:0.01:s-0.1
        
              
    %cola finita (K=2)

        Pr_colfin2(i,j) = Pr_colfin(s,a,2);
        hold on;
        figure(5)
        plot(a,Pr_colfin2(i,j)),title('Probabilidad de retardo para un sistema con cola de longitud 2 para diferentes n�meros de servidores'),xlabel('a(Intensidad de tr�fico ofrecido)'),ylabel('Pr')     
  
        
    %cola finita (k=4)
    
        Pr_colfin4(i,j) = Pr_colfin(s,a,4);    
        hold on
        figure(6)
        plot(a,Pr_colfin4(i,j)),title('Probabilidad de retardo para un sistema con cola de longitud 4 para diferentes n�meros de servidores'),xlabel('a(Intensidad de tr�fico ofrecido)'),ylabel('Pr')     
        
        j = j +1;
    end
    i=i+1;
    j = 1;
end
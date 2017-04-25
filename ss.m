for s=2:2:10

    for a=1:0.1:s-0.1
        
              
    %cola finita (K=2)

        Pr_colfin2(i,a) = Pr_colfin(s,a,2);
        figure(5)
        plot(a,Pr_colfin2),title('Probabilidad de retardo para un sistema con cola de longitud 2 para diferentes números de servidores'),xlabel('a(Intensidad de tráfico ofrecido)'),ylabel('Pr')     
  
        
    %cola finita (k=4)
    
        Pr_colfin4(i,a) = Pr_colfin(s,a,4);    
        figure(6)
        plot(a,Pr_colfin4),title('Probabilidad de retardo para un sistema con cola de longitud 4 para diferentes números de servidores'),xlabel('a(Intensidad de tráfico ofrecido)'),ylabel('Pr')     
 
    end
    i=i+1;
end
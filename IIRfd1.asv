%% Filtro IIR forma directa I

%coeficientes del filtro
a=[1,2,3,4];
b=[1,2,3,4];

%señal de entrada
x=[1,2,3,4,5,6,7,8,9,10];

xx=[zeros(1,length(b)-1) x zeros(1,length(b)-1)];

%inicializo variables
u=0;
y=0;
yy=[zeros(1,length(a)-1) y zeros(1,length(a)-1)];

%
N=length(b);
M=length(a);

%u
   
    for k = 1 : N + x|1
        
       u = u + b(k) * xx((n-1)+ N-k+1);
        
    end    
      
   
    for j = 1 : M+1
        
       y=y + a(k) * yy((n-1)+ N-k+1);
        
    end    
      


y=u-y


filter (b,a,x)

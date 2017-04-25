%% Filtros de media banda de análisis y de síntesis
clc;
clear all;
format long;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db2';
if typeofbasis == 'b'
    
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
    
else
    
    [h0,h1,g0,g1] = wfilters(typor);
    
end

x1=[1:4];
x2=[5:8];

x=[x1
    x2];

fD=2; %factor diezmado
fI=2; %factor interpolado

Nc=length(x(:,1)); %numero de canales
Ne=log2(Nc); %número de etapas

lx=length(x(1,:));

lh=length(h0); 

mb(1:2,1:lh)=0;
mb2(1:2,1:lh)=0;
mI(1:2,1:lh)=0;
mD(1:2,1:lh)=0;

cont(1:2,1:1)=0;

indb=0;
acu=0;
for nx = 1: lx + lh -1

    %% Suma
    suma=0;
    Nc = 2;
    m=0;
    if nx <= lx
        m(1:Nc,1)=x(1:Nc,nx);
    else
        m(1:Nc,1) = 0;
    end
    
    indb=0;
    
    for nc=1:Nc
        
            indb=indb+1;
        
            if mod(nc,2)== 0
                g=g1;
            else 
                g=g0;
            end
    
    %señal de entrada 
            se = m(nc,1);
            %pause
            
            % Interpolación           
            if mod(mI(indb,1),fI)~= 0
                se = 0;
            end
            
            mI(indb,1)=mI(indb,1)+1;
            
            mb(indb,1)= se;
            
            %convolución
            for k=1:lh
            
                acu = acu + g(k) * mb(indb,k);
                
            end
            
            %corrimiento de buffer
            for i=lh:-1:2
                
               mb(indb,i)=mb(indb,i-1);
                
            end    
            
            %suma      
            m(1:Nc,1)
            y = acu;
        
    end
    
    %% Recuperación
    
    indb=0;
    ss=y;
    cx =0;
    %xRec(1:(Nc),1:lx) = 0;
    indss = 1;
    
        for nc=1:Nc
            
            indb=indb+1;

            %Seleccionamos filtro a usar
            if mod(nc,2)== 0
                h=h1;
            else 
                h=h0;
            end
            
            ss;
            mb2(indb,1)=ss(indss,1);
            %pause
            
            if mod(nc,2)==0
               indss = indss + 1;    
            end
                         
            % convolución            
            cx = 0;
            for k=1:lh
                cx= cx + h(k) * mb2(indb,k);
            end
            nc;
            cx;
                
            % corrimiento  
            for i=lh:-1:2          
                mb2(indb,i)=mb2(indb,i-1);
            end
            
            
            % No tomar en cuenta muestras  antes del diezmado
            if cont(nc,1) < lh    
                cx = 0;
                cont(nc,1)  = cont(nc,1) + 1;
            end 
            
            
%            cx
            %Diezmado
            if mod(mD(indb,1),2) == 0
                se2=cx;
                
            else 
                se2=0;
            end
      
            mD(indb,1)=mD(indb,1)+1;
            
            nc;
            xRec(nc,1) = se2
            pause
            %Nc
            %cx=0;
            

        end
    
    
    

end


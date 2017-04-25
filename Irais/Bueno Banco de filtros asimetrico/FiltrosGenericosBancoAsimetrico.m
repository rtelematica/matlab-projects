clc;
clear all;
format short;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db1';

if typeofbasis == 'b'
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
else
    [h0,h1,g0,g1] = wfilters(typor);
end


h=1;
g=1;

Ne=2; %Número de etapas del filtro
Nc=Ne+1; %Número de canales salientes 
x=[1:1];

nc=1;


for ne=Nc:-1:2
    hh(ne,nc)=1;
    nc=nc+1;
end

gg=hh;
% gg
% hh
k = 2;
matFactAna = 0;
r=0;
for j = 2: Nc
    for i = 1 : Ne
      if(hh(j,i) == 1);
          matFactAna(k) = i;
          k = k + 1;
      end
    end
end

matFactAna(1) = Ne;
matFactAna;
% pause

%Definir convoluciones
fact = 1;
h_gen = 0;
for f=1:Nc
i=1;
    ch = 1;
    cg = 1;
    for c=1:Ne

        
        if hh(f,c)==1
            h = h1;
        else
            h = h0;
        end
        
        if gg(f,c)==1
            g = g1;
        else
            g = g0;
        end
        
        ch = conv(ch,upsample(h,i));
        cg = conv(cg,upsample(g,i));
        i=2*i;
        
        if hh(f,c) == 1
            break;
        end
        
    end
    
    lch = length(ch);
    for j = 1 : lch
        h_gen(f,j) = ch(j);
    end
    
    lcg = length(cg);
    for j = 1 : lcg
        g_gen(f,j) = cg(j);
    end
    
end

lh_gen = length(h_gen(1,:));
h_gen = h_gen(:,1:lh_gen-((2^Ne)-Ne-1));

lg_gen = length(g_gen(1,:));
g_gen = g_gen(:,1:lg_gen-((2^Ne)-Ne-1));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    q=length(h0)-1;
    cerosN=2*q;%factor inter: 2
    c=cerosN;
    
    m=0;
    for i=3:Nc
        if i > 3
        c=2*(c+q);
        end
    end
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%Forma paralela
sinc=1;
res = 0;

buffer(1:length(h_gen(1,:))) = 0;
buffsin(1:Nc,1:length(h_gen(1,:))) = 0;

matInt = 0;
for n = 1 : length(x) + length(h_gen(1,:)) - 1
    
    if n <= length(x)
        buffer(1) = x(n);
    else
        buffer(1) = 0;
    end
    
    %filtro de analisis
    for i = 1 : Nc
        acu = 0;
        for k = 1 : length(h_gen(i,:))
            acu = acu + buffer(k) * h_gen(i,k);
        end
    
        %diezmado
        
        if mod(n-1,2^matFactAna(i)) == 0
            dp = acu;
          else
            dp = 0;
        end
        
        matInt(i,1) = dp;
    end
    
    %Corrimiento de buffer
        for k = length(buffer) : - 1 : 2
            buffer(k) = buffer(k-1);
        end
    
    matInt
    %matSinc=matInt;
    
    %%%%%%Matriz de sincronizacion!
    if sinc==1
        matSinc = factSinc(matInt, Ne,length(h0))
        for t=3:Nc
            
            av=matSinc(t,1);
            matSinc(t,1)=0;
            
            matSinc(t,cerosN+1)=av;
            cerosN=2*(cerosN+q);
        end
        
        cerosN=2*q;
        
%         pause
        sinc=0;
    else
        for nt=1:Nc
            if nt < 3
              
            matSinc(nt,1)=matInt(nt);     
            end
            matSinc(nt,cerosN+1)=matInt(nt);

        end
    end
    matSinc
    
    matSint = matSinc(:,c+1)
    
    for ee=1:Nc
        for ff=c+1:-1:2
            matSinc(ee,ff)=matSinc(ee,ff-1);
        end
    end
    
    matSinc
    pause
     
     
    %%%%%% Sintesis
    for h = 1 : length(matSint)

        %filtro de sintesis
        buffsin(h,1) = matSint(h);
        
        acu = 0;            
        for k = 1 : length(g_gen(1,:))
            acu = acu + buffsin(h,k)*g_gen(h,k);
        end
        h
        acu

        %Corrimiento de buffer
        for k = length(buffsin(1,:)) : - 1 : 2
            buffsin(h,k) = buffsin(h,k-1);
        end

        res = res + acu;        
                    
    end
    res
    pause
    
    res = 0;
        
end



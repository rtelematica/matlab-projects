clc;
clear all;
format short;
typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db2';

if typeofbasis == 'b'
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
else
    [h0,h1,g0,g1] = wfilters(typor);
end


h=1;
g=1;

Ne=2; %N�mero de etapas del filtro
Nc=Ne+1; %N�mero de canales salientes 
x=[1:10];

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
pv = 1;
pv2 = 1;

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
        h
        g
        if pv2 == 0
            ups1 = upsample(h,i);
            ups2 = upsample(g,i);
            ups1 = ups1(1:length(ups1)-i+1);
            ups2 = ups2(1:length(ups2)-i+1);
        else
            ups1 = upsample(h,i);
            ups2 = upsample(g,i);
            pv2 = 0;
        end
        ups1
        ups2
        ch = conv(ch,ups1)
        cg = conv(cg,ups2)
        
        pause
                
        i=2*i;
        
        if hh(f,c) == 1
            break;
        end
        
    end
    
    if pv == 1
        mxtam = length(cg); %-((2^Ne)-Ne-1)
        pv = 0;
    end
    
    lch = length(ch);
    for j = 1 : lch
        h_gen(f,j) = ch(j);
    end
    
    lcg = length(cg);
    cg
    zcg = [zeros(1,mxtam-lcg) cg]
    h_gen
    lzcg = length(zcg);
    pause
    for j = 1 : lzcg
        g_gen(f,j) = zcg(j);
    end
    
end

lh_gen = length(h_gen(1,:));
%h_gen = h_gen(:,1:lh_gen-((2^Ne)-Ne-1));

lg_gen = length(g_gen(1,:));
%g_gen = g_gen(:,1:lg_gen-((2^Ne)-Ne-1));

h_gen
g_gen
pause


%Forma paralela
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
        
       % matInt(i,1) = dp;
       buffsin(i,1) = dp;
    %end
    
%         buffsin(i,1) = dp
        
        %pause

        %filtro de sintesis

        acu = 0;            
        for k = 1 : length(g_gen(1,:))
            acu = acu + buffsin(i,k)*g_gen(i,k);
        end

        %Corrimiento de buffer
        for k = length(buffsin(1,:)) : - 1 : 2
            buffsin(i,k) = buffsin(i,k-1);
        end

        res = res + acu;        
            
%         
%         res;
%         pause
%         res = 0;
        
    end
    
            
        res
        pause
        res = 0;
        %Corrimiento de buffer
        for k = length(buffer) : - 1 : 2
            buffer(k) = buffer(k-1);
        end
    
    %res
    
    %res = 0;
        
end


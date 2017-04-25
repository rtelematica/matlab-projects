h=[1,2,3,4];
x=[1,2,3,4,5,6,7,8,9,10];
xx=[zeros(1,length(h)-1) x zeros(1,length(h)-1)];
y=0;
acu=0;
N = length(h);

for n = 1:(length(h)+length(x)-1)
    
    for k = 1 : N
        
       acu=acu + h(k) * xx((n-1)+ N-k+1);
        
    end    
    
    y=acu
    acu = 0;
    
    yy = conv(h, x)
    pause
end


close all;

%[]
h = 1;
DELTA = 0.02;
esp = 0.58;
x = [ 0 : DELTA : 2.32*h ];
y = [ 0 : DELTA : 2*h ];

length(x)
length(y)

%Generar maya de valores

pent = 0;

c=3*esp;

for j = 1 : length( y )
    for i = 1 : length( x )
        Y=(j-1)*DELTA 
        X=(i-1)*DELTA
        pent(j,i)=-1;
        
         if DELTA*(j-1) == 0 & 3*esp*h==DELTA*(i-1)
             y=DELTA*(j-1)
             x=DELTA*(i-1)
             f=3*esp*h
             if and(3*esp*h,DELTA*(i-1))
                 d=1
             end
             pause()
         end
           
        if (DELTA*(i-1)==0 & DELTA*(j-1)==h ) %P6            
            pent(j,i)= h;
            p6 = 0
            
        elseif (DELTA*(i-1)==4*esp*h & DELTA*(j-1)==h ) %P3           
            pent(j,i)= h;
            p3 = 0
            
        elseif (DELTA*(i-1)==esp*h & DELTA*(j-1)==0 ) %P5
            pent(j,i)= 0;
            p5 = 0
            
        elseif and(DELTA*(i-1)==1.74*h, DELTA*(j-1)==0 ) %P4
            pent(j,i)= 0;
            p4 = 0
            
        elseif (DELTA*(i-1)==esp*h & DELTA*(j-1)==2*h ) %P1
            pent(j,i)= 2*h;
            p1 = 0
            
        elseif (DELTA*(i-1)==1.74*h & DELTA*(j-1)==2*h ) %P2
            pent(j,i)= 2*h;
            p2 = 0
            
        end
                                      
        
    end
end

figure(1)

for i = 1: length(y)
hold on
plot(x, pent(i,:), 'p')
end



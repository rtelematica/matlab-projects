clc
clear all
figure(1)
for n=0:1:10
    
   hold on
   stem(n,1,'r');
end

hold off
figure (2)
for m=4:1:10
    hold on
    stem(m,-1,'r');
end
hold off
figure (3)
for m=0:1:4
    hold on
    stem(m,1,'r');
end
    

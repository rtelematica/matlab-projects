%Z = peaks; 

%surf(Z)
axis tight
%set(gca,'nextplot','replacechildren');
f=100;
t = 0:1/f:2


for j = 1:100
    
    
    
    %surf(sin(2*pi*j/20)*Z,Z)
    plot(t, cos(2*pi*t-1/j))
    
    F(j) = getframe;
end
movie(F,100) % Play the movie twenty times
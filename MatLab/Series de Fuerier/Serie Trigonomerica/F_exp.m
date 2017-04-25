
delta = 0.01;
t = [0 : delta : 2 * pi];
f = exp(t);


n = 200;

s = 0;
for r = 1 : n
    
    s = s + (cos(r*t)-r*sin(r*t))/(r^2+1);
    
end

fs =  ( exp(2*pi)-1)/pi *( 1/2 + s ); 

plot(t, f, t, fs)
title('Aproximación de una funcion exponencial mediante funciones sen (nt):' )
xlabel( '0 \leq t \leq 2\pi' )
ylabel( 'f(t)' )
set( gca, 'XTick', 0 : pi / 2 : 2 * pi )
set( gca, 'XTickLabel', {'0','pi/2','pi','3pi/2','2pi'})
h = legend( 'exp', 'aproximacion');
set( h, 'Interpreter', 'none');





%% Transmultiplexor de 2 canales

clc;
clear all;
format short;


x = 1:10;

typeofbasis = '0';
typbior = 'bior2.2';
typor = 'db3';
if typeofbasis == 'b'
    
    [Rf,Df] = biorwavf(typbior);
    [h0,h1,g0,g1] = biorfilt(Rf,Df);
    
else
    
    [h0,h1,g0,g1] = wfilters(typor);
    
end

h0
h1
g0
g1

pause
x = 1:3;
c = conv(h1,x)
c = downsample(c,2)
pause


x1 = [ 0.5 2.5 ];
x1 = upsample(x1,2);
c1 = conv(x1, g0)

x2 = [ -0.5 2.5 ];
x2 = upsample(x2,2);
c2 = conv(x2, g1)

x3 = c1 + c2;
x3 = upsample(x3,2);
c3 = conv(x3, g0)

x4 = [ -0.707 -.707 ];
x4 = upsample(x4,2);
c4 = conv(x4, g1)


pause

aver = [0	0	0	0	0	0	0	0	0	-0.13	0.896	3.475	0	0];
aver = upsample(aver,2);
convol = conv(aver, g0)


pause


x1 = [1 2 3 1 2 3];
x2 = [4 5 6 4 5 6];

s1 = upsample(x1,2);
s2 = upsample(x2,2);

c1 = conv(s1,g0);
c2 = conv(s2,g1);

y = c1 + c2;

c3 = conv(y(1:length(y)),h0)
c4 = conv(y(1:length(y)),h1)


%% Transmultiplexor de 2 canales

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


x1 = [1 1];
x2 = [1 1];
x3 = [1 1];
x4 = [1 1];

s1 = upsample(x1,2);
s2 = upsample(x2,2);
s3 = upsample(x3,2);
s4 = upsample(x4,2);
s1 = s1(1:length(s1)-1)
s2 = s2(1:length(s2)-1)
s3 = s3(1:length(s3)-1)
s4 = s4(1:length(s4)-1)

pause

c1 = conv(s1,g0)
c2 = conv(s2,g1)
c3 = conv(s3,g0)
c4 = conv(s4,g1)
pause

q1 = c1 + c2
q2 = c3 + c4
pause

ss1 = upsample(q1,2)
ss2 = upsample(q2,2)
ss1 = ss1(1:length(ss1)-1)
ss2 = ss2(1:length(ss2)-1)
pause

cc1 = conv(ss1, g0)
cc2 = conv(ss2, g1)
pause

c = cc1 + cc2
pause

f1 = conv(c, h0)
f2 = conv(c, h1)
pause

d1 = f1%downsample(f1,2)
d2 = f2%downsample(f2,2)
pause

ff1 = conv(d1,h0)
ff2 = conv(d1,h1)
ff3 = conv(d2,h0)
ff4 = conv(d2,h1)


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
%
x3=[1:4];
x4=[5:8];

fD=2; %factor diezmado
fI=2; %factor interpolado

x1u = upsample (x1,fI);
convx1u=conv(x1u,g0);

x2u = upsample (x2,fI);
convx2u=conv(x2u,g1);

x3u = upsample (x3,fI);
convx3u=conv(x3u,g0);

x4u = upsample (x4,fI);
convx4u=conv(x4u,g1);

y = convx1u + convx2u;

y2 = convx3u + convx4u;

yy = upsample (y,fI);
convyy = conv(yy,g0);

y2y = upsample (y2,fI);
convy2y = conv(y2y,g1);

yf = convyy + convy2y;

%
convy0 = conv (y,h0)
convy1 = conv (y,h1)

xRec1 = downsample(convy0(2:length(convy0)),fD);
xRec2 = downsample(convy1(2:length(convy1)),fD);



%function[t,re]=rect(fm,D)


% señal x[n] = rect[(n-4)/2]
fm = 1; 
Dx=9;

tx=0 : 1/fm : Dx-1;
l1x=(floor(length(tx)/3));
l2x=((length(l1))*3);
dlx=length(tx)-length(l2x);
Tx=0:1/fm:Dx-(dlx/fm);
cerosx=zeros(1,l1x);
unosx=ones(1,l1x);

re_x=[cerosx,unosx,cerosx];

figure(1)
stem(tx(1:length(re_x)),re_x,'r*');

% señal h[n] = rect[n/4]
%fm = 1; 
Dh = 8;

th=-7 : 1/fm : Dh-1;
l1h=(floor(length(th)/3));
l2h=((length(l1h))*3);
dlh=length(th)-length(l2h);
Th=0:1/fm:Dh-(dl/fm);
cerosh=zeros(1,l1h);
unosh=ones(1,l1h);

re_h=[cerosh,unosh,cerosh];

figure(2)
stem(th(1:length(re_h)),re_h,'r*');

rxx = xcorr(re_x, re_x)
rhh = xcorr(re_h, re_h)
rhx = xcorr(re_h, re_x)
rxh = xcorr(re_x, re_h)

ll = length(rxh)

n = 0 : 1 : 16;
figure(3)
stem(rxx)

figure(4)
stem(rhh)

figure(5)
stem(rhx)

figure(6)
stem(rxh)

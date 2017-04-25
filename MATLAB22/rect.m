function[t,re]=rect(fm,D)

t=0:1/fm:D;
l1=(floor(length(t)/3));
l2=((length(l1))*3);
dl=length(t)-length(l2);
T=0:1/fm:D-(dl/fm);
ceros=zeros(1,l1);
unos=ones(1,l1);
re=[ceros,unos,ceros];
plot(t(1:length(re)),re,'r*');
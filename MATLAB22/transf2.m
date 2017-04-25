function[xpt,t]=transf2(t1,t2,t3,t4,fm)

T1=t1:1/fm:(t2-1/fm);
T2=t2:1/fm:(t3-1/fm);
T3=t3:1/fm:t4;
ceros1=zeros(1,length(T1));
ceros2=zeros(1,length(T3));
unos=ones(1,length(T2));

xpt=[ceros1,unos,ceros2];
t=[T1,T2,T3];
subplot(3,2,1), plot(t,xpt);

t12=(1/2)*t2;
t13=(1/2)*t3;

T11=t1:1/fm:(t12-1/fm);
T12=t12:1/fm:(t13-1/fm);
T13=t13:1/fm:t4;
ceros11=zeros(1,length(T11));
ceros12=zeros(1,length(T13));
unos1=ones(1,length(T12));

xpt1=[ceros11,unos1,ceros12];
t1=[T11,T12,T13];
subplot(3,2,3), plot(t1,xpt1);

t22=2*t2;
t23=2*t3;

T21=t1:1/fm:(t22-1/fm);
T22=t22:1/fm:(t23-1/fm);
T23=t23:1/fm:t4;
ceros21=zeros(1,length(T21));
ceros22=zeros(1,length(T23));
unos2=ones(1,length(T22));

xpt2=[ceros21,unos2,ceros22];
t2=[T21,T22,T23];
subplot(3,2,5), plot(t2,xpt2);


YFt=fft(xpt);

lft=floor(length(YFt)/2);
YFt=YFt(1:lft);
%Eje de frecuencia
ft=(0:lft-1)*(fm/2)/(lft-1);

subplot(3,2,2), plot(ft,abs(YFt));

YFt1=fft(xpt1);

lft1=floor(length(YFt1)/2);
YFt1=YFt1(1:lft1);
%Eje de frecuencia
ft1=(0:lft1-1)*(fm/2)/(lft1-1);

subplot(3,2,4), plot(ft1,abs(YFt1));

YFt2=fft(xpt2);

lft2=floor(length(YFt2)/2);
YFt2=YFt2(1:lft2);
%Eje de frecuencia
ft2=(0:lft2-1)*(fm/2)/(lft2-1);

subplot(3,2,6), plot(ft2,abs(YFt2));
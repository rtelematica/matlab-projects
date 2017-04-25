function[t,conv]=convo()

fm=100;
tx1=0:1/fm:4-1/fm;
tx2=4:1/fm:6;
tx3=6+1/fm:1/fm:8;
cerosx11=zeros(1,length(tx1));
unosx1=2*ones(1,length(tx2));
cerosx12=zeros(1,length(tx3));
x=[cerosx11,unosx1,cerosx12];
tx=[tx1,tx2,tx3];
subplot(4,1,1), plot(tx,x)


tx11=0:1/fm:4;
tx22=4+1/fm:1/fm:8;
cerosx111=zeros(1,length(tx22));
unosx11=ones(1,length(tx11));
h=[unosx11,cerosx111];
th=[tx11,tx22];
subplot(4,1,2), plot(th,h)

convolucion=conv(x,h);
tc=0:1/fm:16;
subplot(4,1,3), plot(tc,convolucion/fm)

t1=0:1/fm:4-1/fm;
y1=zeros(1,length(t1));
t2=4:1/fm:6-1/fm;
y2=zeros(1,length(t2));
t3=6:1/fm:8-1/fm;
y3=zeros(1,length(t3));
t4=8:1/fm:10-1/fm;
y4=zeros(1,length(t4));
t5=8:1/fm:16-1/fm;
y5=zeros(1,length(t5));

comp=[t1,t2,t3,t4,t5];
tcomp=[y1,y2,y3,y4,y5];
subplot(4,1,4), plot(tcomp,comp)

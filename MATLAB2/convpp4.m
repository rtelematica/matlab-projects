fm=100;
tx1=0:1/fm:4-1/fm;
tx2=4:1/fm:6;
tx3=6+1/fm:1/fm:8;

unosx1=2*ones(1,length(tx2));
cerosx11=zeros(1,length(tx1));
cerosx12=zeros(1,length(tx3));
x=[cerosx11,unosx1,cerosx12];
tx=[tx1,tx2,tx3];



th1=0:1/fm:4-(1/fm);
th2=4:1/fm:8;
cerosx111=zeros(1,length(th2));
unosx11=ones(1,length(th1));
h=[unosx11,cerosx111];
th=[th1,th2];
con=conv(x,h);
tc=0:1/fm:16;
ty1=0:1/fm:4-(1/fm);
ty2=4:1/fm:6-(1/fm);
ty3=6:1/fm:8-(1/fm);
ty4=8:1/fm:10;
cerosy1=zeros(1,length(ty1));
y2=2*ty2-8;
unosy3=4*ones(1,length(ty3));
y4=-2*ty4+20;
y=[cerosy1,y2,unosy3,y4];
ty=[ty1,ty2,ty3,ty4];
subplot(4,1,1),plot(tx,x)
subplot(4,1,2),plot(th,h)
subplot(4,1,3),plot(tc,con/fm)
subplot(4,1,4),plot(ty,y)
%subplot(4,1,4), plot(tcomp,comp)
%subplot(4,1,1), plot(tx,x)

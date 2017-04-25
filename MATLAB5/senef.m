function[x,t]=senef(ini,fin,i)
fm=1000;
t=-ini:1/fm:fin;
for k=1:i
    b(k)=(1/(pi*k))*(1-2*cos(pi*k)+cos(2*pi*k));
    x(k,:)=b(k)*sin(2*k*t);
end;
xp=sum(x);
plot(t,xp);
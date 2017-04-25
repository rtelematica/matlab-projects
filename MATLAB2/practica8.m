function[x,t]=practica8(ini,fin,i)
fm=1000;
t=ini:1/fm:fin;
y=((1/2)*exp(1))-(1/2);
for k=1:i
    a(k)=(exp(1)*(pi*k*sin(pi*k)+(cos(pi*k)))-1)/((pi^2)*(k^2)+1);
    x1(k,:)=a(k)*cos(pi*k*t);
end;
for k=1:i
    b(k)=(exp(1)*(sin(pi*k)-(pi*k*cos(pi*k)))+(pi*k))/((pi^2)*(k^2)+1);
    x2(k,:)=b(k)*sin(pi*k*t);
end;
xp=sum(x1)+sum(x2)+y;
plot(t,xp);
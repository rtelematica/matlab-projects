function A=vectoramatriz3(v)
%Llena una matrux de nxn con los elementos
%del vector de entrada v como una piramide
clc
n=length(v);
A=zeros(n);
for i=1:n
    n=i;
    while(n>0)
        A(i,n)=v(i)
        n=n-1;
    end
end

%ley de las tangentes en a
clc
format
C=input('indicar C en grados');
A=input('indicar A en grados');
B=input('indicar B en grados');
c=input('introducir lado c');
resta=(A-C)/2;
suma=(A+C)/2;
restab=(B-C)/2;
sumab=(B+C)/2;
a=(c*(tand(resta)+tand(suma)))/(tand(suma)-tand(resta));
b=(c*(tand(restab)+tand(sumab)))/(tand(sumab)-tand(restab));
disp('el lado a vale'),disp(a)
disp('el lado b vale'),disp(b)
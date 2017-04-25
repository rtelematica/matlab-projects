%ley de las tangentes en a
clc
format
C=input('indicar C en grados');
B=input('indicar B en grados');
c=input('introducir lado c');
resta=(B-C)/2;
suma=(B+C)/2;
b=(c*(tand(resta)+tand(suma)))/(tand(suma)-tand(resta));
disp('el lado b vale'),disp(b)

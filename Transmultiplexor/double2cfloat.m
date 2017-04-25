% UPIITA IPN 2010
% José David Valencia Pesqueira

% This program is useful to convert numbers in MATLAB's Double
% format to a text file in float format for C compilers

% You should copy the resulting text to a file and save it with .h
% extension

% THIS PROGRAM RECEIVES AN UNIDIMENTIONAL VECTOR OF DOUBLE NUMBERS

% close all; clear all; clc;

function double2cfloat(x , namex, y, namey, sinc_factor)
[m,n] = size(x);
fprintf('// Begin of file\n\n');
fprintf('#define sinc %d // Sincronization factor\n',sinc_factor);
fprintf('#define N %d // Filter length\n',n);
if m~=0
    fprintf('#define M %d // Number of filters(branches)\n\n',m);
    fprintf('float %s[M][N]=',namex);    
else
    fprintf('float %s[N]=',namex);
end
disp('');
disp('{');
for i=0:m-1 %Rows
    if m~=1
        disp('{');
    end
    for j=0:n-1 %columns
        fprintf('%1.4e,\n',x(i+1,j+1));
    end
    if m~=1 
        fprintf('},\n');
    end
end
disp('};');
fprintf('\n\n');

if m~=0
    fprintf('float %s[M][N]=',namey);    
else
    fprintf('float %s[N]=',namey);
end
disp('');
disp('{');
for i=0:m-1 %Rows
    if m~=1
        disp('{');
    end
    for j=0:n-1 %columns
        fprintf('%1.4e,\n',y(i+1,j+1));
    end
    if m~=1 
        fprintf('},\n');
    end
end
disp('};');


fprintf('\n// EOF\n\n');
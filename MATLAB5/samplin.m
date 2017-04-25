%% Samplin

function y = samplin( ni , nf )
ni = -10;
nf = 10;
n = 1;
i = 1;
for j = ni : nf

    n( i ) = j;    
    
    i = i + 1;
end

i = 1;
x = 0;
for j = ni : nf
    
    if j == 0
        x( i ) = 1;
    else    
        x( i ) = sin(j); 
    end
    i = i + 1;
end

y = x;
figure(1)
plot(n, y)

f = sin([-15:15]);

figure(2)
stem(1:length(f), f)

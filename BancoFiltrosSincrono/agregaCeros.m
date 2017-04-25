
function y = agregaCeros(x, n)
    xx = 0;
    j = 1;
    x_len = length(x);
    for i = 1 : x_len                
        xx(j) = x(i);
        j=j+1;
        if i == x_len
            break;
        end
        for ni = 1 : n
            xx(j) = 0;
            j = j + 1;
        end
    end
    y = xx;
end
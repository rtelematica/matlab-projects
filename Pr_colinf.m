
function y = Pr_colinf(s, a)

    y = (s * (Bsa_sinc(s,a)))/ (s-a*(1-Bsa_sinc(s,a)));
    %y=s;

end


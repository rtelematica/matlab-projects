function [xd] = recorreder(x,N)
% This function shifts a vector by N positions to the right
% As posted in DSPrelated.com
% http://www.dsprelated.com/showcode/43.php
%
lx = length(x);
if N>lx
    fprintf('N has to be smaller than the vector length');
    return;
else
    xd(N+1:lx) = x(1:lx-N);
end;

t = 0;
for i = 1 : 10000
   
    %t(i) = t(i-1)+ exprnd(180);
    t(i) = exprnd(180);
    
end

t


% in = 0;
% cont = 0;
% for i = 1 : 10
%     
%     if  t(i) > in + 1
%         in = in + 1;
%         cont(in+1) = 0;
%     end
%     
%     if  t(i) >= in & t(i) < in + 1
%         cont(in+1) = cont(in+1)+1;
%     end
%     
% end
% 
% cont
% 
% in
% 
% 
%calculamos promedio

sum = 0;
for i = 1 : length(t)
    
    sum = sum + t(i);
    
end

promedio = 0;
promedio = sum/length(t)



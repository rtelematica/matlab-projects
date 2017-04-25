
function y = SB(s,a)

   s1 = a^s/factorial(s);

   m = 0; 
   for k = 0 : s
       m = m + (a^k/factorial(k)); 
   end
   
   y = s1/m;
end

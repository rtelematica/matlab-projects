function y = IIR_D1(b,a,x)

    %% Filtro IIR forma directa I

    %coeficientes del filtro
    %b = [ 0.021754287067440425, -0.030420003361001126,  0.070580047188589207, -0.040036171489698485,  0.062074638058958687,  0.0089358676202366816,  0.0089358676202366816,  0.062074638058958742, -0.040036171489698374,  0.070580047188589262, -0.030420003361001126,  0.021754287067440425 ];
    %a = [ 1, -3.9799349257550607,  8.5341060632578642, -11.758630306675579,  11.555245350027016,  -8.2816553577275354,   4.4406659520566514,  -1.7421959233605651,   0.50083828447340561,  -0.094625507649705037,   0.012132664117796814,  -0.00016896259523982343 ];

    %señal de entrada
    %x=[1,2,3,4,5,6,7,8,9,10];

    buf_x(1:length(b)) = 0;
    buf_y(1:length(a)) = 0;

    %inicializo variables
    acuFIR = 0;
    acuIIR = 0;
    y=0;

    %
    M=length(b);
    N=length(a);

    for n = 1 : length(x)

        buf_x(1) = x(n);

        acuFIR = 0;
        acuIIR = 0;

        %A
        for j = 2 : N        

            acuIIR = acuIIR + a(j) * buf_y(j-1);        

        end    

        %B
        for k = 1 : M

           acuFIR = acuFIR + b(k) * buf_x(k);    

        end

        %Recorremos los buffer

        y(n) = acuFIR - acuIIR;
        y_ant = acuFIR - acuIIR;

        for k = M :-1: 2 
            buf_x(k) = buf_x(k-1);        
        end    

        for k = N :-1: 2 	    
            buf_y(k) = buf_y(k-1);
        end    

        buf_y(1) = y_ant;

    end

end
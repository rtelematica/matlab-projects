classdef ArbolAsincronoAnalisis < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
        padreAnalisis = 0;
        padreSintesis = 0;
        
        %Caracteristicas del sistema
        fases = 0;
        tipoFiltro;
        
        factorDiezmador = 0;
        factorInterpolador= 0;
        %filtros obtenidos
        h = 0;
        g = 0;  
        
        ddd = 0;
        
    end
    
    methods
        %Constructor
        function obj = ArbolAsincronoAnalisis(fases, tipoFiltro, factorDiezmador, factorInterpolador)
            obj.fases = fases;
            obj.tipoFiltro = tipoFiltro;
            obj.factorDiezmador = factorDiezmador;
            obj.factorInterpolador = factorInterpolador;
            obj.padreAnalisis = Nodo(0, 0, 0, 0, 0);
            obj.padreSintesis = Nodo(0, 0, 0, 0, 0);
            
        end
        
        %Filtros wavelet
        function filtrosWavelet(obj)
            
            typeofbasis = '0';
            typbior = 'bior2.2';
            typor = 'db4';
            if typeofbasis == 'b'
                [Rf,Df] = biorwavf(typbior);
                [h0,h1,g0,g1] = biorfilt(Rf,Df);
    
            else
    
                [h0,h1,g0,g1] = wfilters(typor);
    
            end
            
            lf = length(h0);
            
            obj.h(1,1:lf) = h0;
            obj.h(2,1:lf) = h1;
            obj.g(1,1:lf) = g0;
            obj.g(2,1:lf) = g1;
            
        end
        
        function crearEstructuraAnalisis(obj)
            b = Nodo(1,2,3,4,5);
            recursivaNodosAnalisis(b, obj.fases);
            
        end
        
        function recursivaNodosAnalisis(padre, fases)
            fases
            if fases ==0
                return
            end
            
            hijoA = Nodo(0, 1, 2, 3, 4);
            hijoB = Nodo(0, 1, 2, 3, 4);
            
            padre.hijoA = hijoA;
            padre.hijoB = hijoB;
             
            recursivaNodosAnalisis(hijoA, fases - 1);           
                        
        end
        
     
        
    end
    
end


classdef Nodo<handle
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        %Referencias
        hijoA = 0;
        hijoB = 0;      
        
        filtro = 0;
        buffer = 0;
        factor_DI = 0;
        
        entrada = 0;
        salida = 0;        
        
    end
    
    methods 
        function obj = Nodo(hijoA, hijoB, filtro, buffer, factor_DI)
            obj.hijoA = hijoA;
            obj.hijoB = hijoB;
            obj.filtro = filtro;
            obj.buffer = buffer;
            obj.factor_DI = factor_DI;
        end
        
    end        
    
end


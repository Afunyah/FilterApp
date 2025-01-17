classdef SharpenKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj = SharpenKernel()
            obj = obj@Kernel([]);
            obj.k = [0 -1 0; -1 5 -1; 0 -1 0];
        end

        function show(obj, container)
            return
        end

        function updateKernelOptions(obj)
            return
        end
    end
end


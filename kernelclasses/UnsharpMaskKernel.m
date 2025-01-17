classdef UnsharpMaskKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj = UnsharpMaskKernel()
            obj = obj@Kernel([]);
            obj.k = (-1/256)*[1 4 6 4 1; 4 16 24 16 4; 6 24 -476 24 6; 4 16 24 16 4; 1 4 6 4 1];
        end

        function show(obj, container)
            return
        end

        function updateKernelOptions(obj)
            return
        end

    end
end


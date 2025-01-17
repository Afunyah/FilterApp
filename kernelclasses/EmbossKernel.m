classdef EmbossKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj = EmbossKernel()
            obj = obj@Kernel([]);
            obj.k = [-2 -1 -1; -1 1 1; -1 1 2];
        end

        function show(obj, container)
            return
        end

        function updateKernelOptions(obj)
            return
        end

        function visualize(obj)
        end
    end
end


classdef RidgeDetectionKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj = RidgeDetectionKernel()
            obj = obj@Kernel([]);
            obj.k = [-1 -1 -1; -1 8 -1; -1 -1 -1];
        end

        function show(obj, container)
            return
        end

        function updateKernelOptions(obj)
            return
        end

    end
end


classdef BoxBlurKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties

    end
    
    methods
        function obj = BoxBlurKernel()
            obj = obj@Kernel([]);
            obj.k = (1/9)*ones(3);
        end

        function show(obj, container)
            return
        end

        function updateKernelOptions(obj)
            return
        end

    end
end


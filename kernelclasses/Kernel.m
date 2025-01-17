classdef Kernel < handle
    %KERNEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
         enabled = 1;
         k;
    end

    methods
        
        function obj = Kernel(knl)
            obj.k = knl;
        end

       function outputArg = apply(obj,im)
            if obj.enabled ~= 1
                outputArg = im;
                return
            end
            outputArg = conv2(im, obj.k, "same");
       end

       function visualize(obj)
            fig = uifigure('Name', 'Visualizer');
            w = 400;
            h = 600;
            fig.Position = [540 450 w h];
            fig.WindowStyle = 'modal';

            uitable('Parent',fig, 'Data', obj.k, 'Position', [0 420 400 170]);

            uaxes = uiaxes('Parent',fig, 'Position', [0 0 400 400], 'XGrid','on','YGrid','on','ZGrid','on');
            surf(obj.k, 'Parent', uaxes);
       end

    end


    methods (Abstract)
        show(obj,container);
        updateKernelOptions(obj);
    end
end


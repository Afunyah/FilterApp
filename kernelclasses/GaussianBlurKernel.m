classdef GaussianBlurKernel < handle & Kernel
    %GAUSSIANBLURKERNEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        hsize;
        sigma;
        upd_hsize;
        upd_sigma;
    end
    
    methods
        function obj = GaussianBlurKernel(hsize, sigma)
            if nargin == 0
                hsize = 7;
                sigma = 2;
            end
            knl = fspecial('gaussian', hsize, sigma);
            obj = obj@Kernel(knl);
            obj.hsize = hsize;
            obj.sigma = sigma;
        end


        function show(obj,container)
            % Create SpinnerLabel
            SpinnerLabel = uilabel('Parent', container);
            SpinnerLabel.HorizontalAlignment = 'right';
            SpinnerLabel.Position = [20 91 80 22];
            SpinnerLabel.Text = 'Window Size';

            % Create Spinner
            Spinner = uispinner('Parent',container);
            Spinner.Position = [115 91 100 22];
            Spinner.Value = obj.hsize;

            obj.upd_hsize = Spinner;
            
            % Create Spinner_2Label
            Spinner_2Label = uilabel('Parent',container);
            Spinner_2Label.HorizontalAlignment = 'right';
            Spinner_2Label.Position = [20 55 80 22];
            Spinner_2Label.Text = 'Sigma';

            % Create Spinner_2
            Spinner_2 = uispinner('Parent',container);
            Spinner_2.Position = [115 55 100 22];
            Spinner_2.Limits = [0 Inf];
            Spinner_2.LowerLimitInclusive = 0;
            Spinner_2.Value = obj.sigma;

            obj.upd_sigma = Spinner_2;

            
        end

        function updateKernelOptions(obj)
            disp(obj.upd_hsize);
            hs = obj.upd_hsize; si = obj.upd_sigma;
            obj.hsize = hs.Value;
            obj.sigma = si.Value;
            obj.k = fspecial('gaussian', hs.Value, si.Value);
        end

    end
end


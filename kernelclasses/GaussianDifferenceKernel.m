classdef GaussianDifferenceKernel < handle & Kernel
    %GAUSSIANBLURKERNEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        hsize;
        sigma1;
        sigma2;
        upd_hsize;
        upd_sigma1;
        upd_sigma2;
    end
    
    methods
        function obj = GaussianDifferenceKernel(hsize, sigma1, sigma2)
            if nargin == 0
                hsize = 7;
                sigma1 = 4;
                sigma2 = 2;
            end
            knl1 = fspecial('gaussian', hsize, sigma1);
            knl2 = fspecial('gaussian', hsize, sigma2);
            knl = knl1 - knl2;
            obj = obj@Kernel(knl);
            obj.hsize = hsize;
            obj.sigma1 = sigma1;
            obj.sigma2 = sigma2;
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
            Spinner_2Label.Text = 'Sigma 1';

            % Create Spinner_2
            Spinner_2 = uispinner('Parent',container);
            Spinner_2.Position = [115 55 100 22];
            Spinner_2.Limits = [0 Inf];
            Spinner_2.LowerLimitInclusive = 0;
            Spinner_2.Value = obj.sigma1;

            obj.upd_sigma1 = Spinner_2;

            % Create Spinner_3Label
            Spinner_3Label = uilabel('Parent',container);
            Spinner_3Label.HorizontalAlignment = 'right';
            Spinner_3Label.Position = [20 19 80 22];
            Spinner_3Label.Text = 'Sigma 2';

            % Create Spinner_3
            Spinner_3 = uispinner('Parent',container);
            Spinner_3.Position = [115 19 100 22];
            Spinner_3.Limits = [0 Inf];
            Spinner_3.LowerLimitInclusive = 0;
            Spinner_3.Value = obj.sigma2;

            obj.upd_sigma2 = Spinner_3;

            
        end

        function updateKernelOptions(obj)
            disp(obj.upd_hsize);
            hs = obj.upd_hsize; si_1 = obj.upd_sigma1; si_2 = obj.upd_sigma2;
            obj.hsize = hs.Value;
            obj.sigma1 = si_1.Value;
            obj.sigma2 = si_2.Value;
            knl1 = fspecial('gaussian', hs.Value, si_1.Value);
            knl2 = fspecial('gaussian', hs.Value, si_2.Value);
            knl = knl1 - knl2; 
            obj.k = knl;
        end

        function visualize(obj)
        end
    end
end


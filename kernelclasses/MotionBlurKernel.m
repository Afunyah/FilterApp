classdef MotionBlurKernel < handle & Kernel
    %GAUSSIANBLURKERNEL Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        len;
        theta;
        upd_len;
        upd_theta;
    end
    
    methods
        function obj = MotionBlurKernel(len, theta)
            if nargin == 0
                len = 15;
                theta = 1;
            end
            knl = fspecial('motion', len, theta);
            obj = obj@Kernel(knl);
            obj.len = len;
            obj.theta = theta;
        end


        function show(obj,container)
            % Create SpinnerLabel
            SpinnerLabel = uilabel('Parent', container);
            SpinnerLabel.HorizontalAlignment = 'right';
            SpinnerLabel.Position = [20 91 80 22];
            SpinnerLabel.Text = 'Length';

            % Create Spinner
            Spinner = uispinner('Parent',container);
            Spinner.Position = [115 91 100 22];
            Spinner.Limits = [1 40];
            Spinner.LowerLimitInclusive = 1;
            Spinner.Value = obj.len;

            obj.upd_len = Spinner;
            
            % Create Spinner_2Label
            Spinner_2Label = uilabel('Parent',container);
            Spinner_2Label.HorizontalAlignment = 'right';
            Spinner_2Label.Position = [20 55 80 22];
            Spinner_2Label.Text = 'Angle';

            % Create Spinner_2
            Spinner_2 = uispinner('Parent',container);
            Spinner_2.Position = [115 55 100 22];
            Spinner_2.Limits = [0.1 359];
            Spinner_2.LowerLimitInclusive = 1;
            Spinner_2.Value = obj.theta;

            obj.upd_theta = Spinner_2;

            
        end

        function updateKernelOptions(obj)
            lng = obj.upd_len; tht = obj.upd_theta;
            obj.len = lng.Value;
            obj.theta = tht.Value;
            obj.k = fspecial('motion', lng.Value, tht.Value);
        end
    end
end


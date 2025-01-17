classdef PrewittKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        direction;
        upd_direction;
    end
    
    methods
        function obj = PrewittKernel(direction)
            if nargin == 0
                direction = 'Left';
            end
            obj = obj@Kernel([]);
            obj.k = getDirectionKernel(obj,direction);
            obj.direction = direction;
        end


        function res = getDirectionKernel(~,dis)
            switch dis
                case 'Top'
                    x = [1 1 1; 0 0 0; -1 -1 -1];
                case 'Bottom'
                    x = [-1 -1 -1; 0 0 0; 1 1 1];
                case 'Left'
                    x = [1 0 -1; 1 0 -1; 1 0 -1];
                case 'Right'
                    x = [-1 0 1; -1 0 1; -1 0 1];
            end
            res = x;
        end

        function show(obj, container)
            % Create DirectionDropDownLabel
            DirectionDropDownLabel = uilabel(container);
            DirectionDropDownLabel.HorizontalAlignment = 'right';
            DirectionDropDownLabel.Position = [35 91 53 22];
            DirectionDropDownLabel.Text = 'Direction';

            % Create DirectionDropDown
            DirectionDropDown = uidropdown(container);
            DirectionDropDown.Position = [103 91 100 22];
            DirectionDropDown.Items = {'Left','Right','Top','Bottom'};
            DirectionDropDown.Value = obj.direction;

            obj.upd_direction = DirectionDropDown;
        end

        function updateKernelOptions(obj)
            udir = obj.upd_direction;
            obj.direction = udir.Value;
            obj.k = getDirectionKernel(obj, udir.Value);
        end

    end
end


classdef ScharrKernel < handle & Kernel
    %SOBELCLASS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        direction;
        upd_direction;
    end
    
    methods
        function obj = ScharrKernel(direction)
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
                    x = [47 162 47; 0 0 0; -47 -162 -47];
                case 'Bottom'
                    x = [-47 -162 -47; 0 0 0; 47 162 47];
                case 'Left'
                    x = [47 0 -47; 162 0 -162; 47 0 -47];
                case 'Right'
                    x = [-47 0 47; -162 0 162; -47 0 47];
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


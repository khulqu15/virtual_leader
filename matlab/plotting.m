classdef plotting
    methods(Static)
        function formation(x, y, z, a, b, cz, title_text)
            figure;
            theta = linspace(0, 2*pi, 100);
            x_base = a * cos(theta) * 1.01;
            y_base = b * sin(theta) * 1.01;
            plot3(x_base, y_base, cz * ones(size(theta)), 'k--', 'LineWidth', 1.5, 'Color', [0 0 0 0.5]);
        
            hold on;
            plot3(x, y, z, 'bo', 'MarkerSize', 5, 'LineWidth', 2);
        
            n_drones = length(x);
            for i = 1:n_drones
                if i > 1
                    plot3([x(i), x(i-1)], [y(i), y(i-1)], [z(i), z(i-1)], '-', 'LineWidth', 1.5, 'Color', 'r');
                else
                    plot3([x(i), x(n_drones)], [y(i), y(n_drones)], [z(i), z(n_drones)], '-', 'LineWidth', 1.5, 'Color', 'r');
                end
        
                if i < n_drones
                    plot3([x(i), x(i+1)], [y(i), y(i+1)], [z(i), z(i+1)], '-', 'LineWidth', 1.5, 'Color', 'r');
                else
                    plot3([x(i), x(1)], [y(i), y(1)], [z(i), z(1)], '-', 'LineWidth', 1.5, 'Color', 'r');
                end
            end
        
            grid on;
            xlabel('X (m)');
            ylabel('Y (m)');
            zlabel('Z (m)');
            
            if a > b
                set_limit = a + (a * 0.5);
            else
                set_limit = b + (b * 0.5);
            end
            
            if a == b
                set_limit = a + (a * 0.5);
            end
        
            axis([-set_limit set_limit -set_limit set_limit 0 10]);
            title(title_text);
            view(3);
        end
    end
end
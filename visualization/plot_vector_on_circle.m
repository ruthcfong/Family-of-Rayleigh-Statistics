function plot_vector_on_circle(phase, radius, circle_x, circle_y)
    if ~exist('circle_x','var')
        circle_x = 0;
    end
    if ~exist('circle_y','var')
        circle_y = 0;
    end
    [x, y] = pol2cart(phase, radius);
    hold on;
    plot([circle_x x], [circle_y y], '-');
    hold off;
    axis equal;
end
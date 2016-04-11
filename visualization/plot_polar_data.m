function plot_polar_data(phases, radiuses, color_by_phase)
    if ~exist('color_by_phase', 'var')
        color_by_phase = false;
    end
    [xs, ys] = pol2cart(phases, radiuses);
    hold on;
    if color_by_phase,
        uni_phases = sort(unique(phases));
        for p=uni_phases,
            idx = find(p==phases);
            plot(xs(idx), ys(idx), 'o');
        end
    else
        plot(xs, ys, 'o');
    end
    hold off;
    axis equal;
end
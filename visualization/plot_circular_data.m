function plot_circular_data(phases, radiuses, resultant_phase, resultant_mag, ...
    threshold, title_text)
    figure;
    if exist('title_text','var')
        plot_circle(1,0,0,'b-',title_text);
    else
        plot_circle();
    end
    plot_polar_data(phases, radiuses, true);
    if exist('resultant_mag','var') || exist('resultant_phase','var')
        plot_vector_on_circle(resultant_phase, resultant_mag);
    end
    if exist('threshold','var')
        plot_circle(threshold,0,0,'r--');
    end
end
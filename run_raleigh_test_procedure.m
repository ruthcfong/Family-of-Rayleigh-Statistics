function [resultant_z, resultant_phase, p_val, threshold] = ...
    run_raleigh_test_procedure(test_type, phases, samples, show_curve, title_text)
% run_raleigh_test_procedure
% test_type: {'raleigh', 'moore_raleigh', 'scale_raleigh'}
% 
    if ~exist('show_curve', 'var')
        show_curve = false;
    end
    norm_samples = normalize(samples);
    [resultant_z, resultant_phase] = compute_raleigh_vector(test_type,phases,...
        norm_samples);
    null_dist = generate_null_distribution_via_permutation(test_type, ...
        phases, norm_samples);
    p_val = get_p_value_from_ecdf(resultant_z, null_dist);
    threshold = get_threshold_z_for_p_value_from_ecdf(null_dist);
    if show_curve,
        plot_circular_data(phases, norm_samples, resultant_phase, ...
            resultant_z, threshold, title_text);
    end
end
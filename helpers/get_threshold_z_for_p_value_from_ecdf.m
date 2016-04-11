function threshold = get_threshold_z_for_p_value_from_ecdf(null_dist,alpha)
    if ~exist('alpha', 'var');
        alpha=0.05;
    end
    [f, x] = ecdf(null_dist);
    i = find(f>=(1-alpha),1,'first');
    threshold = x(i);
end
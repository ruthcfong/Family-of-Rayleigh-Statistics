function pval = get_p_value_from_ecdf(resultant_z,null_distribution)
    [cdf, sorted_dist_for_cdf] = ecdf(null_distribution);
    i = find(sorted_dist_for_cdf>resultant_z,1,'first');
    pval = 1-cdf(i);
end
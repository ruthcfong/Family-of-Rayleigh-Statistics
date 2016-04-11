function samples = generate_null_distribution_via_permutation(test_type, ...
    phases, radiuses, num_samples)
    if ~exist('num_samples','var')
        num_samples = 1e6;
    end
    
    sample_size = length(phases);
    assert(sample_size == length(radiuses));
    
    rep_phases = repmat(phases, num_samples, 1);
    radiuses_perm = zeros([num_samples sample_size]);
    for i=1:num_samples
        radiuses_perm(i,:) = radiuses(randperm(sample_size));
    end
    
    [samples,~] = compute_raleigh_vector(test_type,rep_phases, radiuses_perm);
end
function [sample_magn, sample_phase] = compute_raleigh_vector(test_type, phases, radiuses)
    switch test_type,
        case 'raleigh'
            [sample_magn,sample_phase] = raleigh(phases);
        case 'moore_raleigh'
            [sample_magn,sample_phase] = moore_raleigh(phases,radiuses);
        case 'scaled_raleigh'
            [sample_magn,sample_phase] = scaled_raleigh(phases,radiuses);
    end
end
function samples = generate_null_distribution_for_raleigh(test_type,num_samples,sample_size)
%
% samples = generate_null_distribution_for_raleigh(test_type,num_samples,sample_size)
%   Generates a null distribution for one of the Rayleigh family tests 
%   ('raleigh', 'moore_raleigh', 'scaled_raleigh'). Phases are uniformly 
%   sampled from [0,2*pi]; the distribution's radii are sampled
%   from the standard normal distribution, N(0,1). For each sample, the 
%   chosen Rayleigh critical z score is computed on the sample set's 
%   (phase, radius) pairs. The return value is the array of critical
%   z-score samples.
%
%   Input:
%     test_type     type of Rayleigh test: {'raleigh',
%                       'moore_raleigh','scaled_raleigh'}
%     [num_samples  number of samples in the null distribution (default: 1e6)]
%     [sample_size  size of each sample, i.e. number of (phase,radius) pairs
%                       (default: 100)]
%
%   Output:
%     samples       null distribution of critical z scores for the
%                       chosen Rayleigh test type
% 
% Ruth Fong, 4 April 2016
% 
% Family of Rayleigh Test Toolbox


    if ~exist('num_samples','var')
        num_samples = 1e6;
    end
    if ~exist('sample_size','var')
        sample_size = 100;
    end
    
    phases=2*pi*rand([num_samples, sample_size]);
    radiuses=normrnd(0,1,[num_samples, sample_size]);
    [samples,~] = compute_raleigh_vector(test_type, phases, radiuses);
end
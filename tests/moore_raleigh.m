function [r_star, resultant_phase] = moore_raleigh(phases, radiuses)
        [m,n] = size(phases);
        [m2,n2] = size(radiuses);
        assert(m == m2 && n == n2);
        MAX_CAPACITY = 1e5;
        if m > 1
            sorted_i = zeros([m, n]);
            for i=1:ceil(m/MAX_CAPACITY),
                last_ind = min(i*MAX_CAPACITY,m);
                idx = ((i-1)*MAX_CAPACITY+1):last_ind;
                [~,sorted_i(idx,:)] = sort(radiuses(idx,:),2);
            end
            fixed_sorted_i = m*sorted_i - repmat(((m:-1:1)-1)',[1 n]);
            sorted_phases = phases(fixed_sorted_i);
            weights=repmat(1:n,[m 1]);
            x = sum(weights.*cos(sorted_phases),2);
            y = sum(weights.*sin(sorted_phases),2);
            r2 = x.^2 + y.^2;
            r = sqrt(r2);
            r_star = r/n^(1.5);
            resultant_phase = atan2(y,x);
        else
        	[~,sorted_i] = sort(radiuses);
            sorted_phases = phases(sorted_i);
            weights=1:n;
            x = sum(weights.*cos(sorted_phases));
            y = sum(weights.*sin(sorted_phases));
            r2 = x^2 + y^2;
            r = sqrt(r2);
            r_star = r/n^(1.5);
            resultant_phase = atan2(y,x);
        end
end
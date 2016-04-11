function [z_star, resultant_phase] = scaled_raleigh(phases, radiuses)
    [m,n] = size(phases);
    [m2,n2] = size(radiuses);
    assert(m == m2 && n == n2);
    if m > 1
        x = sum(radiuses.*cos(phases),2);
        y = sum(radiuses.*sin(phases),2);
        r2 = x.^2 + y.^2;
        z_star = r2/n;
        resultant_phase = atan2(y,x);
    else
        x = sum(radiuses.*cos(phases));
        y = sum(radiuses.*sin(phases));
        r2 = x^2 + y^2;
        z_star = r2/n;
        resultant_phase = atan2(y,x);
    end
end
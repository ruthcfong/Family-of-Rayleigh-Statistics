function [z, resultant_phase] = raleigh(phases)
    [m,n] = size(phases);
    if m > 1
        x = sum(cos(phases),2)/n;
        y = sum(sin(phases),2)/n;
        r2 = (x.^2 + y.^2);
        z = n*r2;
        resultant_phase = atan2(y,x);
    else
        x = sum(cos(phases))/n;
        y = sum(sin(phases))/n;
        r2 = x^2 + y^2;
        z = n*r2;
        resultant_phase = atan2(y,x);
    end
end
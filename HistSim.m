function sim = HistSim(p, q)
% p, q are two histrogram with n bins
% p, q are column vector
    sim = sqrt(p' * q);
end

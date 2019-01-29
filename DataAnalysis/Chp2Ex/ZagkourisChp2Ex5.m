mu = 4;
sigma = 0.01;

% the probability of a rod to be up to 3.9 meters and get rejected is

p1 = normcdf(3.9,mu,sigma)


% the minimum cutoff length for 1% of the rods to be discarded is

l1 = norminv(0.01,mu,sigma)
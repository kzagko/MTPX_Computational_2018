function [R C]=corr1(X,v)
%function to calculate autocorrelation in timeseries A with itself after a
%lag. v is the vector with integers lags in it.
xsize = length(X);
nsize = length(v);
R = zeros(nsize,1);
C = zeros(nsize,1);
for i=1:nsize
    end1 = xsize-v(i);
    X2 = X(1:end1);
    start2 = v(i)+1;
    Y = X(start2:end);
    Rlimit = 2/sqrt(length(Y));
    R(i)=corr(X2,Y); %get the corelation factor for the v(i)th lag
    if abs(R(i)) > Rlimit
        C(i) = 0;
    else
        C(i) = 1;
    end






end
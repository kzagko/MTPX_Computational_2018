function [R C] = MyAutocorrelation(X,v,L,alpha)
%function to create random pairs and check the correlation for a specific
%delay
% X the data array
%v the vector with the delays
%L the number of random cycles
%alpha the percentage of significance

xsize = length(X);
nsize = length(v);
R = zeros(nsize,1);
C = zeros(nsize,1);
for i=1:nsize
    end1 = xsize-v(i);
    X2 = X(1:end1);
    start2 = v(i)+1;
    Y = X(start2:end);
    ylength = length(Y);
    Rtest = zeros(L,1);
    R(i) = corr(X2,Y);
    for j=1:L%randomise loop the order of data
        c1 = randperm(ylength);
        Y1 = Y(c1);
        
    
    
    
    end
    
    [Rsort Ind] = sort(Rtest);
    %minR = Rsort(floor(L*alpha/2));
    %maxR = Rsort(ceil(L*(1-alpha/2)));
    minR = Rsort(floor(L*alpha));
    %maxR = Rsort(ceil(L*(1-alpha/2)));
    %if minR <= R(i) & R(i) <=maxR
    if abs(minR) <= abs(R(i))
        C(i) = 0;
    else
        C(i) = 1;
    end
    
    
end





end
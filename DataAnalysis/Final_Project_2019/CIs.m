function [pCIs,npCIs] = CIs(A,B,alpha)
%Calculate the Confidence Intervals(CIs) for the relative mean value of
%A compared to B for a significance level of alpha. Returns bothe
%the parametric and non parametric CIS.

D3 = A./B; %relative value
meanD3 = mean(D3); %mean of relative
stdD3 = std(D3);%std of relative
nsize = length(D3);
%parametric analysis
ta = tinv(1-alpha/2,nsize-1);
pCIs = [meanD3-ta*stdD3/sqrt(nsize),meanD3+ta*stdD3/sqrt(nsize)];%parametric intervals

%non parametric analysis
m = 1000; %number of randomly selecting sets of pairs
%create random pairs fo A and B by randomly selecting the indices of array
%B
D4 = zeros(m,1);

for i=1:m
    indx = unidrnd(nsize,nsize,1);
    D4(i) = mean(A(indx)./B(indx));    
end

D4 = sort(D4);
minCI = round(m*alpha/2);
maxCI = round(m*(1-alpha/2));

npCIs = [D4(minCI),D4(maxCI)];


end
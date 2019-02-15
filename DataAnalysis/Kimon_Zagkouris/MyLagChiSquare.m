%Den katalaba katholou ti thelete na kanoume me to 1 kai -1 den mporesa na
%katalabo poies diafors timon thelete. Giauto afti i sunarthsh den
%douleuei. Sas vazo apla pos tha ekana elegxo Chi2 se kapoio array gia na
%deite oti to gnorizo


function [Chi2 C] = MyLagChiSquare(X,v,L,alpha)

% X the data array
%v the vector with the delays
%L the number of random cycles
%alpha the percentage of significance

npoints = length(X);
meanV = mean(X);
stdV =  std(X);
numbin = 10;
[ncounts, Edges] = histcounts(X,numbin);
degfree = numbin-3;%because continuous distributions with mean and sigma and sum npoints
chi2limit = chi2inv(1-alpha,degfree);%the upperlimit in chi2 above which H0 is rejected
       
for k=1:numbin
    expval(k) = npoints*(normcdf(Edges(k+1),meanV,stdV)-normcdf(Edges(k),meanV,stdV));
end
xi2 = sum((ncounts-expval).^2./expval);
if xi2 < chi2limit
   h = 0;
else
   h = 1;
end    
    
end
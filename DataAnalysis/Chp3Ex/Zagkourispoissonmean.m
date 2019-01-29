function [meanM,meanAr] = Zagkourispoissonmean(lambda,m,n)

Ar = poissrnd(lambda,m,n);
meanAr = mean(Ar,2);


nbins = round(1 + 3.32*log(m));
histfit(meanAr,nbins);
y1=get(gca,'ylim');
hold on;
meanM = mean(meanAr);
plot([meanM meanM], y1,'r--')
title({['Distribution of the mean value of ',num2str(m),' sets of ', num2str(n),' random'];[ 'variables following Poisson distribution']})
legend('Data','Normal density function',['Mean = ', num2str(meanM)])
hold off;
end
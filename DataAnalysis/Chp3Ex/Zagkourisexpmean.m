function [meanM,Ar] = Zagkourisexpmean(lambda,m,n)

Ar = exprnd(lambda,m,n);
meanAr = mean(Ar,2);

clf;
nbins = round(1 + 3.32*log(m));
f1 = histfit(meanAr,nbins);
y1=get(gca,'ylim');
hold on;
meanM = mean(meanAr);
plot([meanM meanM], y1,'r--')
title({['Distribution of the mean value of ',num2str(m),' sets of ', num2str(n),' random'];[ 'variables following Exponential distribution']})
legend('Data','Normal density function',['Mean = ', num2str(meanM)])

end
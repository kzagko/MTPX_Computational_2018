h1V = [80 100 90 120 95];
h2V = [48 60 50 75 56];
e0V = 0.76;
stdh1V = std(h1V);
stdh2V = std(h2V);
meanh1V = mean(h1V);
meanh2V = mean(h2V);
eV = sqrt(h2V./h1V);
meaneV = mean(eV);
stdeV = std(eV);

fprintf(['The mean value for h1 is %f, with a standard deviation of %f \n', ...
   ' and the uncertainty for each measurement is %f\n'],meanh1V,stdh1V/sqrt(length(h1V)),stdh1V);
fprintf(['The mean value for h2 is %f, with a standard deviation of %f \n', ...
   ' and the uncertainty for each measurement is %f\n'],meanh2V,stdh2V/sqrt(length(h2V)),stdh2V);
fprintf(['The mean value for e is %f, with a standard deviation of %f \n', ...
   ' and the uncertainty for each measurement is %f\n'],meaneV,stdeV/sqrt(length(eV)),stdeV);

[h,p,ci,stats] = ttest(eV,e0V);
prob = abs(tinv(p,length(eV)-1));

fprintf('The ball is accepted as well inflated up to the %.2f%% level of significance\n',prob*100);

%Calculating using covariance among the h1 and h2 variables assuming both
%come from a normal distribution and the std is the uncertainty of each
%measurement.

covM = cov(h1V,h2V);


varsum1 = (1/4)*(1/(meanh1V*meanh2V))*covM(1,1);
varsum2 = (1/4)*((meanh1V/(meanh2V^3))*covM(2,2));
varsum3 = -(1/4)*(1/meanh2V^2)*covM(1,2);
vareV = varsum1+varsum2+2*varsum3;
sigmaeV = sqrt(vareV);




fprintf('The mean value for e is %f, with a propagated error including covariance of %f \n',meaneV,sigmaeV);


% figure();
% histfit(h1V);
% figure();
% histfit(h2V);


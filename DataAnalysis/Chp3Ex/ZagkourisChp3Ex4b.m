%read data values
dataV = dlmread('kV.dat');

%Calculate basic statistics
meanV = mean(dataV);
stdV =  std(dataV);
nfreeV = length(dataV)-1; %Degrees of fredom
sigma0V = 5; %Hypothesized sigma value
%The left and right values of chi2
chi2V = (nfreeV*stdV)/sigma0V;

%Find the significance level at wich sigma0 can be dismissed
signifV = chi2cdf(chi2V,nfreeV);

disp(['The value of ',num2str(sigma0V),' for the standard deviation of this sample '...
'can be dismissed at the level of ',num2str((1-signifV)*100),'% significance'])
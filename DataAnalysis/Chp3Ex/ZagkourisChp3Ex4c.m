%read data values
dataV = dlmread('kV.dat');

%Calculate basic statistics
meanV = mean(dataV);
stdV =  std(dataV);

%The significance level
alevelV = 0.95;
alphaV = 1-alevelV; 
nfreeV = length(dataV)-1; %Degrees of fredom

[h,p,ci,D] = ttest(dataV,meanV,'Alpha',alphaV);

disp(['The ',num2str(alevelV*100),'% confidence intervals '...
'for the mean are ',num2str(ci(1)),' and ',num2str(ci(2)),' and the mean is ',num2str(meanV)])
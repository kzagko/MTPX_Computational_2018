%read data values
dataV = dlmread('kV.dat');

%Calculate basic statistics
meanV = mean(dataV);
stdV =  std(dataV);
meanV0 = 52; % the mean value to test for

%The significance level
alevelV = 0.95;
alphaV = 1-alevelV; 
nfreeV = length(dataV)-1; %Degrees of fredom

tV = (meanV0-meanV)/(stdV/sqrt(nfreeV+1));
pV = 1-tcdf(tV,nfreeV);

[h,p,ci,D] = ttest(dataV,meanV0,'Alpha',alphaV);

disp(['The value of ',num2str(meanV0),' for the mean of this sample '...
'can be dismissed up to the level of ',num2str((1-pV)*100),'% significance'])
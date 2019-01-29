%read data values
dataV = dlmread('kV.dat');

%Calculate basic statistics
meanV = mean(dataV);
stdV =  std(dataV);
diaspV = stdV^2;

%The significance level
alevelV = 0.95;
alphaV = 1-alevelV; 
nfreeV = length(dataV)-1; %Degrees of fredom

%The left and right values of chi2 in that significance level
leftchi2V = chi2inv(alphaV/2,nfreeV);
rightchi2V = chi2inv(1-alphaV/2,nfreeV);

diaspV2 = (nfreeV*diaspV)/leftchi2V;
diaspV1 = (nfreeV*diaspV)/rightchi2V;

disp(['The ',num2str(alevelV*100),'% confidence intervals '...
'for the dispersion are ',num2str(diaspV1),' and ',num2str(diaspV2),' and the dispersion is ',num2str(diaspV)])
%read data values
dataV = dlmread('kV.dat');

%Calculate basic statistics
meanV = mean(dataV);
stdV =  std(dataV);


nfreeV = length(dataV)-1; %Degrees of fredom



[h,p,stats] = chi2gof(dataV);

disp({['The goodness of figure test, rejects that the data are from a normal'];
    [' distribution with a mean value of ',num2str(meanV),' and standard'];
    [' deviation of ',num2str(stdV),' at the ',num2str(100*(1-p)),'% significance level']})

figure();
clf();
histfit(dataV,10)
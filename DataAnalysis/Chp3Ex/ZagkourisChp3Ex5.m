clear All;
close All;
%read data values
dataV = dlmread('eruption.dat');



%Calculate basic statistics
mean1989wtV = mean(dataV(:,1));
mean1989drV = mean(dataV(:,2));
mean2006wtV = mean(dataV(:,1));

std1989wtV =  std(dataV(:,1));
std1989drV =  std(dataV(:,2));
std2006wtV =  std(dataV(:,3));

nfreeV = length(dataV)-1; %Degrees of fredom


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Part A %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('******   PART A  ********')
alevelV = 0.95;
alphaV = 1-alevelV;

%The left and right values of chi2 in that significance level
leftchi2V = chi2inv(alphaV/2,nfreeV);
rightchi2V = chi2inv(1-alphaV/2,nfreeV);

diasp1989wtV2 = (nfreeV*std1989wtV^2)/leftchi2V;
diasp1989wtV1 = (nfreeV*std1989wtV^2)/rightchi2V;
diasp1989drV2 = (nfreeV*std1989drV^2)/leftchi2V;
diasp1989drV1 = (nfreeV*std1989drV^2)/rightchi2V;
diasp2006wtV2 = (nfreeV*std2006wtV^2)/leftchi2V;
diasp2006wtV1 = (nfreeV*std2006wtV^2)/rightchi2V;

disp({['The ',num2str(alevelV*100),'% confidence intervals for the',...
    ' standard deviation'];[' of the 1989 waiting time are '...
    ,num2str(sqrt(diasp1989wtV1)),' and ',num2str(sqrt(diasp1989wtV2))];
[' and the standard deviation is is ',num2str(std1989wtV)]})

disp({['The ',num2str(alevelV*100),'% confidence intervals for the',...
    ' standard deviation'];[' of the 1989 duration time are '...
    ,num2str(sqrt(diasp1989drV1)),' and ',num2str(sqrt(diasp1989drV2))];
[' and the standard deviation is is ',num2str(std1989drV)]})

disp({['The ',num2str(alevelV*100),'% confidence intervals for the',...
    ' standard deviation'];[' of the 2006 waiting time are '...
    ,num2str(sqrt(diasp2006wtV1)),' and ',num2str(sqrt(diasp2006wtV2))];
[' and the standard deviation is is ',num2str(std2006wtV)]})

%%% Testing if the standard deviation can be 10 and 1 minutes for the 
%%% the waiting time and the duration respectively.
wtV0 = 10;
drV0 = 1;

sigma1989wtV0 = wtV0; %Hypothesized sigma value
sigma1989drV0 = drV0; %Hypothesized sigma value
sigma2006wtV0 = wtV0; %Hypothesized sigma value
%The left and right values of chi2
chi1989wt2V = (nfreeV*std1989wtV)/sigma1989wtV0;
chi1989dr2V = (nfreeV*std1989drV)/sigma1989drV0;
chi2006wt2V = (nfreeV*std2006wtV)/sigma2006wtV0;
%Find the significance level at wich sigma0 can be dismissed
signif1989wtV = chi2cdf(chi1989wt2V,nfreeV);
signif1989drV = chi2cdf(chi1989dr2V,nfreeV);
signif2006wtV = chi2cdf(chi2006wt2V,nfreeV);


disp({['The value of ',num2str(wtV0),' minutes for this sample''s standard'];
    [' deviation of 1989 waiting time '...
'can be dismissed at the level of ',num2str((1-signif1989wtV)*100),'% significance']})

disp({['The value of ',num2str(drV0),' minutes for this sample''s standard'];
    [' deviation of 1989 duration '...
'can be dismissed at the level of ',num2str((1-signif1989drV)*100),'% significance']})

disp({['The value of ',num2str(wtV0),' minutes for this sample''s standard'];
    [' deviation of 2006 waiting time '...
'can be dismissed at the level of ',num2str((1-signif2006wtV)*100),'% significance']})

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Part B %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('******   PART B  ********')
alevelV = 0.95;
alphaV = 1-alevelV;

%%%%%%%%%%% Estimated mean values for the waiting time and duration

mean1989wtV0 = 75;
mean1989drV0 = 2.5;
mean2006wtV0 = 75;

[h1,p1,ci1,stats1] = ttest(dataV(:,1),mean1989wtV0,'Alpha',alphaV);
[h2,p2,ci2,stats2] = ttest(dataV(:,2),mean1989drV0,'Alpha',alphaV);
[h3,p3,ci3,stats3] = ttest(dataV(:,3),mean2006wtV0,'Alpha',alphaV);

disp({['The ',num2str(alevelV*100),'% confidence interval for the mean waitining time in 1989 is '];
    [num2str(ci1(1)),' and ',num2str(ci1(2)),' and the mean is ',num2str(mean1989wtV)]})
disp({['The ',num2str(alevelV*100),'% confidence interval for the mean duration time in 1989 is '];
    [num2str(ci2(1)),' and ',num2str(ci2(2)),' and the mean is ',num2str(mean1989drV)]})
disp({['The ',num2str(alevelV*100),'% confidence interval for the mean waitining time in 2006 is '];
    [num2str(ci3(1)),' and ',num2str(ci3(2)),' and the mean is ',num2str(mean2006wtV)]})

disp({['The value of ',num2str(mean1989wtV0),' minutes for this sample''s mean'];
    [' 1989 waiting time '...
'can be dismissed at the level of ',num2str((1-p1)*100),'% significance']})

disp({['The value of ',num2str(mean1989drV0),' minutes for this sample''s mean'];
    [' 1989 duration '...
'can be dismissed at the level of ',num2str((1-p2)*100),'% significance']})

disp({['The value of ',num2str(mean2006wtV0),' minutes for this sample''s mean'];
    [' 2006 waiting time '...
'can be dismissed at the level of ',num2str((1-p3)*100),'% significance']})

[hg1,pg1,statsg1] = chi2gof(dataV(:,1));
[hg2,pg2,statsg2] = chi2gof(dataV(:,2));
[hg3,pg3,statsg3] = chi2gof(dataV(:,3));

disp({['The goodness of figure test, rejects that the data for the 1989 waiting time are from a normal'];
    [' distribution with a mean value of ',num2str(mean1989wtV),' and standard'];
    [' deviation of ',num2str(std1989wtV),' at the ',num2str(100*(1-pg1)),'% significance level']})

disp({['The goodness of figure test, rejects that the data for the 1989 duration are from a normal'];
    [' distribution with a mean value of ',num2str(mean1989drV),' and standard'];
    [' deviation of ',num2str(std1989drV),' at the ',num2str(100*(1-pg2)),'% significance level']})

disp({['The goodness of figure test, rejects that the data for the 2006 waiting timeare from a normal'];
    [' distribution with a mean value of ',num2str(mean2006wtV),' and standard'];
    [' deviation of ',num2str(std2006wtV),' at the ',num2str(100*(1-pg3)),'% significance level']})


figure();
histfit(dataV(:,1))
title('The 1989 waiting time')
figure();
histfit(dataV(:,2))
title('The 1989 duration time')
figure();
histfit(dataV(:,3))
title('The 2006 waiting time')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% Final part
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('******   FINAL PART   ********')

% Split the data in two sets depending on duration under or over 2.5
% minutes

dataUnV = dataV;
dataOvV = dataV;
dataUnV(dataV(:,2)>2.5,:)=[];
dataOvV(dataV(:,2)<=2.5,:)=[];

%Calculate basic statistics
mean1989UnwtV = mean(dataUnV(:,1));
mean1989OvwtV = mean(dataOvV(:,1));
std1989UnwtV =  std(dataUnV(:,1));
std1989OvwtV =  std(dataOvV(:,1));
nfreeUnV = length(dataUnV)-1; %Degrees of fredom
nfreeOvV = length(dataOvV)-1; %Degrees of fredom

% Get the std confidence levels and check if it can be 10 minutes
alevelV = 0.95;
alphaV = 1-alevelV;

%The left and right values of chi2 in that significance level
leftchi2UnV = chi2inv(alphaV/2,nfreeUnV);
rightchi2UnV = chi2inv(1-alphaV/2,nfreeUnV);
leftchi2OvV = chi2inv(alphaV/2,nfreeOvV);
rightchi2OvV = chi2inv(1-alphaV/2,nfreeOvV);

diasp1989UnwtV2 = (nfreeUnV*std1989UnwtV^2)/leftchi2UnV;
diasp1989UnwtV1 = (nfreeUnV*std1989UnwtV^2)/rightchi2UnV;
diasp1989OvwtV2 = (nfreeOvV*std1989OvwtV^2)/leftchi2OvV;
diasp1989OvwtV1 = (nfreeOvV*std1989OvwtV^2)/rightchi2OvV;

disp({['The ',num2str(alevelV*100),'% confidence intervals for the',...
    ' standard deviation'];[' of the 1989 waiting time under 2.5 minutes are '...
    ,num2str(sqrt(diasp1989UnwtV1)),' and ',num2str(sqrt(diasp1989UnwtV2))];
[' and the standard deviation is is ',num2str(std1989UnwtV)]})

disp({['The ',num2str(alevelV*100),'% confidence intervals for the',...
    ' standard deviation'];[' of the 1989 waiting time over 2.5 minutes are '...
    ,num2str(sqrt(diasp1989OvwtV1)),' and ',num2str(sqrt(diasp1989OvwtV2))];
[' and the standard deviation is is ',num2str(std1989OvwtV)]})

%%% Testing if the standard deviation can be 10 minutes for the 
%%% the waiting time.
wtV0 = 10;

sigma1989UnwtV0 = wtV0; %Hypothesized sigma value
sigma1989OvwtV0 = wtV0; %Hypothesized sigma value

%The left and right values of chi2
chi1989Unwt2V = (nfreeUnV*std1989UnwtV)/sigma1989UnwtV0;
chi1989Ovwt2V = (nfreeOvV*std1989OvwtV)/sigma1989OvwtV0;
%Find the significance level at wich sigma0 can be dismissed
signif1989UnwtV = chi2cdf(chi1989Unwt2V,nfreeUnV);
signif1989OvwtV = chi2cdf(chi1989Ovwt2V,nfreeOvV);

disp({['The value of ',num2str(wtV0),' minutes for this sample''s standard'];
    [' deviation of 1989 waiting time under 2.5 minutes '...
'can be dismissed at the level of ',num2str((1-signif1989UnwtV)*100),'% significance']})

disp({['The value of ',num2str(wtV0),' minutes for this sample''s standard'];
    [' deviation of 1989 waiting time over 2.5 minutes'...
' can be dismissed at the level of ',num2str((1-signif1989OvwtV)*100),'% significance']})




alevelV = 0.95;
alphaV = 1-alevelV;

%%%%%%%%%%% Estimated mean values for the waiting time for under and over
%%%%%%%%%%% 2.5 minutes distributions

mean1989UnwtV0 = 65;
mean1989OvwtV0 = 91;

[hUn1,pUn1,ciUn1,statsUn1] = ttest(dataUnV(:,1),mean1989UnwtV0,'Alpha',alphaV);
[hOv1,pOv1,ciOv1,statsOv1] = ttest(dataOvV(:,1),mean1989OvwtV0,'Alpha',alphaV);

disp({['The ',num2str(alevelV*100),'% confidence interval for the mean waitining time in 1989 of under 2.5 minutes duration is '];
    [num2str(ciUn1(1)),' and ',num2str(ciUn1(2)),' and the mean is ',num2str(mean1989UnwtV)]})
disp({['The ',num2str(alevelV*100),'% confidence interval for the mean waitining time in 1989 of over 2.5 minutes duration is '];
    [num2str(ciOv1(1)),' and ',num2str(ciOv1(2)),' and the mean is ',num2str(mean1989OvwtV)]})


disp({['The value of ',num2str(mean1989UnwtV0),' minutes for this sample''s mean'];
    [' 1989 waiting time with a duration under 2.5 minutes'...
' can be dismissed at the level of ',num2str((1-pUn1)*100),'% significance']})
disp({['The value of ',num2str(mean1989OvwtV0),' minutes for this sample''s mean'];
    [' 1989 waiting time with a duration over 2.5 minutes'...
' can be dismissed at the level of ',num2str((1-pOv1)*100),'% significance']})

% check for goodness of fit for the two distributions

[hgUn1,pgUn1,statsgUn1] = chi2gof(dataUnV(:,1));
[hgOv1,pgOv1,statsgOv1] = chi2gof(dataOvV(:,1));

disp({['The goodness of figure test, rejects that the data for the 1989 waiting time under 2.5 minutes duration are from a normal'];
    [' distribution with a mean value of ',num2str(mean1989UnwtV),' and standard'];
    [' deviation of ',num2str(std1989UnwtV),' at the ',num2str(100*(1-pgUn1)),'% significance level']})
disp({['The goodness of figure test, rejects that the data for the 1989 waiting time over 2.5 minutes duration are from a normal'];
    [' distribution with a mean value of ',num2str(mean1989OvwtV),' and standard'];
    [' deviation of ',num2str(std1989OvwtV),' at the ',num2str(100*(1-pgOv1)),'% significance level']})


figure();
histfit(dataUnV(:,1))
title('The 1989 waiting time with duration under 2.5 minutes')
figure();
histfit(dataOvV(:,1))
title('The 1989 waiting time with duration over 2.5 minutes')


clc;
clear all;
T = readtable("hospital.txt"); %%read file as table
Nsize = length(T.ManHours);

%% Run stepwise fit to find the fewest variables explaining the data
[b,se,pval,inmodel,stats,nextstep,history] = stepwisefit(T{:,2:end},T.ManHours); 

%% Add a column of constants (ones) at the end of the table 
T2 = table(ones(length(T.ManHours),1));
Tnew = [T T2];

[b2,bint,r,rint,stats2] = regress(Tnew.ManHours,Tnew{:,2:end});
%[b2,bint,r,rint,stats2] = regress(T.Mass,T{:,2:end});


fprintf("\n The estimated fitting parameters for the stepwise and full models are \n")
fprintf("Stepwise    Full\n")
fprintf("%5.2e %5.2e\n", [b.*inmodel',b2(1:3)]')


fprintf("\n The estimated error variance for the stepwise and full models are \n")
fprintf("Stepwise    Full\n")
fprintf("%5.2e %5.2e\n",stats.rmse ,stats2(4))


R21 = 1-stats.SSresid/stats.SStotal;
k= sum(inmodel);
AdjR21 = 1-((Nsize-1)/(Nsize-k-1))*stats.SSresid/stats.SStotal;

fprintf("\n The estimated R2 and AdjR2 for the stepwise and full models are \n")
fprintf("Stepwise    Full\n")
fprintf("R2  %5.2e %5.2e\n",R21 ,stats2(1))
fprintf("AdjR2  %5.2e %5.2e\n",AdjR21 ,1-((Nsize-1)/(Nsize-10-1))*(1-stats2(1)))

figure()
plot(T.ManHours,stats.yr,'o')
hold on
plot(T.ManHours,r,'x')
title("Fitting residuals")
ylabel("Residuals")
xlabel("Mass")
legend("Stepwise","Full",'Location', 'Best')

pause
%%Checking multicollinearity for the rest variables

%% Run stepwise fit to find the fewest variables explaining the data
[b3,se3,pval3,inmodel3,stats3,nextstep3,history3] = stepwisefit(T{:,3:end},T.Cases); 

R21cases = 1-stats3.SSresid/stats3.SStotal;
k= sum(inmodel3);
AdjR21cases = 1-((Nsize-1)/(Nsize-k-1))*stats3.SSresid/stats3.SStotal;

[b3,se3,pval3,inmodel3,stats3,nextstep3,history3] = stepwisefit(T{:,[2 4]},T.Eligible); 

R21Eligible = 1-stats3.SSresid/stats3.SStotal;
k= sum(inmodel3);
AdjR21Eligible = 1-((Nsize-1)/(Nsize-k-1))*stats3.SSresid/stats3.SStotal;

[b3,se3,pval3,inmodel3,stats3,nextstep3,history3] = stepwisefit(T{:,[2 3]},T.OpRooms); 

R21OpRooms = 1-stats3.SSresid/stats3.SStotal;
k= sum(inmodel3);
AdjR21OpRooms = 1-((Nsize-1)/(Nsize-k-1))*stats3.SSresid/stats3.SStotal;

fprintf("\n \n \nThe estimated R2 and AdjR2 for the last three parameters \n")
fprintf("Parameter R2 AdjR2\n")
fprintf("Cases  %5.2e %5.2e\n",R21cases ,AdjR21cases)
fprintf("Eligible  %5.2e %5.2e\n",R21Eligible ,AdjR21Eligible)
fprintf("OpRooms  %5.2e %5.2e\n",R21OpRooms ,AdjR21OpRooms)



%% Auto test for multicollinearity

collintest(T{:,2:end})


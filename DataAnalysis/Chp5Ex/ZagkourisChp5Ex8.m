clc;
clear all;
T = readtable("physical.txt"); %%read file as table
Nsize = length(T.Bicep);

%% Run stepwise fit to find the fewest variables explaining the data
[b,se,pval,inmodel,stats,nextstep,history] = stepwisefit(T{:,2:end},T.Mass); 

%% Add a column of constants (ones) at the end of the table 
T2 = table(ones(length(T.Bicep),1));
Tnew = [T T2];

[b2,bint,r,rint,stats2] = regress(Tnew.Mass,Tnew{:,2:end});
%[b2,bint,r,rint,stats2] = regress(T.Mass,T{:,2:end});


fprintf("\n The estimated fitting parameters for the stepwise and full models are \n")
fprintf("Stepwise    Full\n")
fprintf("%5.2e %5.2e\n", [b.*inmodel',b2(1:10)]')


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
plot(T.Mass,stats.yr,'o')
hold on
plot(T.Mass,r,'x')
title("Fitting residuals")
ylabel("Residuals")
xlabel("Mass")
legend("Stepwise","Full",'Location', 'Best')


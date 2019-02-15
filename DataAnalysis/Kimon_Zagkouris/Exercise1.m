clc;
clear all;

[data,txt,raw] = xlsread('EnergyUS.xlsx');%load all data
NYSE = data(:,2); %load NYSE data

alpha = 0.05; %significance level

%%Calculate lag correlation
v=[1,2,3];%array of lags

[R C] = MyAutocorrelation(NYSE,v,1000,alpha);

T = table(R,C,'VariableNames',{'AutoCorr','AutoCorrPass'})

%convert to -1 and 1
NYSESign = sign(NYSE);


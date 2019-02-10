clc;
clear all;

%%Preload
%find all data and activities 
filelist = dir('EmissionP10*EU15.xls');%Get the filenames of the data files
% set tha filename for National Totals
TotFilename ='EmissionP10NationalTotalsEU15.xls';
filelist(7)=[];%remove the Nationatotals filename
names = {filelist(:).name};
Activities = extractBetween(names(:),"EmissionP10","EU15");
ActLength = length(Activities);
%Load a file to get the names of countries and years
[data,txt,raw] = xlsread('EmissionP10EnergyIndustriesEU15.xls');
dataname = txt(2,1);
years = str2double(txt(2:end,2));
Nyears = length(years);
Countries = [];
for i=1:length(data(1,:)) %get the name of the countries and store them
    Countries = [Countries, extractBetween(txt(1,i+2),") - "," - ")];
end
Countries = Countries';
CountLength = length(Countries);
alpha = 0.05;%Set the significance level


%%Main program
%% pick nSet random countries and activities
nSet = 10;
rng(0,'twister');%initialise seed for repetability
CountRnd = randi(CountLength,nSet,1);
ActRnd = randi(ActLength,nSet,1);
Trend = zeros(nSet,1);
Corr =  zeros(nSet,1);
for i=1:nSet
    Country = Countries{CountRnd(i)};
    Activity = Activities{ActRnd(i)};
    BM = DataLoader(filelist,ActRnd(i),CountRnd(i));

    [Trend(i) Corr(i)] = mytisan(BM,years,Country,Activity);
end

T=table({Countries{CountRnd}}',{Activities{ActRnd}}',Trend,Corr,...
    'VariableNames',{'Countries','Activities','Trend', 'AutoCorr'})





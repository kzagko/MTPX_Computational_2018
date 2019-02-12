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
Countries = [];
for i=1:length(data(1,:)) %get the name of the countries and store them
    Countries = [Countries, extractBetween(txt(1,i+2),") - "," - ")];
end
Countries = Countries';
CountLength = length(Countries);
alpha = 0.05;%Set the significance level
norder = 5; %maximum polynomial order to fit for

%%Main program
AM = xlsread(TotFilename);
R2M = zeros(CountLength,ActLength);
O1M = zeros(CountLength,ActLength);

for i=1:ActLength
    BM = DataLoader(filelist,i,1,2);
    [R2M(:,i) O1M(:,i)] = AdjRCountries(AM,BM,norder);
end
R2M = abs(R2M);
R2M(isnan(R2M)) = -inf;
[R2Ms Ind] = sort(R2M,'descend');
R2M(isinf(R2M)) = NaN;
R2Max = R2Ms(1,:);
idx = sub2ind(size(O1M), Ind(1,:), [1:ActLength]);
OrdMax = O1M(idx);
CountriesMax = {Countries{Ind(1,:)}};
%ActivitiesMax = [Activities{:}];
T = table(R2Max',OrdMax',CountriesMax','RowNames' ,Activities,'VariableNames',{'AdjR2','Order', 'Country'})

figure();
histogram(O1M);
title('Polynomial index distribution');
ylabel('Counts');
xlabel('Polynomial Order');





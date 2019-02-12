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
norder = 5; %maximum polynomial order to fit for

%%Main program
AM = xlsread(TotFilename);%load the totals
BM = zeros(Nyears,ActLength);


for j=1:CountLength
    for i = 1:ActLength
        BM(:,i) = DataLoader(filelist,i,j);
    end
    CM = [AM(:,j) BM];
    StepfitCountries(CM,Countries{j},Activities);
end

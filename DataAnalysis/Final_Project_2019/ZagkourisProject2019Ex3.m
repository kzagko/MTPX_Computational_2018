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

%%Main program
fprintf('\n The available activities are \n');

for i=1:ActLength
    fprintf('%d \t %s\n',i,Activities{i});
end
    
prompt3 = ['Choose an activity by the number on the left: '];
while 1
    Count2 = int8(input(prompt3));
    if isinteger(Count2) & 1 <= Count2 & Count2 <= ActLength
        break;
    end
end

A = DataLoader(filelist,Count2,1,1);%get the values for a specific activity
Ball = xlsread(TotFilename);%get the totals for all countries

MeanP10(A,Ball,alpha);




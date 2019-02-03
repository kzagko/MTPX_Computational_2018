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

%A = DataLoader(filelist,Count2,1);%get the values for a specific activity
B = DataLoader(filelist,Count2,2,1);
[Rmax CountriesMax Per1 Per2] = AllCountries(B,alpha);

fprintf('\nThe 10 sets of countries with the highest correlation for %s are\n',Activities{Count2});
fprintf('Correlation\t Country1\t Country2\n');
for i=1:10
    fprintf('%5.2f\t %s\t %s \n',Rmax(i),Countries{CountriesMax(i,1)},Countries{CountriesMax(i,2)});
end

fprintf('\n %5.2f%% of the sets of countries pass the Parametric test with a significance level of %5.2f%%\n',100*Per1,100*alpha);
fprintf('\n %5.2f%% of the sets of countries pass the NON-Parametric test with a significance level of %5.2f%%\n',100*Per2,100*alpha);


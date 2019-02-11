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
fprintf('\n The available Countries are \n');

for i=1:CountLength
    fprintf('%d \t %s\n',i,Countries{i});
end
    
prompt3 = ['Choose a Country by the number on the left: '];
while 1
    Count2 = int8(input(prompt3));
    if isinteger(Count2) & 1 <= Count2 & Count2 <= CountLength
        break;
    end
end
CM = zeros(length(years),ActLength);
%load all the activities for a specific country
for i=1:ActLength
    CM(:,i) = DataLoader(filelist,i,Count2);    
end

[Rmax ActivitiesMax Per1 Per2] = AllActivities(CM,alpha);

fprintf('\nThe 10 sets of Activities with the highest correlation for %s are\n',Countries{Count2});
fprintf('Correlation\t Activity1\t \t Activity2\n');
for i=1:10
    fprintf('%5.2f\t %20s\t \t %20s \n',Rmax(i),Activities{ActivitiesMax(i,1)},Activities{ActivitiesMax(i,2)});
end

fprintf('\n %5.2f%% of the sets of Activities pass \nthe Parametric test with a significance level of %5.2f%%\n',100*Per1,100*alpha);
fprintf('\n %5.2f%% of the sets of Activities pass \nthe NON-Parametric test with a significance level of %5.2f%%\n',100*Per2,100*alpha);


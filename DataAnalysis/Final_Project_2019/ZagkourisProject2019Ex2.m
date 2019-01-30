clc;
clear all;

%%Preload
%find all data and activities 
filelist = dir('EmissionP10*EU15.xls');%Get the filenames of the data files
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

alpha = 0.05;% Set the significance level Default 5%

SumH0 = 0;
for i=1:ActLength
    
    
    for j=1:CountLength
        dataV = DataLoader(filelist,i,j);
        dataV = dataV-mean(dataV);
        dataV = dataV./std(dataV);
        %Calculate basic statistics
        meanV = mean(dataV);
        stdV =  std(dataV);
        hist1 = histogram(dataV,5);
  
%         chi2 = sum((dataV-meanV)^2./dataV);
        if i ~=10 & j ~= 7%remove problematic dataset
            [h,p,stats] = chi2gof(dataV,'Alpha',alpha,'NBins',5);
        else
            h = 0;
        end
        SumH0 = SumH0 + h;
        fprintf('%d %d %d\n',i,j,SumH0);
    end
    
    
end








%num2str(100*(1-p)),'% significance level']})
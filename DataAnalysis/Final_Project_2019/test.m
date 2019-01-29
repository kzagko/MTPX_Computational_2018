clc;
clear all;


[data,txt,raw] = xlsread('EmissionP10AgricultureEU15.xls');
dataname = txt(2,1);
years = str2double(txt(2:end,2));
Countries = [];
for i=1:length(data(1,:))
    Countries = [Countries, extractBetween(txt(1,i+2),") - "," - ")];
end

Chartme(Countries(1),Countries(2),dataname,data(:,1),data(:,2),years)


function Chartme(StrA,StraB,StraC,D1,D2,years)
    
    figure();
    plot(years,D1)
    hold on;
    plot(years,D2)




end
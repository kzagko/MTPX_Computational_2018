clc;
clear all;

%%Preload
%find all data and activities 
filelist = dir('EmissionP10*EU15.xls');%Get the filenames of the data files
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

%%MAIN program
%Prompt user to choose from countries and activities
prompt = ['Choose type of plot\n One(1) for plotting DIFFERENT quantities'...
    'for the same country\n Two(2) for plotting the SAME quantity for'...
    'different countries\n Please insert 1 or 2\n'];

while 1
    chk1 = int8(input(prompt));
    if chk1 == 1 | chk1 ==2
        break;
    end
end
fprintf('\n The available countries are\n');
for i=1:CountLength
    fprintf('%d \t %s\n',i,Countries{i});
end

if chk1 ==1
    prompt2 = ['Choose one country by the number on the left: '];
    while 1
        Count1 = int8(input(prompt2));
        if isinteger(Count1) & 1 <= Count1 & Count1 <= CountLength
            break;
        end
    end
    
    fprintf('\n The available activities are \n');

    for i=1:ActLength
    fprintf('%d \t %s\n',i,Activities{i});
    end
    
    
    prompt3 = ['Choose the first activity by the number on the left: '];
    while 1
        Count2 = int8(input(prompt3));
        if isinteger(Count2) & 1 <= Count2 & Count2 <= ActLength
            break;
        end
    end
    
    
    prompt4 = ['Choose the second activity by the number on the left: '];
    while 1
        Count3 = int8(input(prompt4));
        if isinteger(Count3) & 1 <= Count3 & Count3 <= ActLength
            break;
        end
    end
    %load the data for the country
    D1 = DataLoader(filelist,Count2,Count1);
    D2 = DataLoader(filelist,Count3,Count1);
    
    Chartme(Countries(Count1),Activities(Count2),Activities(Count3),D1,D2,years,chk1)
    
else
    prompt2 = ['Choose the first country by the number on the left: '];
    while 1
        Count1 = int8(input(prompt2));
        if isinteger(Count1) & 1 <= Count1 & Count1 <= CountLength
            break;
        end
    end
    prompt3 = ['Choose the second country by the number on the left: '];
    while 1
        Count2 = int8(input(prompt3));
        if isinteger(Count2) & 1 <= Count2 & Count2 <= CountLength
            break;
        end
    end
      
    fprintf('\n The available activities are \n');

    for i=1:ActLength
    fprintf('%d \t %s\n',i,Activities{i});
    end
    
    prompt4 = ['Choose one activity by the number on the left: '];
    while 1
        Count3 = int8(input(prompt4));
        if isinteger(Count3) & 1 <= Count3 & Count3 <= ActLength
            break;
        end
    end
    %load the data for the activity
    D1 = DataLoader(filelist,Count3,Count1);
    D2 = DataLoader(filelist,Count3,Count2);
    
    Chartme(Countries(Count1),Countries(Count2),Activities(Count3),D1,D2,years,chk1)
end













function Dar = DataLoader(filenames,ActCount,Count)
    %Function that searches throught the filenames and returns the data for
    %a specific country and activity
    datafile = filenames(ActCount).name;
    
    [data,txt,raw] = xlsread(datafile);
    Dar = data(:,Count);
    
end

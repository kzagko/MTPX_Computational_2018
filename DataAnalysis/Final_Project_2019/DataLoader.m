function Dar = DataLoader(filenames,ActCount,Count,chk)
    %Function that searches throught the filenames and returns the data for
    %a specific country and activity
    datafile = filenames(ActCount).name;
    
    [data,txt,raw] = xlsread(datafile);
    if nargin<4 | chk ==0
        Dar = data(:,Count);
    else
        Dar = data;
    end
end

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
numbin = 4;
SumH0 = 0;
degfree = numbin-3;%because continuous distributions with mean and sigma and sum npoints
chi2limit = chi2inv(1-alpha,degfree);%the upperlimit in chi2 above which H0 is rejected
for i=1:ActLength
    
    expval=0;
    for j=1:CountLength
        dataV = DataLoader(filelist,i,j);
        npoints = length(dataV);
        %dataV = dataV-mean(dataV);
        %dataV = dataV./std(dataV);
        %Calculate basic statistics
        meanV = mean(dataV);
        stdV =  std(dataV);
        [ncounts, Edges] = histcounts(dataV,numbin);
       
        for k=1:numbin
            expval(k) = npoints*(normcdf(Edges(k+1),meanV,stdV)-normcdf(Edges(k),meanV,stdV));
            %expval(k) = npoints*(normcdf(Edges(k+1))-normcdf(Edges(k)));
        end
        xi2 = sum((ncounts-expval).^2./expval);
        %pval = chi2cdf(xi2,degfree,'upper');
        if xi2 < chi2limit
            h = 0;
        else
            h = 1;
        end
        p1 = scatter(i*j,xi2);
        hold on;
%         chi2 = sum((dataV-meanV)^2./dataV);
        %if i ~=10 & j ~= 7%remove problematic dataset
            %pd = fitdist(dataV,'Normal');
            %[h,p,stats] = chi2gof(dataV,'Alpha',alpha,'NBins',7,'CDF',pd);
        %else
        %    h = 0;
        %end
        
        SumH0 = SumH0 + h;
        %fprintf('%d %d %d\n',i,j,SumH0);
    end
    
    
end

p2 = line([1 ActLength*CountLength],[chi2limit chi2limit],'Color','red','LineStyle','--');
title('Testing if datasets are from Normal distribution');
ylabel('Chi2 value');
xlabel('Dataset');
legend([p1,p2],{'Chi2', 'Chi2 maximum'});
set(findall(gcf,'-property','FontSize'),'FontSize',14)
hold off;
fprintf(['\nAt the significance level of %5.2f%% the percentage of the datasets\n' ...
        'that could be from a Normal distribution are %5.2f%% \n'],100*alpha, ...
        100*(1-SumH0/(ActLength*CountLength)));

fprintf('\nAt the confindence level of %5.2f%%\n',100*alpha);
%%Part two
figure();
DataM = zeros(length(years),ActLength);

for i=1:ActLength
    
    for j=1:CountLength
       dataV = DataLoader(filelist,i,j);
       DataM(:,i) = DataM(:,i) + dataV;
    end
    npoints = length(years);
        %dataV = dataV-mean(dataV);
        %dataV = dataV./std(dataV);
        %Calculate basic statistics
    meanV = mean(DataM(:,i));
    stdV =  std(DataM(:,i));
    [ncounts, Edges] = histcounts(DataM(:,i),numbin);
       
        for k=1:numbin
            expval(k) = npoints*(normcdf(Edges(k+1),meanV,stdV)-normcdf(Edges(k), ...
                meanV,stdV));
            %expval(k) = npoints*(normcdf(Edges(k+1))-normcdf(Edges(k)));
        end
        xi2 = sum((ncounts-expval).^2./expval);
        %pval = chi2cdf(xi2,degfree,'upper');
        fprintf('\nDoes %s Follow a normal distribution : ', ...
            Activities{i});
        if xi2 < chi2limit
            h = 0;
            fprintf('YES');
            lwid = 1.5;
        else
            h = 1;
            fprintf('NO');
            lwid = 0.5;
        end
    NormAct = DataM(:,i)-meanV;
    NormAct = NormAct./std(NormAct);
    h1 = histogram(NormAct,numbin,'DisplayStyle','stairs','LineWidth',lwid);
    hold on;
    
end
fprintf('\n');
x1 = linspace(-3,3);
plot(x1,18*normpdf(x1),'LineWidth',2);
legend({Activities{:},'Normal Distribution'},'Location','Best');
title('Normalized Activity Distribution');
ylabel('Occurances');
xlabel('Sigma distance from mean');
set(findall(gcf,'-property','FontSize'),'FontSize',14)



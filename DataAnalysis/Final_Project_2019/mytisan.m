function [Trend1 Corr1] = mytisan(A,years,Country,Activity)
    
%plot the history diagram of the requested quantity
    figure();
    plot(years,A);
    titl1 = strcat('History diagram for ',{' '},Activity,' in ',{' '},Country);
    title(titl1);
    ylabel('PM10');
    xlabel('Year');
    
    %Ask the user to define the order of the polynomial trend to remove
    nsize = length(A);
    prompt1 = ['\nChoose the order of the polynomial trend to remove from\n the data (0 removes nothing!): '];
while 1
    Count1 = int8(input(prompt1));
    if isinteger(Count1) & 0 <= Count1 & Count1 <= nsize
        break;
    else
        fprintf('Enter an integer between %d and %d',0,nsize);
    end
end
x = (1:length(years))';
if Count1 > 0
    [p1,S1,mu1] = polyfit(x,A,Count1);
    yres = A-polyval(p1,x,S1,mu1);
else
    yres = A;
end

[ACF,lags,bounds] = autocorr(yres,5);
[ACF0,lags0,bounds0] = autocorr(A,5);


%check if there was original trend in the data by the autocorr
if sum(abs(ACF0(2:end))>bounds0(1)) > 0
    Trend1 = 1;
else
    Trend1 = 0;
end

if sum(abs(ACF(2:end))>bounds(1)) > 0
    Corr1 = 1;
else
    Corr1 = 0;
end

figname = strcat(Country,'_',Activity,'_Trend_and_Corr');
saveas(gcf,figname,'epsc');



end
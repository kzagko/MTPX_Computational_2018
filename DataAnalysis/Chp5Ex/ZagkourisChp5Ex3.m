clear all;
temp = dlmread('tempThes59_97.dat');
rain = dlmread('rainThes59_97.dat');
n=39;
MonthNames = {'Jan','Feb','Mar','Apr','May','Jun',...
              'Jul','Aug','Sep','Oct','Nov','Dec'};
figure();
plot(temp,rain,'+');
title('Rain and Temperature in Thessaloniki 1959-1997');
ylabel('Rain in mm');
xlabel('Temperature in C');
legend(MonthNames);



%parametric calculations
for i=1:12
    tM = corrcoef(temp(:,i),rain(:,i));
    rV(i) = tM(1,2);
end

tV0 = abs(rV.*sqrt((n-2)./(1-rV.^2)));
pV0 = 2.*(1-tcdf(tV0,n-2));
assos = pV0>0.05;

fprintf(['The Null hypothesis that the rain and temperature are \n','not correlated can be supported only for the months of \n']);
fprintf('%s ',MonthNames{assos});
fprintf('\n');

%Randomness test

m=1000;


for o=1:m
    ind = randperm(39);
    rain2 = rain(ind,:);
    for i=1:12
        tM = corrcoef(temp(:,i),rain2(:,i));
        rV(i) = tM(1,2);
    end
    tV(o,:) = abs(rV(:).*sqrt((n-2)./(1-rV(:).^2)));
    pV(o,:) = 2.*(1-tcdf(tV(o,:),n-2));
    
end

tVsort = sort(tV);

fprintf(['t0 should be between indices ',num2str(round(0.025*m)),' and ',num2str(round((1-0.025)*m)), [' and is \n',num2str(round(sum(tVsort<tV0)))],'\n']);
fprintf('%4s ',MonthNames{:});
fprintf('\n');


clear all;
data = dlmread('lightair.dat');
%data = data2
n= length(data);
c0 = 299000;
x0 = 1.29;
alpha = 0.05;
alphastr = num2str(100*(1-alpha));
%data(:,2) = data(:,2) + c0;
%cs = 1;%one if speed without offset
meandata = mean(data);
sumx2 = sum(data(:,1).^2);
sumy2 = sum(data(:,2).^2);
sumxy = sum(data(:,1).*data(:,2));
sxy = (1/(n-1))*(sum(data(:,1).*data(:,2))-n.*meandata(1).*meandata(2));
sx2 = var(data(:,1));
sy2 = var(data(:,2));


%Part A
r0_me = (sumxy-n*meandata(2)*meandata(1))/sqrt((sumx2-n*meandata(1)^2)*(sumy2-n*meandata(2)^2));
rM = corrcoef(data);
r0 = rM(1,2);
figure();
scatter(data(:,1),data(:,2));
title({'Speed of light versus air density';['Correlation coefficient ',num2str(r0)]});
xlabel(['Air density in ($Kg/m^{3}$)'],'Interpreter','latex');
ylabel(['Light speed in ($Km/s$) offset by ',num2str(-c0)],'Interpreter','latex');
hold on;


%Part B
[fit1,gof,out1] = fit(data(:,1),data(:,2),'poly1');
b1 = sxy/sx2;%Calculate linear fit
b0 = meandata(2)-b1*meandata(1);
plot(data(:,1),b1.*data(:,1)+b0);
lgdstr = {'Data',[num2str(b1,3),' x + ',num2str(b0,7)]};
legend(lgdstr);


se2 = ((n-1)/(n-2))*sy2*(1-r0^2);
sb1 = sqrt(se2/((n-1)*sx2));
b1min = b1-tinv(1-alpha/2,n-2)*sb1;
b1max = b1+tinv(1-alpha/2,n-2)*sb1;

sb0 = sqrt(se2*((1/n)+(meandata(1)^2)/((n-1)*sx2)));
b0min = b0 - tinv(1-alpha/2,n-2)*sb0;
b0max = b0 + tinv(1-alpha/2,n-2)*sb0;


%Part C
%Mean expected y values
[ymmin ymmax] = expected_mean(data(:,1),b0,b1,alpha,se2,n,meandata(1),sx2);
plot(data(:,1),ymmin,'g--');
plot(data(:,1),ymmax,'g--','HandleVisibility','off');
lgdstr = [lgdstr,strcat(alphastr,'% ymean expected')];
legend(lgdstr);


%future expected values
[yfmmin yfmmax] = expected_futureV(data(:,1),b0,b1,alpha,se2,n,meandata(1),sx2);
plot(data(:,1),yfmmin,'m--');
plot(data(:,1),yfmmax,'m--','HandleVisibility','off');
lgdstr = [lgdstr,strcat(alphastr,'% expected y')];
legend(lgdstr);

%y value at x=1.29
[ymx0min ymx0max] = expected_mean(x0,b0,b1,alpha,se2,n,meandata(1),sx2);
[yfx0min yfx0max] = expected_futureV(x0,b0,b1,alpha,se2,n,meandata(1),sx2);
fprintf('The mean expected value at %f is %f and the %s%% CIs are %f and %f \n',x0,b0+b1*x0,alphastr,ymx0min,ymx0max);
fprintf('The future expected value at %f is %f and the %s%% CIs are %f and %f \n',x0,b0+b1*x0,alphastr,yfx0min,yfx0max);

plot(x0,ymx0min,'r*','MarkerSize',10);
plot(x0,ymx0max,'r*','MarkerSize',10,'HandleVisibility','off');
plot(x0,yfx0min,'rx','MarkerSize',10);
plot(x0,yfx0max,'rx','MarkerSize',10,'HandleVisibility','off');
lgdstr = [lgdstr,strcat(alphastr,'% expected y mean at ',num2str(x0))];
lgdstr = [lgdstr,strcat(alphastr,'% expected y at ',num2str(x0))];
legend(lgdstr);

%Part D
%Testing if the real values of b1 and b0 can be accepted for this data set

[cx0,cb0,cb1] = cair(1.29);
cb0 = cb0-c0;
fprintf('\n Testing the theoretical b1 and b0 values using the sample differences \n');
b1s = (data(:,2)-cb0)./data(:,1);
b0s = data(:,2)-cb1.*data(:,1);
[cb1h, cb1p] = ttest(b1s,cb1);
[cb0h, cb0p] = ttest(b0s,cb0);
figure()
%histogram(b1s(5:end),10);
histogram(b1s,10);
title(strcat('b10 is ',num2str(cb1)));

fprintf('The hypothesis that b1 = %f can be rejected with a confidence level of %.2f%% \n',cb1,(1-cb1p)*100);
figure()
histogram(b0s,10);
title(strcat('b00 is ',num2str(cb0)));
fprintf('The hypothesis that b0 = %f can be rejected with a confidence level of %.2f%% \n',cb0,(1-cb0p)*100);



%testing using ttest

fprintf('\n Testing the theoretical b1 and b0 values using ttest directly \n');
%testing for b1 using cb0

secb1 = sqrt(sum((data(:,2)-cb1.*data(:,1)+cb0).^2)/((n-1)*sx2));
tcb1 = (b1-cb1)/secb1;
pcb1 = 2*(1-tcdf(abs(tcb1),n-2));
tcb1_ckeck = tinv(1-alpha/2,n-2);

fprintf('If %f is smaller than %f then the hypothesis that b1 = %f\n is NOT rejected at the %.2f%% significance level\n',abs(tcb1),abs(tcb1_ckeck),cb1,100*pcb1);
%testing for b0 using cb1

secb0 = sqrt((sum((data(:,2)-cb1.*data(:,1)+cb0).^2)/(n-2))*((1/n)+(meandata(1)^2)/((n-1)*sx2)));
tcb0 = (b0-cb0)/secb0;
pcb0 = 2*(1-tcdf(abs(tcb0),n-2));
tcb0_ckeck = tinv(1-alpha/2,n-2);

fprintf('If %f is smaller than %f then the hypothesis that b1 = %f\n is NOT rejected at the %.2f%% significance level\n',abs(tcb0),abs(tcb0_ckeck),cb0,100*pcb0);


%Check the residuals for theoretical b1 and b0
fprintf('\n Testing the theoretical b1 and b0 values using residuals \n');
data3 = data(:,2)-(cb0+data(:,1).*cb1);
figure();
plot(data(:,1),data3,'o');
title('residuals after subtracting b0+b1*x');
[h,p,ci,stas]=ttest(data3);
fprintf('The Hypothesis that the residuals are from a normal distribution %f (0: CANNOT, 1: CAN) be rejected with a pvalue of %f\n',h,p);

function [ymin ymax] = expected_mean(x,b0,b1,alpha,se2,n,xmean,sx2)
ymin = (b0+b1.*x) - tinv(1-alpha/2,n-2).*sqrt(se2.*(1/n+(x-xmean).^2/((n-1)*sx2)));
ymax = (b0+b1.*x) + tinv(1-alpha/2,n-2).*sqrt(se2.*(1/n+(x-xmean).^2/((n-1)*sx2)));
end


function [ymin ymax] = expected_futureV(x,b0,b1,alpha,se2,n,xmean,sx2)
ymin = (b0+b1.*x) - tinv(1-alpha/2,n-2).*sqrt(se2.*(1+1/n+(x-xmean).^2/((n-1)*sx2)));
ymax = (b0+b1.*x) + tinv(1-alpha/2,n-2).*sqrt(se2.*(1+1/n+(x-xmean).^2/((n-1)*sx2)));
end

function [c,b0,b1] = cair(d)
b0 = 299792.458;
b1 = -b0*0.00029/1.29;
c = b0+b1*d;
end




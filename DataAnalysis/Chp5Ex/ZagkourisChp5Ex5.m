
clear all;
data = dlmread('lightair.dat');
%data = data2
n= length(data);
m = 1000;
c0 = 299000;
x0 = 1.29;
alpha = 0.05;
alphastr = num2str(100*(1-alpha));
%data(:,2) = data(:,2) + c0;
%cs = 1;%one if speed without offset
MV = unidrnd(n,m,n);
DataM = zeros(m,n,2);
b1 = zeros(m,1);
b0 = zeros(m,1);
sb1 = zeros(m,1);
sb0 = zeros(m,1);
for i=1:m
DataM(i,:,:) = data(MV(i,:),:);

meandata = mean(DataM(i,:,:),2);
sumx2 = sum(DataM(i,:,1).^2);
sumy2 = sum(DataM(i,:,2).^2);
sumxy = sum(DataM(i,:,1).*DataM(i,:,2));
sxy = (1/(n-1))*(sum(DataM(i,:,1).*DataM(i,:,2))-n.*meandata(1).*meandata(2));
sx2 = var(DataM(i,:,1));
sy2 = var(DataM(i,:,2));
r0_me = (sumxy-n*meandata(2)*meandata(1))/sqrt((sumx2-n*meandata(1)^2)*(sumy2-n*meandata(2)^2));

b1(i) = sxy/sx2;%Calculate linear fit
b0(i) = meandata(2)-b1(i)*meandata(1);


se2 = ((n-1)/(n-2))*sy2*(1-r0_me^2);
sb1(i) = sqrt(se2/((n-1)*sx2));
sb0(i) = sqrt(se2*((1/n)+(meandata(1)^2)/((n-1)*sx2)));
end

b1sort = sort(b1);
b0sort = sort(b0);

minOrd = m*alpha/2;
maxOrd = m*(1-alpha/2);

fprintf('The %s%% CIs for b1 are [%.2f,%.2f] and the mean value for b1 is %.2f\n',alphastr,b1sort(minOrd),b1sort(maxOrd),mean(b1));

fprintf('The %s%% CIs for b0 are [%.2f,%.2f] and the mean value for b0 is %.2f\n',alphastr,b0sort(minOrd),b0sort(maxOrd),mean(b0));








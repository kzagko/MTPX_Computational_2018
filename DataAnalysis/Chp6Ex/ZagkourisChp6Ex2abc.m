clc;
clear all;

D = dlmread('crutem3nh.dat');



%Test Data 
% tl=308;
% pl=28;
% xf = (1001:1000+tl)';
% yf = sin(xf.*(2*pi/pl));
% yf = yf + 1*randn(tl,1);
% D = [xf yf];

Nsize = length(D);

%%History Diagram
%subplot(4,1,1);
figure();
plot(D(:,1),D(:,2),'o-');
xlabel('Year');
ylabel('Temperature');
title('History Diagram');


%%Autocorrelation with all possible lags

%subplot(4,1,2);
figure();
autocorr(D(:,2),Nsize-1);
[ACF,lags,bounds] = autocorr(D(:,2),Nsize-1);
%plot(ACF)
xlabel('Lag in years');
ylabel('Correlation');
title('Autocorellation Diagram');

%%Removing trend
figure();
%1st order polynomial
Vord = 1;
[p1,S1,mu1] = polyfit(D(:,1),D(:,2),Vord);
subplot(3,3,1);
plot(D(:,1),D(:,2),'o');
hold on;
plot(D(:,1),polyval(p1,D(:,1),S1,mu1));
title('History - 1st order fit');
xlabel('Years');
ylabel('Temperature');
hold off;


subplot(3,3,2);
D1diff = D(:,2)-polyval(p1,D(:,1),S1,mu1);
plot(D(:,1),D1diff,'o');
title('Difference');
xlabel('Years');
ylabel('Temperature');

subplot(3,3,3);
autocorr(D1diff,Nsize-1);
[ACF1,lags1,bounds1] = autocorr(D1diff,Nsize-1);
%plot(ACF)
xlabel('Lag in years');
ylabel('Correlation');
title('Autocorellation Diagram');


%2nd order polynomial
Vord = 2;
[p2,S2,mu2] = polyfit(D(:,1),D(:,2),Vord);
subplot(3,3,4);
plot(D(:,1),D(:,2),'o');
hold on;
plot(D(:,1),polyval(p2,D(:,1),S2,mu2));
title('History - 2nd order fit');
xlabel('Years');
ylabel('Temperature');
hold off;


subplot(3,3,5);
D2diff = D(:,2)-polyval(p2,D(:,1),S2,mu2);
plot(D(:,1),D2diff,'o');
title('Difference');
xlabel('Years');
ylabel('Temperature');

subplot(3,3,6);
autocorr(D2diff,Nsize-1);
[ACF2,lags2,bounds2] = autocorr(D2diff,Nsize-1);
%plot(ACF)
xlabel('Lag in years');
ylabel('Correlation');
title('Autocorellation Diagram');


%3rd order polynomial
Vord = 6;
[p3,S3,mu3] = polyfit(D(:,1),D(:,2),Vord);
subplot(3,3,7);
plot(D(:,1),D(:,2),'o');
hold on;
plot(D(:,1),polyval(p3,D(:,1),S3,mu3));
title('History - 3rd order fit');
xlabel('Years');
ylabel('Temperature');
hold off;


subplot(3,3,8);
D3diff = D(:,2)-polyval(p3,D(:,1),S3,mu3);
plot(D(:,1),D3diff,'o');
title('Difference');
xlabel('Years');
ylabel('Temperature');

subplot(3,3,9);
autocorr(D3diff,Nsize-1);
[ACF3,lags3,bounds3] = autocorr(D3diff,Nsize-1);
%plot(ACF)
xlabel('Lag in years');
ylabel('Correlation');
title('Autocorellation Diagram');



%%Part C
%first dif

D3y = D(1:end-1,2)-D(2:end,2);
D3x = D(1:end-1,1);

figure();

subplot(1,3,1);
plot(D(:,1),D(:,2),'o');
title('History');
xlabel('Years');
ylabel('Temperature');


subplot(1,3,2);
plot(D3x,D3y,'o');
title('First Differences');
xlabel('Years');
ylabel('Temperature');

subplot(1,3,3);
autocorr(D3y,Nsize-2);
[ACF4,lags4,bounds4] = autocorr(D3y,Nsize-2);
%plot(ACF)
xlabel('Lag in years');
ylabel('Correlation');
title('Autocorellation Diagram');


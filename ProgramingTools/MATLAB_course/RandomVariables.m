%%
%Random Variables Exercise
clear all;
m = 1000;
mu = 0;
sigma = 1;
data = normrnd(mu,sigma,m,1);
meanx = mean(data);
stdx = std(data);
%%
subplot(2,2,1);
plot(data,'.');
title(['Random Data with μ = ',num2str(mu),' and σ = ',num2str(sigma)]);
ylabel('Number');
xlabel('Number of points');
%%
subplot(2,2,2);
histogram(data);
title('Random numbers');
fprintf('The calculated mean value is %f\n',sum(data)/m);
fprintf('The matlab mean value is %f\n',meanx);
fprintf('The calculated std value is %f\n',sqrt(sum((data-meanx).^2)/(m-1)));
fprintf('The matlab std value is %f\n',stdx);
%%
data2 = zeros(m,1);
for i=1:m
data2(i) = mean(normrnd(mu,sigma,i,1));
end
subplot(2,2,3);
plot(data2,'.');
title('Mean values of N variables');
xlabel('N points');
ylabel('Mean value of N datapoints');
%%
meanxM = mean(data2);
stdxM = std(data2);
fprintf('The mean value for %d mean values is %f\n',m,meanx/sqrt(m));
fprintf('The std value for %d mean values is %f\n',m,stdxM);
fprintf('The std value for the mean value is %f\n',stdxM/sqrt(m));
subplot(2,2,4);
plot(data,'.');
hold on;
plot(data2,'.');
%%
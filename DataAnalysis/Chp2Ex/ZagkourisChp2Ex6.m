
y = [];

for i = 1:10000
    
    x = rand(1,100);
    y(i) = mean(x);
end
xmin = min(y);
xmax = max(y);
x =linspace(xmin,xmax,100);
ymean = mean(y);
ysigma = std(y);
histogram(y,40,'Normalization','pdf')
hold on
plot(x,(1/(ysigma*sqrt(2*pi)))*gaussmf(x,[ysigma ymean]))
y = -log(1-rand(1,1000));
x = linspace(0,10);
histogram(y,30,'Normalization','pdf')
hold on
plot(x,exp(-x))
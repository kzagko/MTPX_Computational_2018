clear all;
R=[
0.76
0.86
0.97
1.11
1.45
1.67
1.92
2.23
2.59
3.02
3.54
4.16
4.91
5.83
6.94
8.31
10.00
12.09
14.68
17.96
22.05
27.28
33.89
42.45
53.39
67.74
86.39
111.30
144.00
188.40
247.50
329.20];
T = [
110
105
100
95
85
80
75
70
65
60
55
50
45
40
35
30
25
20
15
10
5
0
-5
-10
-15
-20
-25
-30
-35
-40
-45
-50];
T = T+273.15;%Convert to Kelvin
Ydata = 1./T;
Xdata = log(R);
alpha = 0.05;
alphastr = num2str(100*(1-alpha));

p=[0 1 3];

[a,y_fit,Sa,Sy_fit,R2,Ca,condX] = mypolyfit(Xdata,Ydata,p);

figure();
scatter(Xdata,Ydata,'o');
hold on;
plot(Xdata,y_fit,'r-');
plot(Xdata,y_fit-2.*Sy_fit,'r--');
plot(Xdata,y_fit+2.*Sy_fit,'r--');

sigma_Er = sqrt(sum((Ydata-y_fit).^2)/(length(Ydata)-length(p)));
ylin = linspace(min(Ydata),max(Ydata),100);
figure();
plot(Ydata,(Ydata-y_fit)/sigma_Er,'bo');
hold on;
plot(ylin,-2.*ones(length(ylin)),'r--');
plot(ylin,+2.*ones(length(ylin)),'r--');







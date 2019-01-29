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


%%Linear fit
figure();
subplot(2,5,1);
scatter(Xdata,Ydata);
xlabel('Resistance in log Ohm');
ylabel('1/T in K');
title('Linear Fit');
hold on;
xfull = linspace(min(Xdata),max(Xdata),100);
powv = 0:1;
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(Xdata,Ydata,powv,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit',[alphastr,'% CI Fit'],'Location','best');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(-1,0.004,txt);
hold off;


%ploting the residuals
subplot(2,5,6);
dataylin = linspace(min(Ydata),max(Ydata),100);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(Ydata,(Ydata-polyval(flipud(Bme1),Xdata))./sqrt(Sigma2Er));
hold off;

clear Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit;

%%2nd Order Fit
subplot(2,5,2);
scatter(Xdata,Ydata);
xlabel('Resistance in log Ohm');
ylabel('1/T in K');
title('2nd Order Fit');
hold on;
xfull = linspace(min(Xdata),max(Xdata),100);
powv = 0:2;
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(Xdata,Ydata,powv,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit',[alphastr,'% CI Fit'],'Location','best');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(-1,0.004,txt);
hold off;


%ploting the residuals
subplot(2,5,7);
dataylin = linspace(min(Ydata),max(Ydata),100);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(Ydata,(Ydata-polyval(flipud(Bme1),Xdata))./sqrt(Sigma2Er));
hold off;


clear Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit;
%%3rd Order Fit
subplot(2,5,3);
scatter(Xdata,Ydata);
xlabel('Resistance in log Ohm');
ylabel('1/T in K');
title('3rd Order Fit');
hold on;
xfull = linspace(min(Xdata),max(Xdata),100);
powv = 0:3;
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(Xdata,Ydata,powv,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit',[alphastr,'% CI Fit'],'Location','best');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(-1,0.004,txt);
hold off;


%ploting the residuals
subplot(2,5,8);
dataylin = linspace(min(Ydata),max(Ydata),100);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(Ydata,(Ydata-polyval(flipud(Bme1),Xdata))./sqrt(Sigma2Er));
hold off;



clear Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit;
%%4th Order Fit
subplot(2,5,4);
scatter(Xdata,Ydata);
xlabel('Resistance in log Ohm');
ylabel('1/T in K');
title('4th Order Fit');
hold on;
xfull = linspace(min(Xdata),max(Xdata),100);
powv = 0:4;
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(Xdata,Ydata,powv,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit',[alphastr,'% CI Fit'],'Location','best');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(-1,0.004,txt);
hold off;


%ploting the residuals
subplot(2,5,9);
dataylin = linspace(min(Ydata),max(Ydata),100);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(Ydata,(Ydata-polyval(flipud(Bme1),Xdata))./sqrt(Sigma2Er));
hold off;


clear Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit;

% %%Special Order Fit
% subplot(2,5,5);
% scatter(Xdata,Ydata);
% xlabel('Resistance in log Ohm');
% ylabel('1/T in K');
% title('Special Order Fit');
% hold on;
% xfull = linspace(min(Xdata),max(Xdata),100);
% fun = @(x,Xdata)x(1)+x(2)*Xdata+x(3)*Xdata.^3;
% xc0 = [1 1 1];
% pxc = lsqcurvefit(fun,xc0,Xdata,Ydata);
% ser = sqrt((1/(length(Xdata)-3))*sum((Ydata-fun(pxc,Xdata)).^2));
% plot(xfull,fun(pxc,xfull),'r-');
% legend('Data','Special Fit','Location','best');
% hold off;
% 
% 
% %ploting the residuals
% subplot(2,5,10);
% dataylin = linspace(min(Ydata),max(Ydata),100);
% plot(dataylin,2.*ones(length(dataylin),1),'b--');
% hold on;
% plot(dataylin,-2.*ones(length(dataylin),1),'b--');
% scatter(Ydata,(Ydata-fun(pxc,Xdata))./sqrt(ser));
% hold off;









%%Special Order Fit
subplot(2,5,5);
scatter(Xdata,Ydata);
xlabel('Resistance in log Ohm');
ylabel('1/T in K');
title('Special Order Fit');
hold on;
xfull = linspace(min(Xdata),max(Xdata),100);
powv = [0 1 3];
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(Xdata,Ydata,powv,alpha,xfull);
fun = @(x,Xdata)x(1)+x(2)*Xdata+x(3)*Xdata.^3;
plot(xfull,fun(Bme1,xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit',[alphastr,'% CI Fit'],'Location','best');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(-1,0.004,txt);
hold off;


%ploting the residuals
subplot(2,5,10);
dataylin = linspace(min(Ydata),max(Ydata),100);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(Ydata,(Ydata-fun(Bme1,Xdata))./sqrt(Sigma2Er));
hold off;


%%
function [B,Sigma2Er,R2me,AdjR2me,SigmaB,CIB,CIFit]=MeLinFit(x,y,powv,alpha,xfull)
%Solve linear system for finding fit coefficients
%X*B=C
deg = length(powv);
dim1=deg;
npoints = length(x);
%Create power vector of polynomial
pv = powv;
pv = pv(:);
xfull = xfull(:);
X=zeros(npoints,dim1);%contains x evaluated at the powers of the polynomial
C=zeros(dim1,1);%contains the values of y at each point
%set A,B and C matrices

for i=1:dim1
    X(:,i) = x.^pv(i);
end
 
C= y(:);
%solve the linear system and get the coefficients 

P1 = eye(npoints);
Ccon = inv(X'*P1*X);
B = Ccon*X'*P1*C;
%B = X\C
%find total error
yhat = X*B;
ymean = mean(y);
%Calculating R2 and AdjR2

Sigma2Er = (1/(npoints-dim1))*sum((y-yhat).^2);
Sigma2ErMean = (1/(npoints-dim1))*sum((y-ymean).^2);
P1 = eye(npoints)/Sigma2Er;
Ccon = inv(X'*P1*X);
R2me = 1-(Sigma2Er/Sigma2ErMean);
AdjR2me = 1-((npoints-1)/(npoints-(dim1))).*(Sigma2Er/Sigma2ErMean).^2;

%VarB = (sum((y-yhat).^2)/(npoints-dim1)).*(transpose(X)*X)^(-1);
VarB = Ccon;
SigmaB = sqrt(abs(diag(VarB)));
SigmaB = SigmaB(:);

Talpha = tinv(1-alpha/2,npoints-dim1);
CIB = [B-Talpha.*SigmaB B+Talpha.*SigmaB];

%Create an X matrix for full range
XM = zeros(length(xfull),dim1);
for i=1:length(pv)
    XM(:,i) = xfull.^pv(i);
end
VarFit = XM*VarB*XM';
sigmaFit = sqrt(abs(diag(VarFit)));
yhatnew = XM*B;
CIFit = [yhatnew-Talpha.*sigmaFit yhatnew+Talpha.*sigmaFit];
end

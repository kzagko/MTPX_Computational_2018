clear all;
%% Initializing data and computing basic sums
dataA = [2,3,8,16,32,48,64,80]';
dataB = [98.2,91.7,81.3,64.0,36.4,32.6,17.1,11.3]';
data = [dataA dataB];
n= length(data);
alpha = 0.05;
alphastr = num2str(100*(1-alpha));
x0 = 25;

%% Scatter Plot of initial data and testing linear fit
figure();
subplot(2,5,1);
scatter(data(:,1),data(:,2));
xlabel('Distance in Mm');
ylabel('Percentage of left usage');
title('Tyre usage remaining over distance');
hold on;
xfull = linspace(min(data(:,1)),max(data(:,1)),100);
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(data(:,1),data(:,2),1,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit','95% CI Fit','Location','best');
xlabel('Distance in Mm');
ylabel('Percentage of left usage in Log');
title('Linear Fit');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(30,70,txt);
plot(x0,polyval(flipud(Bme1),x0),'*','HandleVisibility','off');
fprintf('Linear Fit the value at x0 = %f is %f\n',x0,polyval(flipud(Bme1),x0));
hold on;

% [p1,S1,mu1] = polyfit(data(:,1),data(:,2),1);
% [yfit1,delta] = polyval(p1,xfull,S1,mu1);
% plot(xfull,yfit1,'m-',xfull,yfit1-2*delta,'m--');

%ploting the residuals
subplot(2,5,6);
dataylin = linspace(min(data(:,2)),max(data(:,2)),10);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(data(:,2),(data(:,2)-polyval(flipud(Bme1),data(:,1)))./sqrt(Sigma2Er));
hold off;

%%2nd order fit
subplot(2,5,2);
scatter(data(:,1),data(:,2));
xlabel('Distance in Mm');
ylabel('Percentage of left usage');
title('Tyre usage remaining over distance');
hold on;
xfull = linspace(min(data(:,1)),max(data(:,1)),100);
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(data(:,1),data(:,2),2,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit','95% CI Fit','Location','best');
xlabel('Distance in Mm');
ylabel('Percentage of left usage in Log');
title('2nd Order Fit');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(30,70,txt);
plot(x0,polyval(flipud(Bme1),x0),'*','HandleVisibility','off');
fprintf('2nd Order Fit the value at x0 = %f is %f\n',x0,polyval(flipud(Bme1),x0));
hold off;

%ploting the residuals
subplot(2,5,7);
dataylin = linspace(min(data(:,2)),max(data(:,2)),10);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(data(:,2),(data(:,2)-polyval(flipud(Bme1),data(:,1)))./sqrt(Sigma2Er));
hold off;

%%3rd order fit
subplot(2,5,3);
scatter(data(:,1),data(:,2));
xlabel('Distance in Mm');
ylabel('Percentage of left usage');
title('Tyre usage remaining over distance');
hold on;
xfull = linspace(min(data(:,1)),max(data(:,1)),100);
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(data(:,1),data(:,2),3,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit','95% CI Fit','Location','best');
xlabel('Distance in Mm');
ylabel('Percentage of left usage in Log');
title('3rd Order Fit');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(30,70,txt);
plot(x0,polyval(flipud(Bme1),x0),'*','HandleVisibility','off');
fprintf('3rd Order Fit the value at x0 = %f is %f\n',x0,polyval(flipud(Bme1),x0));
hold off;

%ploting the residuals
subplot(2,5,8);
dataylin = linspace(min(data(:,2)),max(data(:,2)),10);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(data(:,2),(data(:,2)-polyval(flipud(Bme1),data(:,1)))./sqrt(Sigma2Er));
hold off;

%% Testing Logarithmic model y=ae^(bx)
datay = log(data(:,2));
datax = data(:,1);
datalog = [datax datay];
xfull = linspace(min(datax),max(datax),100);
subplot(2,5,4);
scatter(datax,datay);
hold on;
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(datax,datay,1,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit','95% CI Fit','Location','best');
xlabel('Distance in Mm');
ylabel('Percentage of left usage in Log');
title('SemiLog Linear Fit');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(40,4,txt);
plot(x0,polyval(flipud(Bme1),x0),'*','HandleVisibility','off');
fprintf('SemiLog Fit the value at x0 = %f is %f\n',x0,exp(polyval(flipud(Bme1),x0)));
hold off;

%ploting the residuals
subplot(2,5,9);
dataylin = linspace(min(datay),max(datay),10);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(datay,(datay-polyval(flipud(Bme1),datax))./sqrt(Sigma2Er));
hold off;


%% Testing Logarithmic model y=ae^(bx) with 2nd order polynomial
datay = log(data(:,2));
datax = data(:,1);
datalog = [datax datay];
xfull = linspace(min(datax),max(datax),100);
subplot(2,5,5);
scatter(datax,datay);
hold on;
[Bme1,Sigma2Er,R2me,AdjR2me,Sigma2Bme1,CIBme,CIFit] = MeLinFit(datax,datay,2,alpha,xfull);
plot(xfull,polyval(flipud(Bme1),xfull),'r-',xfull,CIFit(:,1),'b--');
plot(xfull,CIFit(:,2),'b--','HandleVisibility','off');
legend('Data','Linear Fit','95% CI Fit','Location','best');
xlabel('Distance in Mm');
ylabel('Percentage of left usage in Log');
title('SemiLog 2nd Order Linear Fit');
txtstr1=['R^2 = ' num2str(R2me)];
txtstr2=['AdjR^2 = ' num2str(AdjR2me)];
txt={txtstr1,txtstr2};
text(40,4,txt);
plot(x0,polyval(flipud(Bme1),x0),'*','HandleVisibility','off');
fprintf('SemiLog 2nd Order Fit the value at x0 = %f is %f\n',x0,exp(polyval(flipud(Bme1),x0)));
hold off;

%ploting the residuals
subplot(2,5,10);
dataylin = linspace(min(datay),max(datay),10);
plot(dataylin,2.*ones(length(dataylin),1),'b--');
hold on;
plot(dataylin,-2.*ones(length(dataylin),1),'b--');
scatter(datay,(datay-polyval(flipud(Bme1),datax))./sqrt(Sigma2Er));
hold off;


%%
function [B,Sigma2Er,R2me,AdjR2me,sigmaB,CIB,CIFit]=MeLinFit(x,y,deg,alpha,xfull)
%Solve linear system for finding fit coefficients
%X*B=C
dim1=deg+1;
npoints = length(x);
%Create power vector of polynomial
pv = 0:deg;
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
B = X\C;
%find total error
yhat = zeros(npoints,1);
yhat = yhat + X*B;
ymean = mean(y);
%Calculating R2 and AdjR2
Sigma2Er = (1/(npoints-dim1+1))*sum((y-yhat).^2);
Sigma2ErMean = (1/(npoints-dim1+1))*sum((y-ymean).^2);
R2me = 1-(Sigma2Er/Sigma2ErMean);
AdjR2me = 1-((npoints-1)/(npoints-(dim1+1))).*(Sigma2Er/Sigma2ErMean).^2;

VarB = (sum((y-yhat).^2)/(npoints-dim1)).*(transpose(X)*X)^(-1);
sigmaB = sqrt(abs(diag(VarB)));

Talpha = tinv(1-alpha/2,npoints-dim1);
CIB = [B-Talpha.*sigmaB B+Talpha.*sigmaB];

%Create an X matrix for full range
XM = zeros(length(xfull),dim1);
for i=1:dim1
    XM(:,i) = xfull.^pv(i);
end
VarFit = XM*VarB*transpose(XM);
sigmaFit = sqrt(abs(diag(VarFit)));
CIFit = [polyval(flipud(B),xfull)-Talpha.*sigmaFit polyval(flipud(B),xfull)+Talpha.*sigmaFit];
end


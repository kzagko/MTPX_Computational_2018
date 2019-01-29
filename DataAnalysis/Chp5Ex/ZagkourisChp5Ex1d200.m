%Part A
%Default values
clear all;
m = 1000;
n = 200;
mux = 0;
muy = 0;
sx = 1;
sy = 1;
r1 = 0;
r2 = 0.5;
cov1 = [sx^2 r1*sx*sy; r1*sx*sy sy^2];%Covariance matrices
cov2 = [sx^2 r2*sx*sy; r2*sx*sy sy^2];
v1 = zeros(m,n,2);
v2 = zeros(m,n,2);
corr1 = zeros(m,1);
corr2 = zeros(m,1);
testM = zeros(2,2);

for i=1:m% Loop over m to get the r calculated
    v1(i,:,:)=mvnrnd([mux,muy],cov1,n).^2;
    v2(i,:,:)=mvnrnd([mux,muy],cov2,n).^2;
    testM = corrcoef(v1(i,:,1),v1(i,:,2));
    corr1(i) = testM(1,2);%r is the (1,2) elements of the matrix
    testM = corrcoef(v2(i,:,1),v2(i,:,2));
    corr2(i) = testM(1,2);
end

z1 = atanh(corr1);%Set the Fisher tranformation
z2 = atanh(corr2);
tt1 = norminv(0.975,0,1);
sigmaz = sqrt(1/(n-3));
z1low = z1-tt1*sigmaz;
z1up = z1+tt1*sigmaz;
z2low = z2-tt1*sigmaz;
z2up = z2+tt1*sigmaz;

r1low = tanh(z1low);
r1up = tanh(z1up);
r2low = tanh(z2low);
r2up = tanh(z2up);

r1in = sum(r1low<r1 & r1up>r1);
r2in = sum(r2low<r2 & r2up>r2);

%Plot the initial r distribution
clf();
%figure();
%histogram2(corr1,corr2);
histogram(corr1);
hold on;
histogram(corr2);
title('Bivariable distribution for ρ=0 and ρ=0.5');
xlabel('Estimator r values');
legend('ρ=0','ρ=0.5');
xlim([-1 1]);
hold off;

%Plot the z distribution
figure();
%histogram2(corr1,corr2);
histogram(z1);
hold on;
histogram(z2);
title('Fisher transformation z distribution for ρ=0 and ρ=0.5');
xlabel('Estimator z values');
legend('ρ=0','ρ=0.5');

%Plot the lower and upper limits
figure();
histogram(r1low);
hold on;
histogram(r1up);
title({'Lower and upper limits for r given ρ=0',['The ρ=0 is within boundaries for ',num2str(100*r1in/m),'% of the cases']});
xlabel('Estimator r values');
legend('Lower','Upper');
xlim([-1 1]);

figure();
histogram(r2low);
hold on;
histogram(r2up);
title({'Lower and upper limits for r given ρ=0.5',['The ρ=0.5 is within boundaries for ',num2str(100*r2in/m),'% of the cases']});
xlabel('Estimator r values');
legend('Lower','Upper');
xlim([-1 1]);

%Part B

t1 = abs(corr1.*sqrt((n-2)./(1-corr1.^2)));%Calculating the student values
t2 = abs(corr2.*sqrt((n-2)./(1-corr2.^2)));
p1 = 2.*(1-tcdf(t1,n-2));%calculating the pvalues
p2 = 2.*(1-tcdf(t2,n-2));

val1 = sum(p1<0.05);
val2 = sum(p2<0.05);

figure();
histogram(p1);
title({'Pvalues for the Null hypothesis that X and Y are independent when ρ=0',['The Null hypothesis is rejected ',num2str(100*val1/m),'% of the time']});
xlabel('P values');

figure();
histogram(p2);
title({'Pvalues for the Null hypothesis that X and Y are independent when ρ=0.5',['The Null hypothesis is rejected ',num2str(100*val2/m),'% of the time']});
xlabel('P values');
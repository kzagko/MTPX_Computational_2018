%Part A
%Default values
clear all;
m = 1000;
n = 20;
mux = 0;
muy = 0;
sx = 1;
sy = 1;
r1 = 0;
r2 = 0.5;
cov1 = [sx^2 r1*sx*sy; r1*sx*sy sy^2];%Covariance matrices
cov2 = [sx^2 r2*sx*sy; r2*sx*sy sy^2];
v1 = zeros(n,2);
v2 = zeros(n,2);
corr1 = zeros(n,1);
corr2 = zeros(n,1);
testM = zeros(2,2);

v1(:,:)=mvnrnd([mux,muy],cov1,n);
v2(:,:)=mvnrnd([mux,muy],cov2,n);
testM = corrcoef(v1(:,1),v1(:,2));
corr1 = testM(1,2);%r is the (1,2) elements of the matrix
testM = corrcoef(v2(:,1),v2(:,2));
corr2 = testM(1,2);


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
%clf();

%Part B

t10 = abs(corr1.*sqrt((n-2)./(1-corr1.^2)));%Calculating the student values
t20 = abs(corr2.*sqrt((n-2)./(1-corr2.^2)));
p10 = 2.*(1-tcdf(t10,n-2));%calculating the pvalues
p20 = 2.*(1-tcdf(t20,n-2));

xs = 1:n;
for o=1:m
   
    ind = randperm(n);
    v1L = v1(ind,2);
    v2L = v2(ind,2);
    testM = corrcoef(v1(:,1),v1L(:,1));
    corr1L(o) = testM(1,2);%r is the (1,2) elements of the matrix
    testM = corrcoef(v2(:,1),v2L(:,1));
    corr2L(o) = testM(1,2);
    
    t1L(o) = abs(corr1L(o).*sqrt((n-2)./(1-corr1L(o).^2)));%Calculating the student values
    t2L(o) = abs(corr2L(o).*sqrt((n-2)./(1-corr2L(o).^2)));
    p1L(o) = 2.*(1-tcdf(t1L(o),n-2));%calculating the pvalues
    p2L(o) = 2.*(1-tcdf(t2L(o),n-2));
    
end

t1sort = sort(t1L);
t2sort = sort(t2L);

fprintf(['t10 should be between indices ',num2str(round(0.025*m)),' and ',num2str(round((1-0.025)*m)), ' and is ',num2str(round(sum(t1sort<t10))),'\n']);
fprintf(['t20 should be between indices ',num2str(round(0.025*m)),' and ',num2str(round((1-0.025)*m)), ' and is ',num2str(round(sum(t2sort<t10))),'\n']);
% figure();
% histogram(p1);
% title({'Pvalues for the Null hypothesis that X and Y are independent when ρ=0',['The Null hypothesis is rejected ',num2str(100*val1/m),'% of the time']});
% xlabel('P values');
% 
% figure();
% histogram(p2);
% title({'Pvalues for the Null hypothesis that X and Y are independent when ρ=0.5',['The Null hypothesis is rejected ',num2str(100*val2/m),'% of the time']});
% xlabel('P values');
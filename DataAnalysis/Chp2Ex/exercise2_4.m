% Exercise 4 of Chp.2
% Generation of uniform data and computation of the 1/E[x] and E[1/x].
pridir = 'C:\MyFiles\Teach\DataAnalysis\Figures\';
pritxt = 'example2_4';
a = 1; 
b = 2; % The edges of the interval for the uniform distribution 
nV = 2.^[2:17]';

m = (a+b)/2;
nn = length(nV);
mxM = NaN*ones(nn,2);
for in=1:nn
    n = nV(in);
    fprintf('%d.',n);
    xV = a + (b-a).*rand(n,1);
    mxM(in,1) = mean(1./xV);
    mxM(in,2) = 1/mean(xV);
end
fprintf('\n');
figure(1)
clf
plot(log2(nV),mxM(:,1),'.-k')
hold on
plot(log2(nV),mxM(:,2),'.-r')
plot([log(nV(1)) log(nV(nn))],(1/m)*[1 1],'--c')
legend('E[1/x]','1/E[x]')
xlabel('sample size 2^n')
ylabel('mean')
title('Check whether E[1/x]=1/E[x]')
eval(['print -depsc ',pridir,pritxt,'.eps'])

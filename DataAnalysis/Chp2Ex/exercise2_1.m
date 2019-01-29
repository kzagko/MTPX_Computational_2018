% Exercise 1 of Chp.2
% Generation of discrete uniform data and computation of the propability of
% occurence of a discrete value.
pridir = 'C:\MyFiles\Teach\DataAnalysis\Figures\';
pritxt = 'exercise2_1';
m = 2; % number of discrete values for the random variable
nV = 2.^[2:17]';

nn = length(nV);
propM = NaN*ones(nn,2);
for in=1:nn
    n = nV(in);
    fprintf('%d.',n);
    xV = unidrnd(m,n,1);
    yV = rand(n,1);
    propM(in,1) = length(find(xV==1))/n;
    propM(in,2) = length(find(yV<0.5))/n;
end
fprintf('\n');
figure(1)
clf
plot(log2(nV),propM(:,1),'.-k')
hold on
plot(log2(nV),propM(:,2),'.-c')
plot([log(nV(1)) log(nV(nn))],(1/m)*[1 1],'--y')
legend('unidrnd','rand')
xlabel('sample size')
ylabel('relative frequency')
title('Probability of a binary outcome')
eval(['print -depsc ',pridir,pritxt,'.eps'])

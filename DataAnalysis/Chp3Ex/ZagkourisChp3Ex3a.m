[mean,all] =Zagkourisexpmean(15,1000,5)
[h,p,ci,stats]=ttest(all',mean)
sz = size(all);
count = 0;
for i=1:sz(1)
    if mean>= ci(
inside = sum(all>=ci(1)&all<=ci(2));
percentage = 100.0*inside/sz(1);

disp(['The percentage of mean values inside the 95% confidence interval is ',num2str(percentage),' %'])
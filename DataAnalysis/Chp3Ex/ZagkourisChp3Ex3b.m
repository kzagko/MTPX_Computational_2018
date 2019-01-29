[mean,all] =Zagkourisexpmean(15,1000,100)
[h,p,ci,stats]=ttest(all,mean)
sz = size(all);
inside = sum(all>=ci(1)&all<=ci(2));
percentage = 100.0*inside/sz(1);

disp(['The percentage of mean values inside the 95% confidence interval is ',num2str(percentage),' %'])
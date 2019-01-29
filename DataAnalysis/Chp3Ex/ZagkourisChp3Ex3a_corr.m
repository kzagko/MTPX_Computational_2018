[mean,all] =Zagkourisexpmean(15,1000,5)
[h,p,ci,stats]=ttest(all',mean)
sz = size(all);
count = 0;
for i=1:sz(1)
    if mean>= ci(1,i) & mean <= ci(2,i)
        count = count + 1;
    end
end
percentage = 100.0*count/sz(1);

disp(['The percentage of mean values inside the 95% confidence interval is ',num2str(percentage),' %'])
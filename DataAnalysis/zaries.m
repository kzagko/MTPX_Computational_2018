data1 = dlmread('zaries', ' ', 2, 0);
data2 = dlmread('zaries2', ' ', 2, 0);
data1 = data1(:,1:4);
x=linspace(2,12,100);


K_all_single = [data1(:,1);data1(:,2);data2(:,1);data2(:,2)];
G_all_single = [data1(:,3);data1(:,4);data2(:,3);data2(:,4)];

K_all_doublesum = [data1(:,1)+data1(:,2);data2(:,1)+data2(:,2)];
G_all_doublesum = [data1(:,3)+data1(:,4);data2(:,3)+data2(:,4)];

figure();
subplot(2,2,1);
histogram(K_all_single);
hold on;
histogram(G_all_single);
legend('Kimon','Giannis');
title('Distribution of dice rolls as singles');
ylabel('Actual frequency');


subplot(2,2,2);
histogram(K_all_doublesum);
hold on;
histogram(G_all_doublesum);
legend('Kimon','Giannis');
title('Distribution of sum of each throw');
ylabel('Actual frequency');
yexpected = pdf('Normal',x,7,2.4152);
plot(x,yexpected*length(K_all_doublesum),'R-','LineWidth',2);

[hk,pk,CIk,statsk]=ttest(K_all_doublesum,7);
[hg,pg,CIg,statsg]=ttest(G_all_doublesum,7);

K_n_ofdoubles = sum([data1(:,1)==data1(:,2);data2(:,1)==data2(:,2)]);
G_n_ofdoubles = sum([data1(:,3)==data1(:,4);data2(:,3)==data2(:,4)]);


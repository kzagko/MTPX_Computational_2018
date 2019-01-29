n = 1000;
h0V = 100;
muV0 = 58;
sigmaV0 = 2;
h2 = normrnd(muV0,sigmaV0,5,n);
meanh2V = mean(h2(:,:));
stdh2V = std(h2(:,:));
eV = sqrt(h2(:,:)/h0V);
e_meanV = mean(eV);
stdeV = std(eV);


mean2eV = sqrt(meanh2V./h0V);
std2eV = sqrt((1/4).*(1./(meanh2V.*h0V)).*(stdh2V.^2));


figure();
histfit(e_meanV,10);
title('The randomly calculated mean value of e');
figure();
histfit(mean2eV,10);
title('The estimated value of e')


figure();
histfit(stdeV,10);
title('The randomly calculated std');
figure();
histfit(std2eV,10);
title('The estimated std');



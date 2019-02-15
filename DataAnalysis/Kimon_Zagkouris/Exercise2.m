clc;
clear all;

[data,txt,raw] = xlsread('EnergyUS.xlsx');%load all data
NYSE = data(:,2); %load NYSE data
M = data(:,3:end);%all stocks
VarNames = {txt{3:end}};%get the names of the stocks
alpha = 0.05; %significance level



[AdjR2tot AdjR2step bstep]=MyRegress(NYSE,M,alpha,0,VarNames);

fprintf('The stepwise fit coefficients are \n');
fprintf('%5.2f\n',bstep);
fprintf('\n and the full and stepwisefit model AdjR2 are\n');
fprintf('AdjR2Full: %8.6f\n',AdjR2tot);
fprintf('AdjR2Step: %8.6f\n',AdjR2step);


%part c
nlof = 25;
rem = mod(length(NYSE),nlof);
ilast = floor(length(NYSE)/nlof);
AdjR2toti = zeros(ilast+1,1); 
AdjR2stepi = zeros(ilast+1,1);
bstepi = zeros(ilast+1,11);

for j=1:ilast
    NyseM = NYSE(((j-1)*nlof+1):j*nlof);
    MyM = M(((j-1)*nlof+1):j*nlof,:);
    [AdjR2toti(j) AdjR2stepi(j) bstepi(j,:)]=MyRegress(NyseM,MyM,alpha,0,VarNames);

end
%laste itteration left out
NyseM = NYSE(451:end);
MyM = M(451:end,:);
[AdjR2toti(end) AdjR2stepi(end) bstepi(end,:)]=MyRegress(NyseM,MyM,alpha,0,VarNames);

figure();
plot(AdjR2toti,'o');
hold on;
plot(AdjR2stepi,'*')
title('AdjR2 for full and step model');
legend('Full model','Step model');

%% mean model

bavg = mean(bstepi);

fprintf('\nThe average fit coefficients are \n');
fprintf('%5.2f\n',bavg);




    
    
    





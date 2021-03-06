function [AdjR20 bfinal] = mystepwiseAct(CM,y)
%function to calculate the best stepwise model based on adjR. CM is a
%matrix with the independent variables


%%There are many ways to do a stepwise fit here we will attemtp one of the
%%simplest. We first fit y with each variable one at a time and sort the
%%variables by their AdjR. Then we try to fit following that order and
%%check if the AdjR gets better or not. This stops when the AdjR falls in
%%value.

n = length(y);
VarSize = length(CM(1,:));% the amount of variables
R1 = zeros(VarSize, 1);
for i =1:VarSize
    X = [ones(size(y)) CM(:,i)];%load variable one at a time
    [b,bint,r,rint,stats] = regress(y,X);
    R1(i) = stats(1);
    
end

[R1s Ind] = sort(R1,'descend');

k = 1;
AdjR20 = 1-((n-1)/(n-(k+1)))*(1-R1s(1)); %get the AdjR2 of the best single variable fit
X = [ones(size(y)) CM(:,Ind(1))];%load the best fitting variable
InitVar = 1:VarSize;%array with all the variable indices
SelVar = Ind(1);%Array with the selected variable indices
InitVar(Ind(1)) = []; %remove the variable that was accepted in the fit
remcount = length(InitVar);%remaining variables to test
while 1
    
    AdjR2a = zeros(remcount,1);
    b1 = zeros(1+k+1,remcount);
    for j=1:remcount
        Xa = [X CM(:,InitVar(j))]; %append the next best variable
        [b1(:,j),bint,r,rint,stats] = regress(y,Xa);
        R2i = stats(1);
        AdjR2a(j) = 1-((n-1)/(n-(k+1+1)))*(1-R2i);%there is an extra +1 here 
        %beacause k is not refreshed yet to the new value
    end
    [AdjR2aS IndS] = sort(AdjR2a,'descend');
        
    if AdjR2aS(1) < AdjR20
        break;
    
    else
        AdjR20 = AdjR2aS(1);
        b = b1(:,IndS(1));
        SelVar = [SelVar InitVar(IndS(1))];
        InitVar(IndS(1)) = [];
        k = length(SelVar);
        X = [X CM(:,SelVar(end))];
        remcount = length(InitVar);%remaining variables to test
    end
    if remcount ==0
        break;
    end
end

bfinal = zeros(VarSize+1,1);
bfinal(1) = b(1);
bfinal(SelVar+1) = b(2:end); 


end
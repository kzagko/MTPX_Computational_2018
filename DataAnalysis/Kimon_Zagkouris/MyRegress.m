function [AdjR2tot AdjR2step bstep] = MyRegress(Y,X,alpha,check,VarNames)
%Y dependent variable
%X independent variables matrix
%alpha level of significance
%check set to 1 to plot or 0 to not 
%VarNames the names of the variables in X

ysize = length(Y);

Varsize = length(X(1,:));%get the variables size





%%Calculate the full model
NM = [ones(ysize,1) X];
[btot,bint,r,rint,stats] = regress(Y,NM);
R1 = stats(1);
k = length(NM(1,:));
AdjR2tot = 1-((ysize-1)/(ysize-(k+1)))*(1-R1);

yrestot = Y-(btot(1)+X*btot(2:end));%total fit residuals
yrestotnorm = yrestot-mean(yrestot);
yrestotnorm = yrestotnorm/std(yrestotnorm);

%%stepwisefit

[b,se,pval,inmodel,stats,nextstep,history]= stepwisefit(X,Y);
bstep = b.*inmodel';
intercept = stats.intercept;
bstep = [intercept bstep']';
R2step = 1-stats.SSresid/stats.SStotal;
k= sum(inmodel);
AdjR2step = 1-((ysize-1)/(ysize-k-1))*stats.SSresid/stats.SStotal;

yrestep = Y-(bstep(1)+X*bstep(2:end));%total fit residuals
yrestepnorm = yrestep-mean(yrestep);
yrestepnorm = yrestepnorm/std(yrestepnorm);



if check==1
    for i=1:Varsize
       figure(); 
       scatter(Y,X(:,i));
       str1 = strcat('Scatter Plot ');
       title(str1);
       xlabel('NYSE');
       ylabel(VarNames{i});
    
    end
    
    figure();
    plot(yrestotnorm,'o');
    hold on;
    plot(yrestepnorm,'*');
    plot([1 length(yrestotnorm)],[-1.96 -1.96],'r-');
    plot([1 length(yrestotnorm)],[1.96 1.96],'r-');
    title('Normalised Errors');
    legend('TotalFit','StepFit','Boundaries','Location','best');
    
end







end
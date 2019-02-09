function StepfitActivities(CM,Activity,Countlist,mark)

    y = CM(:,mark);
    %remove specific country for datasets
    Countlist(mark)=[];
    CM(:,mark) = [];
    Nsize = length(y);
    %%Calculate the stepwisefit
    [b,se,pval,inmodel,stats,nextstep,history]= stepwisefit(CM,y);
    bstep = b.*inmodel';
    intercept = stats.intercept;
    bstep = [intercept bstep']';
    R2step = 1-stats.SSresid/stats.SStotal;
    k= sum(inmodel);
    AdjR2step = 1-((Nsize-1)/(Nsize-k-1))*stats.SSresid/stats.SStotal;

    %%Calculate my stepwise method
    [AdjR2me bme] = mystepwiseAct(CM,y);
    
    %%Calculate the full model
    NM = [ones(size(y)) CM];
    [btot,bint,r,rint,stats] = regress(y,NM);
    R1 = stats(1);
    k = length(CM(1,:));
    AdjR2tot = 1-((Nsize-1)/(Nsize-(k+1)))*(1-R1);

    
    %%return results
    
    fprintf('\nMultivariable fitting in Greece for activity\n \t \t %s\n',Activity);
    %fprintf('Activities\t Coefficients');
    Varlist = ['AdjR2' 'Intercept' {Countlist{:}}];
    V1 = [AdjR2step bstep']';
    V2 = [AdjR2me bme']';
    V3 = [AdjR2tot btot']';
    T=table(V1,V2,V3,'RowNames' ,Varlist','VariableNames',{'Stepwisefit','MyStepwise','Full'})
    
    figure();
    plot(y,y,'o','MarkerSize',10);
    hold on;
    plot(y,bstep(1)+CM*bstep(2:end),'x');
    plot(y,bme(1)+CM*bme(2:end),'*');
    plot(y,btot(1)+CM*btot(2:end),'d');
    titl1 = strcat({'Multivar fits in Greece for '}, Activity);
    title(titl1);
    xlabel('Greece''s PM10');
    ylabel('Greece''s xpected Total PM10');
    legend('Actual Data', 'Stepwisefit', 'My Stepwise fit', 'Full fit','Location', 'best');
    figname = strcat(Activity,'_Greece_MultivarFits');
    saveas(gcf,figname,'epsc');
    
end
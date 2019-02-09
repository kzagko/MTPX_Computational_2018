function StepfitCountries(CM,Country,Actlist)

    y = CM(:,1);
    Nsize = length(y);
    %%Calculate the stepwisefit
    [b,se,pval,inmodel,stats,nextstep,history]= stepwisefit(CM(:,2:end),y);
    bstep = b.*inmodel';
    intercept = stats.intercept;
    bstep = [intercept bstep']';
    R2step = 1-stats.SSresid/stats.SStotal;
    k= sum(inmodel);
    AdjR2step = 1-((Nsize-1)/(Nsize-k-1))*stats.SSresid/stats.SStotal;

    %%Calculate my stepwise method
    [AdjR2me bme] = mystepwise(CM);
    
    %%Calculate the full model
    NM = [ones(size(y)) CM(:,2:end)];
    [btot,bint,r,rint,stats] = regress(y,NM);
    R1 = stats(1);
    k = length(CM(1,2:end));
    AdjR2tot = 1-((Nsize-1)/(Nsize-(k+1)))*(1-R1);

    
    %%return results
    
    fprintf('\nMultivariable fitting for Activities in Country\n \t \t %s\n',Country);
    %fprintf('Activities\t Coefficients');
    Varlist = ['AdjR2' 'Intercept' {Actlist{:}}];
    V1 = [AdjR2step bstep']';
    V2 = [AdjR2me bme']';
    V3 = [AdjR2tot btot']';
    T=table(V1,V2,V3,'RowNames' ,Varlist','VariableNames',{'Stepwisefit','MyStepwise','Full'})
    
    figure();
    plot(y,y,'o','MarkerSize',10);
    hold on;
    plot(y,bstep(1)+CM(:,2:end)*bstep(2:end),'x');
    plot(y,bme(1)+CM(:,2:end)*bme(2:end),'*');
    plot(y,btot(1)+CM(:,2:end)*btot(2:end),'d');
    titl1 = strcat({'Multivar fits for '}, Country);
    title(titl1);
    xlabel('Total PM10');
    ylabel('Expected Total PM10');
    legend('Actual Data', 'Stepwisefit', 'My Stepwise fit', 'Full fit','Location', 'best');
    figname = strcat(Country,'_MultivarFits');
    saveas(gcf,figname,'epsc');
    
end
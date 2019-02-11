function Chartme(StrA,StrB,StrC,D1,D2,years,OpChk,nbins1)
    
    %Default bin number follows Sturge's Law
    
    if nargin<8
        nbins1 = round(1+3.322*log10(length(D1)));
    end
    %Plot initial data
    subplot(1,2,1);
    histogram(D1,nbins1,'DisplayStyle','stairs')
    hold on;
    histogram(D2,nbins1,'DisplayStyle','stairs')
    if OpChk == 2 %Two countries same activity
        leg1 = strcat(StrA,"-",StrC);
        leg2 = strcat(StrB,"-",StrC);
        legend(leg1,leg2,'Location','Best')
    else%Same country different activities
        leg1 = strcat(StrA,"-",StrB);
        leg2 = strcat(StrA,"-",StrC);
        legend(leg1,leg2,'Location','Best')
    end
    title('EmissionP10 - Initial Data');
    
    %find and remove mean value and normalize sigma 
    D1 = D1-mean(D1);
    D2 = D2-mean(D2);
    D1 = D1./std(D1);
    D2 = D2./std(D2);
    subplot(1,2,2);
    histogram(D1,nbins1,'DisplayStyle','stairs')
    hold on;
    histogram(D2,nbins1,'DisplayStyle','stairs')
    legend(leg1,leg2,'Location','Best')
    title('EmissionP10 - Mean=0 and Sigma=1');
    set(findall(gcf,'-property','FontSize'),'FontSize',14);

end
function [Rmax combmax count1 count2] = AllCountries(AM,alpha)
    nCount = length(AM(1,:));
    comb = combnk(1:nCount,2);%get all possible combinations of countries
    ncomb = length(comb(:,1));
    RPP = zeros(ncomb,3);
    
    for i=1:ncomb
        [RPP(i,1),RPP(i,2),RPP(i,3)] = corrme(AM(:,comb(i,1)),AM(:,comb(i,2)),alpha);
    end

    
    figure();
    h = histogram(RPP(:,1),-1:0.25:1);
    title('Correlations among all sets of countries');
    ylabel('Counts');
    xlabel('Corellation factor');
    set(findall(gcf,'-property','FontSize'),'FontSize',14);
    %sort the R values and pick the 10 highest
    RPP(:,1)=abs(RPP(:,1));
    RPP(isnan(RPP(:,1)),1)=-inf;
    [Rsorted I] = sort(RPP(:,1),'descend');
    RPP(isinf(RPP(:,1)),1)=NaN;
    Rmax = Rsorted(1:10);
    Imax = I(1:10);
    combmax = comb(Imax,:);
    count1 = sum(RPP(:,2)>=alpha)/ncomb;
    count2 = sum(RPP(:,3)>=alpha)/ncomb;
end
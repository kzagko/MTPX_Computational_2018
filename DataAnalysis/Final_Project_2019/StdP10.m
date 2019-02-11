function StdP10(AM,BM,alpha)
    nCount = length(AM(1,:));%get the number of countries
    pCIs = zeros(nCount,2);
    npCIs = zeros(nCount,2);
    mpCIs = zeros(nCount,1);
    mnpCIs = zeros(nCount,1);
    
    for i=1:nCount
       [pCIs(i,:), npCIs(i,:)] = stdCIs(AM(:,i),BM(:,i),alpha);       
    end
 
    mpCIs = mean(pCIs,2);
    mnpCIs = mean(npCIs,2);
    figure();
    errorbar(1:nCount,mpCIs,pCIs(:,1),pCIs(:,2),'o');
    hold on;
    errorbar(1:nCount,mnpCIs,npCIs(:,1),npCIs(:,2),'*');
    title('Std and CIs of avtivity');
    ylabel('Relative Std PM10 value');
    xlabel('Country code');
    legend('Parametric','Non Parametric');
    set(findall(gcf,'-property','FontSize'),'FontSize',14);
end
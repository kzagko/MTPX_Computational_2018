function [R2 O1] = AdjRCountries(AM,BM,n)
    nCount = length(AM(1,:));
    
    R2 = zeros(nCount,1);
    O1 = zeros(nCount,1);
    for i =1:nCount
        
        [R2(i) O1(i)] = polyme(AM(:,i),BM(:,i),n);
        
    end


end
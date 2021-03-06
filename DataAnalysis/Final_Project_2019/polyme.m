function [AdjR nm] = polyme(A,B,n)
%A and B are arrays of the same activity and n is the maximum polynomial
%order to fit for. This function find the best polynomial order fit
%depending on the AdjR. A are the totals and B the independent values.
    npoints = length(A);
    adjr2 = zeros(n+1,1);
    if sum(isnan(B))==npoints
        AdjR = NaN;
        nm = 0;
        fprintf('Nan Array found');
    else
        
        for i=1:(n+1)
            [p S mu] = polyfit(B,A,i-1);
            r2 = 1 - sum((A-polyval(p,B,S,mu)).^2)/sum((A-mean(A)).^2);
            adjr2(i) = 1-((npoints-1)/(npoints-i))*(1-r2);
        end
        adjr2 = abs(adjr2);
        adjr2(isnan(adjr2)) = -Inf;
        [AdjR nm] = sort(adjr2,'descend');
        adjr2(isinf(adjr2)) = NaN;
        AdjR = AdjR(1);
        nm = nm(1)-1; %to get the actual order of the polynomial.
    end   
    
    if AdjR >1
        AdjR=NaN;
    end

end
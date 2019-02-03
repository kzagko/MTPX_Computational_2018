function [r1,p1,p2] = corrme(A,B,alpha)
    nsize = length(A);


    %parametric correlation
    [r1,p1] = corrcoef(A,B,'alpha',alpha);
    r1 = r1(1,2);
    p1 = p1(1,2);
    ta0 = abs(r1*sqrt((nsize-2)/(1-r1^2)));

    %non parametric correlation
    m = 1000;
    ta = zeros(m,1);
    ra = zeros(m,1);
    for i=1:m
        indx = randperm(nsize);
        r0 = corrcoef(A,B(indx),'alpha',alpha);
        ra(i) = r0(1,2);
        ta(i) = abs(ra(i)*sqrt((nsize-2)/(1-ra(i)^2)));
    end
    ta = sort(ta);
    %fprintf(['t10 should be between indices ',num2str(round(m*alpha/2)), ...
    %    ' and ',num2str(round((1-alpha/2)*m)), ' and is ',num2str(round(sum(ta<ta0))),'\n']);
    maxind = round(sum(ta<ta0));
    p2 = (1-maxind/(1.0*m));
    
    
end
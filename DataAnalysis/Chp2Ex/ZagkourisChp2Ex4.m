
x = [];
pow10 = 7;
Ey = [];
Ez = [];

%set alpha to 
%
%   1 for unirand in [1,2]
%   2 for unirand in [0,1]
%   3 for unirand in [-1,1]

alpha = 3;

if alpha == 1
    
    % Unirand in [1,2]

    for i = 1:pow10
        x(i) = 10^i;
        y = rand(1,x(i))+1;
        z = 1./(rand(1,x(i))+1);
        Ey(i) = 1.0/mean(y);
        Ez(i) = mean(z);
    end

    plot(x,Ey,x,Ez)
elseif alpha == 2
    % Unirand in [0,1]

    for i = 1:pow10
        x(i) = 10^i;
        y = rand(1,x(i));
        z = 1./(rand(1,x(i)));
        Ey(i) = 1.0/mean(y);
        Ez(i) = mean(z);
    end
    plot(x,Ey,x,Ez)
    
else
    % Unirand in [-1,1]

    for i = 1:pow10
        x(i) = 10^i;
        y = (2.*rand(1,x(i)))-1;
        z = 1./(2.*rand(1,x(i))-1);
        Ey(i) = 1.0/mean(y);
        Ez(i) = mean(z);
    end
    plot(x,Ey,x,Ez)
end
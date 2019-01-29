clc;
clear all;


%set initial seed and size

x0 = 0.1;
n=100;

Xv = logist(x0,n);


%%History Diagram
%subplot(4,1,1);
figure();
plot(Xv,'o-');
xlabel('Index');
ylabel('Value');
title('History Diagram');


%%Autocorrelation with all possible lags

%subplot(4,1,2);
figure();
autocorr(Xv,n-1);
[ACF,lags,bounds] = autocorr(Xv,n-1);
%plot(ACF)
xlabel('Lag in indices');
ylabel('Correlation');
title('Autocorellation Diagram');


function [Xv] = logist(x0,n)
    Xv=zeros(n,1);
    Xv(1) = x0;
    for i=2:n
        Xv(i) = 4*Xv(i-1)*(1-Xv(i-1));
    end


end
clc;
clear all;

D = dlmread('sunspots.dat');

%Test Data 
% tl=308;
% pl=28;
% xf = (1001:1000+tl)';
% yf = sin(xf.*(2*pi/pl));
% yf = yf + 1*randn(tl,1);
% D = [xf yf];

Nsize = length(D);

%%History Diagram
%subplot(4,1,1);
figure();
plot(D(:,1),D(:,2),'o-');
xlabel('Year');
ylabel('Sunspots');
title('History Diagram');


%%Autocorrelation with all possible lags

%subplot(4,1,2);
figure();
autocorr(D(:,2),Nsize-1);
[ACF,lags,bounds] = autocorr(D(:,2),Nsize-1);
%plot(ACF)
xlabel('Lag in years');
ylabel('Correlation');
title('Autocorellation Diagram');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Part B
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%Find Main frequency with fft

Dfft = fft(D(:,2));
Dfft = Dfft(1:Nsize/2+1);
PSfft = (1/Nsize)*abs(Dfft).^2;
PSfft(2:end-1) = 2*PSfft(2:end-1);
freq = 0:1/Nsize:1/2;
figure();
ax1 = axes();
title('FFT Power Spectrum');
subplot(2,1,1);
plot(freq,PSfft);
subplot(2,1,2);
plot(freq,10*log10(PSfft));
xlabel('Frequency (1/Yr)');
ylabel('Power Frequency (dB/(1/Yr))');
[v,Highpowindx] = max(10*log10(PSfft(2:end)));
Highpowindx = Highpowindx +1;
F0 = freq(Highpowindx);
T0 = 1/F0;
strA = ['Max at ', num2str(T0), ' Years'];
text(F0,1.ε ο νικος*10*log10(PSfft(Highpowindx)),strA);
%ax2 = axes('Position', get(ax1, 'Position'),'XAxisLocation',...
%    'top','YAxisLocation', 'right', 'Color', 'none','YTick', [], 'XDir', 'reverse');
%line(freq*2*Nsize,flipud(10*log10(PSfft)), 'Color', 'r','Parent', ax2);
%linkprop([ax1, ax2], {'ylim', 'Position'});
%plot(freq,PSfft);

%% Remove periodic trend

% Sum every T0 years
T0 = round(T0);
Drs = reshape(D(:,2),T0,[]);
Davg = repmat(mean(Drs')',Nsize/T0,1);
figure();
subplot(3,2,1)
plot(D(:,1),D(:,2));
xlabel('Year');
ylabel('Sunspots');
title('History Diagram');

subplot(3,2,2)
plot(D(:,1),Davg);
xlabel('Year');
ylabel('Sunspots');
title('Average History Diagram');

subplot(3,2,3)
Ddiff = D(:,2)-Davg;
plot(D(:,1),Ddiff);
xlabel('Year');
ylabel(' Difference in Sunspots');
title('Difference History Diagram');

% Test with moving average
subplot(3,2,4)
Dmvavgdiff = D(:,2)-movmean(D(:,2),T0); 
plot(D(:,1),Dmvavgdiff);
xlabel('Year');
ylabel('Moving Average Difference in Sunspots');
title('Difference MovAvg History Diagram');


% Autocorr of Ddiff
subplot(3,2,5)
autocorr(Ddiff,Nsize-1);
[ACF2,lags2,bounds2] = autocorr(Ddiff,Nsize-1);

xlabel('Lag in years');
ylabel('Autocorrelation');
title('Autocorrelation in Average Differences');


% Autocorr of monav
subplot(3,2,6)
autocorr(Dmvavgdiff,Nsize-1);
[ACF3,lags3,bounds3] = autocorr(Dmvavgdiff,Nsize-1);

xlabel('Lag in years');
ylabel('Autocorrelation');
title('Autocorrelation in Moving Average Differences');




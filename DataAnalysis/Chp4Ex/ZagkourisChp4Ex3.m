% Part A


% The error in the power can be given by the function powerV at the end 
% of the script assuming that the covariances are zero


% Part B
fprintf('\n Part B \n');
V0 = 77.78;
sV0 = 0.71;
I0 = 1.21;
sI0 = 0.071;
phi0 = 0.283;
sphi0 = 0.017;
covM = [sV0^2 0 0;0 sI0^2 0;0 0 sphi0^2];
N=1000;

[powV,errP] = powerV(V0,I0,phi0,covM);

Vs = normrnd(V0,sV0,1,N);
Is = normrnd(I0,sI0,1,N);
Phis = normrnd(phi0,sphi0,1,N);
Pows = Vs.*Is.*cos(Phis);
sPows = std(Pows);
mPows = mean(Pows);

fprintf('The calculated power is %.2f W with an uncertainty of %.2f W\n',powV,errP);
fprintf('The estimated power is %.2f W with an uncertainty of %.2f W\n',mPows,sPows);


% Part C
fprintf('\n Part C \n');
rVphi = 0.5;
covM = [sV0^2 0 rVphi*sV0*sphi0;0 sI0^2 0;rVphi*sV0*sphi0 0 sphi0^2];

[powV,errP] = powerV(V0,I0,phi0,covM);


rVs = mvnrnd([V0,I0,phi0],covM,N);

Pows = rVs(:,1).*rVs(:,2).*cos(rVs(:,3));
sPows = std(Pows);
mPows = mean(Pows);

fprintf('The calculated power is %.2f W with an uncertainty of %.2f W\n',powV,errP);
fprintf('The estimated power is %.2f W with an uncertainty of %.2f W\n',mPows,sPows);
figure();
histfit(Pows);



function [powV,err_powV] = powerV(v1,i1,phi1,covM)

%Function that returns the value and propagated error of the power given by
%the function P=VIcos(phi). where v1, i1 and phi1 are the respective inputs
%and the covM is the 3x3 covariance matrix of these three variables.

    powV = v1.*i1.*cos(phi1);
    var = ((i1.*cos(phi1)).^2).*covM(1,1)+((v1.*cos(phi1)).^2).*covM(2,2) ...
        -((i1.*v1.*sin(phi1)).^2).*covM(3,3)+2.*(i1.*cos(phi1).*v1.*cos(phi1)).*covM(1,2) ...
        +2.*(i1.*cos(phi1).*(-v1.*i1.*sin(phi1))).*covM(1,3) ...
        +2.*(v1.*cos(phi1).*(-v1.*i1.*sin(phi1))).*covM(2,3);
    err_powV = sqrt(var);
end
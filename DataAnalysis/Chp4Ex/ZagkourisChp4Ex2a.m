sigma = 5;
mikos = 500;
platos = 300;
N =50;

[surf1,sigmasurf1] = surfsigma(mikos,sigma,platos,sigma);
fprintf('The surface area is %.2f m2 and its uncertainty is %.2f m2 \n',surf1,sigmasurf1);

[x,y] = meshgrid(logspace(log(1),log(mikos),N),logspace(log(1),log(platos),N));
[z, sigmaS] = surfsigma(x,sigma,y,sigma);



surf(x,y,100.*sigmaS./z);
ylim([1,platos]);
xlim([1,mikos]);
zlim([0,100]);
title('Percentage of relative uncertainty in surface area');
xlabel('Mikos (m)');
ylabel('Platos (m)');




function [surf,sigma] = surfsigma(m,sm,p,sp)

    surf = m.*p;
    sigma = sqrt(p.^2.*sm.^2+m.^2.*sp.^2);
end
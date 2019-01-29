% Exercise 5.4
datdir = 'c:\MyFiles\Teach\DataAnalysis\Data\';
dattxt = 'lightair';
alpha = 0.05;
x0 = 1.29;
c = 299792.458;
a = 0.00029;
d0 = 1.29;

beta0 = c-299000;
beta1 = -a*c/d0;

xyM = load([datdir,dattxt,'.dat'])
xV = xyM(:,1);
yV = xyM(:,2);
n = length(xV);

xysM = sortrows(xyM);
xV = xysM(:,1);
yV = xysM(:,2);

mx = mean(xV);
sx2 = sum(xV.^2);
varx = (sx2 - n* mx^2)/(n-1);
sdx = std(xV);
my = mean(yV);
sy2 = sum(yV.^2);
vary = (sy2 - n* my^2)/(n-1);
sdy = std(yV);
sxy = sum(xV.*yV);
covxy = (sxy - n*mx*my)/(n-1);
tmpM = corrcoef(xV,yV);
cc = tmpM(1,2);
xM = [ones(n,1) xV];
[bV, bint,r,rint,stats] = regress(yV,xM);
se2 = ((n-1)/(n-2))*(vary-bV(2)^2*varx);
se = sqrt(se2);

tcrit = tinv(1-alpha/2,n-2);
Sxx  = varx*(n-1);
b1sd = se / sqrt(Sxx);
b1ciV = [bV(2)-tcrit*b1sd  bV(2)+tcrit*b1sd]; 
b0sd = se *sqrt(1/n + mx^2/Sxx);
b0ciV = [bV(1)-tcrit*b0sd  bV(1)+tcrit*b0sd]; 

tb1 = (bV(2) - beta1) / b1sd;
pb1 = 2*(1-tcdf(abs(tb1),n-2));
tb0 = (bV(1) - beta0) / b0sd;
pb0 = 2*(1-tcdf(abs(tb0),n-2));

y0 = bV(1) + bV(2) * x0;
mysd = se *sqrt(1/n + (x0-mx)^2/Sxx);
myciV = [y0-tcrit*mysd  y0+tcrit*mysd]; 
y0sd = se *sqrt(1+1/n + (x0-mx)^2/Sxx);
y0ciV = [y0-tcrit*y0sd  y0+tcrit*y0sd]; 

x0V = linspace(min(xV),max(xV),100)';
y0V = bV(1) + bV(2) * x0V;
mysdV = se *sqrt(1/n + (x0V-mx).^2/Sxx);
myciM = [y0V-tcrit*mysdV  y0V+tcrit*mysdV]; 
y0sdV = se *sqrt(1+1/n + (x0V-mx).^2/Sxx);
y0ciM = [y0V-tcrit*y0sdV  y0V+tcrit*y0sdV]; 

figure(1)
clf
paperfigure
plot(xV,yV,'k.','Markersize',10)
xlabel('air density')
ylabel('light speed')
title(sprintf('LightSpeed vs AirDensity r=%1.3f',cc))

figure(2)
clf
paperfigure
plot(xV,yV,'k.','Markersize',10)
hold on
plot([xV(1) xV(n)],bV(1)+bV(2)*[xV(1) xV(n)],'k','linewidth',1.5)
ax = axis;
xlabel('air density')
ylabel('light speed')
title(sprintf('LightSpeed vs AirDensity r=%1.3f',cc))
if bV(2)<0
    modtxt = sprintf('y = %2.2f - %2.3f x',bV(1),abs(bV(2))); 
else
    modtxt = sprintf('y = %2.2f + %2.3f x',bV(1),abs(bV(2))); 
end
text(ax(1)+0.05*(ax(2)-ax(1)),ax(4)-0.15*(ax(4)-ax(3)),modtxt)
plot([x0 x0],[ax(3) y0], 'k--')
plot([ax(1) x0],[y0 y0], 'k--')

figure(3)
clf
paperfigure
plot(xV,yV,'.k')
hold on
plot([xV(1) xV(n)],bV(1)+bV(2)*[xV(1) xV(n)],'k')
xlabel('air density')
ylabel('light speed')
plot(x0V,myciM(:,1),'c--')
plot(x0V,myciM(:,2),'c--')
plot(x0V,y0ciM(:,1),'g-.')
plot(x0V,y0ciM(:,2),'g-.')
plot([xV(1) xV(n)],beta0+beta1*[xV(1) xV(n)],'r')
ax = axis;
plot([x0 x0],[ax(3) y0], 'k--')
plot([ax(1) x0],[y0 y0], 'k--')
if beta1<0
    modrealtxt = sprintf('y = %2.2f - %2.3f x',beta0,abs(beta1)); 
else
    modrealtxt = sprintf('y = %2.2f + %2.3f x',beta0,abs(beta1)); 
end
text(ax(1)+0.05*(ax(2)-ax(1)),ax(4)-0.15*(ax(4)-ax(3)),modrealtxt)

disp(['n = ',int2str(n)])
disp(['mean_x = ',num2str(mx)])
disp(['sum_x^2 = ',num2str(sx2)])
disp(['s_x^2 = ',num2str(varx)])
disp(['s_x = ',num2str(sdx)])
disp(['mean_y = ',num2str(my)])
disp(['sum_y^2 = ',num2str(sy2)])
disp(['s_y^2 = ',num2str(vary)])
disp(['s_y = ',num2str(sdy)])
disp(['sum_xy = ',num2str(sxy)])
disp(['cov_xy = ',num2str(covxy)])
disp(['r_xy = ',num2str(cc)])
disp([' '])
disp(['a = ',num2str(bV(1),3),'   b = ',num2str(bV(2),3)])
disp(['residual variance=',num2str(se2)])
disp(['residual SD=',num2str(se)])
disp(['x0 = ', num2str(x0),'   y0 = ', num2str(y0)])
fprintf('(1-%1.2f)%% CI for beta0=[%1.3f, %1.3f] \n',alpha,b0ciV(1),b0ciV(2));
fprintf('H0:beta0=%1.2f   t=%2.3f  p-val=%1.5f \n',beta0,tb0,pb0);
fprintf('(1-%1.2f)%% CI for beta1=[%1.3f, %1.3f] \n',alpha,b1ciV(1),b1ciV(2));
fprintf('H0:beta1=%1.2f   t=%2.3f  p-val=%1.5f \n',beta1,tb1,pb1);
fprintf('(1-%1.2f)%% CI for mean y(x=%2.3f)=[%1.3f, %1.3f] \n',alpha,...
    x0,myciV(1),myciV(2));
fprintf('(1-%1.2f)%% CI for future y(x=%2.3f)=[%1.3f, %1.3f] \n',alpha,...
    x0,y0ciV(1),y0ciV(2));

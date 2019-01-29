% CHAPTER 6
%%  6.1 plot
x=linspace(0, 4*pi, 200);
y=cos(x);
plot(x,y,'LineWidth', 2.5,'Color',[0,0,0]);
axis([0 4*pi -1 1]);
%%  6.1a  plot 2
plot(y,'LineWidth', 2.5,'Color',[0,0,0]);
%% 6.1.1
t=linspace(0, 4*pi, 200);
y=cos(t);
plot(t,y,'LineWidth', 2.5,'Color',[0,0,0]);
axis([0 4*pi -1 1])
xlabel('time t')
ylabel('y(t)')
title('Figure 1')
grid on
%% 6.1.1a
x=linspace(0, 4*pi, 50);
y=cos(x);
plot(x,y,'kx-','LineWidth',2.5,'MarkerSize',10)
axis([0 4*pi -1 1])
pause
plot(x,y,'Color',[0,0,0],'LineWidth',2.5)
axis([0 4*pi -1 1])
pause
plot(x,y,'k-','LineWidth',2.5)
axis([0 4*pi -1 1])
pause
plot(x,y,'kx-','LineWidth',2.5,'MarkerSize',10)
axis([0 4*pi -1 1])
 %% 6.2.1-6.2.2  Handlers
x=0:0.1:4;
y=exp(-x);
Hfig_1=plot(x,y);
set(Hfig_1,'LineWidth', 2.5,'Color', [0 0 0])
%% 6.2.3
set(gcf,'Color', [0.5, 0.5, 0.5])
%% 6.2.3a
p2=gca;
get(p2)
set(p2,'Ytick',0:0.2:1,'YGrid' ,'on')
%% 6.3.1 scatter plot
x=0:0.2:4*pi;
y=sin(x);
scatter(x,y,'k+');
axis([0 4*pi -1.1 1.1]);
set(gca,'YTick',-1:0.5:1);
box on
%% 6.3.2  stem
x=0:0.2:2*pi;
a=sin(x);
st=stem(x,a);
axis([0 2*pi -1.1 1.1])
set(st,'Color',[0,0,0],'LineWidth',2.5)
%% 6.4  multi-figures
x=linspace(0, 4*pi, 30);
y1=cos(x);
y2=2*x./(1+x.^2)-0.5;
ff1=plot(x,y1,'kx-',x,y2,'k--');
axis([0 4*pi -1 1])
set(ff1,'LineWidth',2.5,'MarkerSize',12)
set(gca,'YTick',-1:0.5:1);
%% 6.4a
x=linspace(0, 3*pi, 200)';
y1=cos(x);
y2=2*x./(1+x.^2)-0.5;
w=[y1,y2];
ff2=plot(x,w);
axis([0 3*pi -1 1])
set(ff2,'Color',[0 0 0],'LineWidth',2.5)
set(ff2(2),'LineStyle','--')
set(gca,'YTick',-1:0.5:1,'XTick',0:2:3*pi);
%%  6.4.1  hold on
x=linspace(0, 3*pi, 200);
y1=cos(x);
y2=2*x./(1+x.^2)-0.5;
plot(x,y1,'k-','LineWidth',2.5);
axis([0 3*pi -1 1])
hold on
plot(x,y2,'k:','LineWidth',2.5);
set(gca,'YTick',-1:0.5:1,'XTick',0:2:3*pi);
hold off
%% 6.5
x1=linspace(0,2*pi,50);
y1=sin(x1);
y2=sin(x1).^2;
x2=linspace(0,10,50);
y3=4./(4+x2.^2);
y4=exp(-x2).*sin(x2);
subplot(2,2,1)
plot(x1,y1,'k-','LineWidth',2.5)
axis([0 2*pi -1.1 1.1])
title('Figure 1: sin(x)')
subplot(2,2,2)
plot(x1,y2,'k-','LineWidth',2.5)
axis([0 2*pi 0 1.1])
title('Figure 2: sin(x)^2')
subplot(2,2,3)
plot(x2,y3,'k-','LineWidth',2.5)
axis([0 5 0 1.1])
title('Figure 3: 4/(4+x^2)')
subplot(2,2,4)
plot(x2,y4,'k-','LineWidth',2.5)
axis([0 6 -0.1 0.5])
title('Figure 4: exp(-x) sin(x)')

%% 6.6  ezplot
fsin=@sin;
fez1=ezplot(fsin, [0, 5*pi]);
set(fez1,'Color',[0,0,0],'LineWidth',2.5)
pause
fez11=ezplot('sin', [0, 5*pi]);
set(fez11,'Color',[1,0,0],'LineWidth',2.5)
%% 6.6a
fez3=ezplot(@(x) sin(x)/(1+x), [0,6*pi,-0.3,0.5]);
set(fez3,'Color',[0,0,0],'LineWidth',2.5)
pause
fez31=ezplot('sin(x)/(1+x)', [0,6*pi,-0.3,0.5]);
set(fez31,'Color',[1,0,0],'LineWidth',2.5)
%%  6.6b
fez2=ezplot(@cos);
set(fez2,'Color',[0,0,0],'LineWidth',2.5)
pause
fez21=ezplot('cos(x)');
set(fez21,'Color',[1,0,0],'LineWidth',2.5)
%% 6.7  errorbars
t=0:0.2:12;
y=sin(t/2);
ey=0.1*y;
plot(t,y)
errorbar(t,y,ey,'Color',[0,0,0],'LineWidth',2.5);
axis([0 12 -1.2 1.2])
%% 6.8  histogram
x=-2.9:0.2:2.9;
y=randn(5000,1);
hist(y,x)
hold on
fez3=ezplot(@(x) 5000*0.2.*exp(-x.^2./2)./sqrt(2*pi),[-3 3]);
set(fez3,'Color',[0,0,0],'LineWidth',2.5);
axis([-3 3 0 450])
hold off
%%
%% 6.8  histogram
x=-2.9:0.2:2.9;
y=randn(5000,1);
hist(y,x)
hold on
axis([-3 3 0 450])
hold off
%% 6.9  log-plots
x=0.0:0.5:10;
y=exp(x);
semilogy(x,y,'k-','LineWidth',2.5);
%%  6.9a
x=1:2:100;
y=log(x)+2;
fx=semilogx(x,y);
set(fx,'LineWidth', 2.5,'Color', [0 0 0]);
%% 6.9b  log-plots
x=1:2:100;
y=x.^4;
fgg=loglog(x,y);
set(fgg,'LineWidth', 2.5,'Color', [0 0 0]);
%% 6.10.1  polar
th=linspace(0, 2*pi, 150);
rth=sin(2.*th).^2;
fp=polar(th, rth);
set(fp,'LineWidth', 2.5,'Color', [0 0 0]);
%%  6.10.2
fez4=ezpolar( @(t) (sin(2*t)).^2,[0,2*pi]);
set(fez4,'LineWidth', 2.5,'Color', [0 0 0]);
pause
fez41=ezpolar( '(sin(2*t)).^2',[0,2*pi]);
set(fez41,'LineWidth', 2.5,'Color', [1 0 0]);
%% 6.11.1 parametric plot
fez5=ezplot(@(t) sin(2*t), @(t) cos(3*t), [0,2*pi]);
set(fez5,'LineWidth', 2.5,'Color', [0 0 0]);
pause
fez51=ezplot('sin(2*t)', 'cos(3*t)', [0,2*pi]);
set(fez51,'LineWidth', 2.5,'Color', [1 0 0]);
%% 6.11.2 Implicit plots
fez6=ezplot(@(x,y) x.^2-y.^2-4);
set(fez6,'LineWidth', 2.5,'Color', [0 0 0]);
pause
fez61=ezplot('x.^2-y.^2-4');
set(fez61,'LineWidth', 2.5,'Color', [1 0 0]);
%%
fez7=ezplot(@(x,y) x.^2-y.^2-4,[-5,5,-5,5]);
set(fez7,'LineWidth', 2.5,'Color', [0 0 0]);
pause
fez71=ezplot('x.^2-y.^2-4',[-5,5,-5,5]);
set(fez71,'LineWidth', 2.5,'Color', [1 0 0]);
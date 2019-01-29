%% 8.1
t = 0:pi/50:4*pi;
plot3(sin(t),cos(t),t,'LineWidth', 2.5,'Color',[0,0,0]);
%% 8.1.1
t = 0:pi/50:4*pi;
plot3(sin(t),cos(t),t,'k-','LineWidth', 2.5);
hold on
plot3(sin(t+3),cos(t+3),t,'k:','LineWidth', 1.5);
hold off
%% 8.3
x=-7.5:0.5:7.5;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
mesh(X,Y,Z)
xlabel('x label'),ylabel('y label'),zlabel('z label')
title('mesh figure')
%% 8.3a
mesh(Z)
%% 8.3.1
x=-7.5:0.5:7.5;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
meshc(X,Y,Z)
%% 8.4
x=-7.5:0.5:7.5;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
surf(X,Y,Z)
%% 8.4.1
x=-7.5:0.5:7.5;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
surfc(X,Y,Z)
xlabel('x label'),ylabel('y label'),zlabel('z label')
title('surf with countours')
%% 8.4.2
x=-7.5:0.5:7.5;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
surfl(X,Y,Z)
xlabel('x label'),ylabel('y label'),zlabel('z label')
title('surf with lighting')
%% 8.5.1
x=-8.0:0.5:8.0;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
contour(X,Y,Z,25,'LineWidth', 1.5)
xlabel('x label'),ylabel('y label')
title('contour plot')
%% 8.5.2
x=-8:0.5:8;
y=x;
[X,Y]=meshgrid(x,y);
R=sqrt(X.^2+Y.^2)+eps;
Z=sin(R)./R;
contour3(X,Y,Z,25)
xlabel('x label'),ylabel('y label'),zlabel('z label')
title('contour3 plot')
%%
n=50;
dataf=rand(n);
pcolor(dataf);
axis square;
%% 8.6.2
n=6;
dataf=rand(n);
stem3(dataf,'k','LineWidth', 1.5);
%% 8.7
x=-1:0.1:1;
y=x;
[X,Y]=meshgrid(x,y);
DX=Y;
DY=X;
quiver(X,Y,DX,DY,'k','LineWidth', 1.2)
%% 8.8.1
ezf=ezplot3(@(t) sin(t),@(t) cos(t),@(t) t, [0,4*pi]);
set(ezf,'LineWidth', 2.5,'Color', [0 0 0])
pause
ezf01=ezplot3('sin(t)', 'cos(t)','t', [0,4*pi]);
set(ezf01,'LineWidth', 2.5,'Color', [1 0 0])
%% 8.8.2
ezmesh(@(x,y) sin(sqrt(x.^2+y.^2))./...
(sqrt(x.^2+y.^2)+eps))
%% 8.8.3
ezsurf(@(x,y) sin(sqrt(x.^2+y.^2))./...
(sqrt(x.^2+y.^2)+eps))
%% 8.8.4
ezf1=ezcontour(@(x,y) sin(sqrt(x.^2+y.^2))./...
(sqrt(x.^2+y.^2)+eps),20);
set(ezf1,'LineWidth', 2.0)
%%
ezf2=ezcontour('sin(sqrt(x.^2+y.^2))./(sqrt(x.^2+y.^2)+eps)',...
    20);
set(ezf2,'LineWidth', 2.0)
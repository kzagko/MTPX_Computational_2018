% CHAPTER 10

echo on
%% Polynomial
p1=[1 2 3 2 1]
p2=[1 3 4 2 1]
p1+p2
conv(p1,p2)
r1=roots(p1)
r2=roots(p2)
poly(r1)
poly(r2)
polyval(p1,sqrt(2))
polyval(p2, [1 2 3 4])
polyder(p1)
polyint(p2,2)

%% fitting
x=linspace(0,3,20);
y=-4*x.^2+x.^4+4*(rand(1,20)-0.5);
pol=polyfit(x,y,4)
y1=polyval(pol,x);
plot(x,y,'k+', x,y1,'k--',...
    'LineWidth', 2.5,'MarkerSize',12)
%% Roots
fun=@(x) (3-x)*exp(x)-3;
fzero(fun, 3)
ff1=@(x) x.^2+4
fzero(ff1, 1)
fzero(ff1, i)
ff2=@(x) -x.^3+2*x+3;
fzero(ff2, [0 3])
%% extreme points
[X, FV]=fminbnd(@(x) x+5*sin(x), 4, 5)
[X, FV]=fminbnd(@(x) -(x+5*sin(x)), 6,9)
%
%% Integration
y=1+0.2*rand(1000,1);
trapz(y)/1000
f=@(x) sqrt(1+x.^2+x.^4)
quad(f,0,1)

%% Interpolation
x=0:4*pi; %x=0:0.05:4*pi;
y=x+cos(x);
zx=linspace(0,4*pi,21);
% zy= interpolating values of y at the positions of zx
zy=interp1(x,y,zx);
plot(x,y,'r*',zx,zy,'k',...
    'LineWidth', 2.5,'MarkerSize',12)
%%
x=0:4*pi;%x=0:0.05:4*pi;
y=x+cos(x);
zx=linspace(0,4*pi,21);
% zy= interpolating values of y at the positions of zx
zy=interp1(x,y,zx,'spline');
plot(x,y,'r*',zx,zy,'k',...
    'LineWidth', 2.5,'MarkerSize',12)
%%
x=0:4*pi;%x=0:0.05:4*pi;
y=x+cos(x);
zx=linspace(0,4*pi,21);
pp=spline(x,y);
%pp=pchip(x,y);
zy=ppval(pp,zx);
plot(x,y,'r*',zx,zy,'k',...
    'LineWidth', 2.5,'MarkerSize',12)
%%
% derivative
x=0:0.05:4*pi;
y=x+cos(x);
zx=linspace(0,4*pi,100);
pp=spline(x,y);
%pp=pchip(x,y);
ppd=fnder(pp)
zyd=ppval(ppd,zx);
plot(zx,zyd,'k','LineWidth', 2.5)
%%
% Integration
x=0:0.05:4*pi;
y=10*cos(x);
zx=linspace(0,4*pi,100);
pp=spline(x,y);
%pp=pchip(x,y);
ppint=fnint(pp)
zyint=ppval(ppint,zx);
plot(zx,zyint,'k','LineWidth', 2.5)
%% FFT
%
f1=ezplot(@(t) mod(t,1)-0.5, [-2, 2]);
set(f1,'Color',[0 0 0],'LineWidth', 2.5)
%%
N=2^6;
x=linspace(0,1,N);
y=x-0.5;
fy=fft(y);
k=1:2:N-1;
fy1=1./(2*pi*k)-1./(2*pi*(N-k));
plot(imag(fy(2:end))/N,'Color',[0 0 0],'LineWidth', 2.5)
axis([0 N -0.2 0.2])
xlabel('k')
ylabel('Imag(F(k)) / N')
hold on
plot(k,fy1,'r+','MarkerSize',12)
hold off
%ezplot(@(t) mod(t,1)-0.5, [-3, 3])

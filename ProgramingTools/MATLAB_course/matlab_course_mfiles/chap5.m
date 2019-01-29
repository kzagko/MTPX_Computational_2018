%Chapter 5
%
disp('***   PARAGRAPH 5.1   ***')
x = 1
disp(x)
z=ff(x)
disp(x)
%disp(y)

%% -----------------------------------------------
disp('******   example    ******')
a=rand(100,1);
findmaximum(a)
z=findmaximum(a)
[z1 z2]=findmaximum(a)

%% ----------------------------------------------------
disp('******   example    ******')
a=15*rand(12,1);
[z1 z2]=firstnumber(a)
%%
disp('******   example    ******')
a=15*rand(12,1);
a(10)=-1;
[z1 z2]=firstnumbernew(a)

%%
disp('***   PARAGRAPH 5.2   ***')
%
fsin=@sin;
fsin([0: 0.25 :1])
%% -------------------------------------
disp('******   example    ******')
ffindmaximum=@findmaximum
a=rand(50,1);
[z1 z2]=ffindmaximum(a)

%% ---------------------
disp('******   example    ******')
f1=@(x) 1./(x.^2+1);
f1(1)
f1([1:0.2:2])
f2=@(x,y) x^2+y^2;
f2(1, 1)
f2(1.2,0.8)

%% ----------------------------------
disp('******   example    ******')
quad(@(x) x.^2./(1+x.^2), 0, 1)
%% --------------------------------------
disp('***   PARAGRAPH 5.3   ***')
%%
ff=@(x) (1-x).*sqrt(x);
x1=0:.1:1;
y1=ff(x1);
plot(x1,y1,'k:','LineWidth',2.5);
set(gca,'Ytick',[0:0.1:0.4],'Xtick',[0:0.2:1])
hold on
f1=stem(x1,y1);
set(f1,'Color',[0 0 0])
f2=ezplot(ff,[0,1]);
set(f2,'Color',[0 0 0],'LineWidth',2.5)
axis([0 1 0 0.4])
%%
disp('******   example    ******')
ff=@(x) (1-x)*sqrt(x);
trapez(ff,0,1,1000)
trapez(@sin,0,pi,10000)
%%  ---------------------------------------
disp('******   example    ******')
a=2+0.5*rand(100000,1);

[amean sdx]=statistics(a)

%%  -------------------------------------------
disp('******   example    ******')
A=rand(100, 3);
mean(A)
mean(A(:))
std(A)
std(A(:))
var(A)
var(A(:))

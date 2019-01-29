%Chapter 4
%  if
disp('*****   PARAGRAPH 4.1   if   *****')
b =1
if b>3
    a=33
else
    a=21
end
a
%% -----------------------------------------------
disp('******   example    ******')
x=4;
if x > 6
a = 2;
b = 3;
else
    a = 5;
    b = 6;
end
disp(a), disp(b)

%% ----------------------------------------------------
disp('******   example    ******')
b=4; 
if b <2
    a = 3;
elseif b<6
        a = 6;
elseif b>=6
    a=10;
end
a
%% switch
disp('*****   PARAGRAPH 4.1   switch   *****')
x=2.7;
%
units='cm';
switch units % convert x to meters
    case {'inch','in'}
        y=x*100/2.54;
    case {'meter','m'}
        y=x;
    case {'millimeter','mm'}
        y=x*10^3;
    case {'centimeter','cm'}
        y=x*100;
    case 'A'
        y=x*10^10;
    otherwise
        disp(['Unknown Units: ', units])
        y=nan;
end
disp(y)
%%
disp('******   PARAGRAPH 4.2   Loops   ******')
%
x=[];
for i=1:10
    x=[x,i^2];
end
disp(x)
%% -------------------------------------
disp('******   example 2   ******')
n=100;
s=0.;
for i=1:n
    s=s+i;
end
disp(s);
%% ---------------------
disp('******   example 3   ******')
n=100;
a=10*rand(1,n);
amax=a(1);imax=1;
for i=2:n
    if a(i)>amax
        amax=a(i);
        imax=i;
    end
end
disp('maximum number= '),disp(amax)
disp('position= '),disp(imax)
%% ----------------------------------
disp('******   example    ******')
n=100;
a=2+rand(1,n);
% evaluation of the mean value
asum=0.;
for i=1:n
    asum=asum+a(i);
end
amean=asum/n
%evaluation of the stantard deviation
a2sum=0.;
for i=1:n
    a2sum=a2sum+(a(i)-amean)^2;
end
sda=sqrt(a2sum/(n-1))
%% --------------------------------------
disp('******   example   ******')
for i=1:3
    for j=1:4
        c(i,j)=(i+j)/2.;
    end
end
disp('c ='),disp(c)
%% ------------------------------------
disp('******   example   ******')
n=10;
a=magic(n);
asum=0.;
for n1=1:n
    for n2=1:n
        asum=asum+a(n1,n2);
    end
end
disp('matrix element summation= '),disp(asum)
%%  ----------------------------
% operator while   ---------------------------
disp('******   example   ******')
n=100;
a=10*rand(1,n);
amax=a(1);imax=1;
ni=1;	
while ni<n+0.5
    if a(ni)>amax
        amax=a(ni);
        imax=ni;
    end
ni=ni+1;
end
disp('maximum number= '),disp(amax)
disp('position= '),disp(imax)
%% --------------------------------------
disp('******   example    ******')
n=10000;
a=2+0.2*rand(1,n);
% evaluation of the mean value
asum=0.;
i1=1;
while i1<n+0.5
    asum=asum+a(i1);
    i1=i1+1;
end
amean=asum/n
%evaluation of the stantard deviation
a2sum=0.;
i2=1;
while i2<n+0.5
    a2sum=a2sum+(a(i2)-amean)^2;
    i2=i2+1;
end
sda=sqrt(a2sum/(n-1))
%% -------------------------------------------
disp('******   example    ******')
n=10;
a=magic(n);
asum=0.;
n1=1;
while n1<=n
    n2=1;
    while n2<=n
        asum=asum+a(n1,n2);
        n2=n2+1;
    end
    n1=n1+1;
end
disp('matrix element summation= '),disp(asum)
%%  -------------------------------------------------
disp('******   example    ******')
n=10;
a=magic(n);
asum=0.;
for n1=1:n
    n2=1;
    while n2<=n
        asum=asum+a(n1,n2);
        n2=n2+1;
    end
end
disp('matrix element summation= '),disp(asum)
%% -------------------------------------------------
disp('***   PARAGRAPH 4.3   ***')
n=100;
a=floor(20*rand(1,n)+1);
asum=0.;
for ni=1:100
    if mod(a(ni),2)==1
        continue
    end
asum=asum+a(ni);
end
disp('sum= '),disp(asum);
%%  ---------------------------------------
disp('******   example    ******')
n=100;
a=floor(20*rand(1,n)+1);
asum=0.;index=0;
for ni=1:100
        if mod(a(ni),2)==index
            index=index+1;
            if index>1
                break
            end
            disp(a(ni))
        elseif index==1
            disp(a(ni))
        end
end
%%  -------------------------------------------
disp('***   PARAGRAPH 4.4   ***')
af=magic(6);
s=0;
for i=1:6
    for j=1:6
        if mod(af(i,j),2)==0&&mod(af(i,j),3)==0
            disp(af(i,j));s=s+af(i,j);
        end
    end
end
disp(s)
%% -------------------------------
disp('******   example    ******')
af=magic(6);
s=0;
for i=1:6
    for j=1:6
        if mod(af(i,j),2)==0||mod(af(i,j),3)==0
            disp(af(i,j));s=s+af(i,j);
        end
    end
end
disp(s)
%% ----------------------------
disp('******   example    ******')
af=magic(6);
s=0;
for i=1:6
    for j=1:6
        if (~mod(af(i,j),2)==0)&&(~mod(af(i,j),3)==0)
            disp(af(i,j));s=s+af(i,j);
        end
    end
end
disp(s)

%%  7.2
format long e
a=sqrt(2)
%%
who
x=0:0.1:10;
save('test.dat','x','-ascii')
save('c:\test1.dat','x','-ascii')
save('c:/test2.dat','x','-ascii')
%%
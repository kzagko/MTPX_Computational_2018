power10 = 8;
kor = [];
x = [];
for i = 1:power10
    x(i) = 10^i;
    kor(i) = grammata(x(i));
end

semilogx(x,kor,'-s')
ylabel('Ratio of Tails over total number of tries')
xlabel('Total number of tries')

function g = grammata(n)
a = unidrnd(2,1,n);
g = (1.0*sum(a>1))/n;
end
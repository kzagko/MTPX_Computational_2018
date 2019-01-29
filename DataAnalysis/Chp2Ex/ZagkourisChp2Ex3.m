mu = [1,2];
sigma = [1,1.5;1.5,3];
A = mvnrnd(mu,sigma,10000);

var1 = var(A(:,1));
var2 = var(A(:,2));
var12 = var(A(:,1)+A(:,2));

strip = ['The Var[X+Y] ',num2str(var12),' is different from the sum Var[X] + Var[Y] ',num2str(var1+var2)];
disp(strip)
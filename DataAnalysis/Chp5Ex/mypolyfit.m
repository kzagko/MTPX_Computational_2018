






function [a,y_fit,Sa,Sy_fit,R2,Ca,condX] = mypolyfit(x,y,p,b,Sy)
% [ a , y f i t , Sa , S y f i t , Ca , condX ] = m y p o l y f i t ( x , y , p , b , Sy )
%
% f i t a power−p o l y n o m i a l , y f i t ( x ; a ) t o d a t a p a i r s ( x , y ) where
%
% y f i t ( x ; a ) = SUM i=1 ˆ l e n g t h ( p ) a i xˆ p i
%
% which m i n i m i z e s t h e Chi−s q u a r e e r r o r c r i t e r i o n , X2 ,
%
% X2 = SUM k=1 ˆ l e n g t h ( x ) [ ( y f i t ( x k ; a ) − y k )ˆ2 / S y k ˆ2 ]
%
% where S y k i s t h e s t a n d a r d e r r o r o f t h e k−t h d a t a p o i n t .
%
% INPUT VARIABLES
%
% x = v e c t o r o f measured v a l u e s o f t h e i n d e p e n d e n t v a r i a b l e s ,
% Note : x i s assumed t o be assumed t o be e r r o r −f r e e
% y = corresponding v a l u e s of the dependent v a r i a b l e s
% Note : l e n g t h o f y must e q u a l l e n g t h o f x
% p = v e c t o r o f powers t o be i n c l u d e d i n t h e p o l y n o m i a l f i t
% Note : v a l u e s o f p may be any r e a l number
% b = r egu lari zati on constant default = 0
% Sy = s t a n d a r d e r r o r s o f t h e i n d e p e n d e n t v a r i a b l e s default = 1
%
% OUTPUT VARIABLES
%
% a = i d e n t i f i e d values of the polynomial c o e f f i c i e n t s
% yfit = v a l u e s o f curve− f i t e v a l u a t e d a t v a l u e s o f x
% Sa = standard errors of polynomial c o e f f i c i e n t s
% R2 = R−s q u a r e d e r r o r c r i t e r i o n
% S y f i t = s t a n d a r d e r r o r s o f t h e curve− f i t
% Ca = parameter c o r r e l a t i o n m a t r i x
% condX = c o n d i t i o n number o f s y st e m m a t r i x
%
% Henri Gavin , C i v i l E n g i n e e r i n g , Duke Univ . , Durham NC 4−10−2007
% error checking
if (length(x)  ~= length(y))
    disp('length of x must equal length of y');
    return
end

Ny = length(y);
Np = length(p);

% make ” x ” a column−v e c t o r
% make ” y ” a column−v e c t o r
% make ” p ” a column−v e c t o r
x = x(:);
y = y(:);
p = p(:);

% default values
%. . . s e t up i n v e r s e o f y d a t a c o v a r i a n c e matrix , P

if nargin > 4 , P = diag (1./Sy.^2); else, P=eye(Ny); end
% . . . r e g u l a r i z a t i o n parameter
if nargin < 4 ,
    b = 0;
end

xm = max(x);
X = zeros(Ny,Np);
% a l l o c a t e memory f o r ”X” m a t r i x
for i =1:Np
    X(:,i) = x.^p(i);
end

% s e t up X m a t r i x such t h a t y = X a
condX = cond(X'*P*X + b*eye(Np));
C = inv(X'*P*X + b*eye(Np));
% c o n d i t i o n number
% parameter ” c o v a r i a n c e ”
a = C*X'*P*y ; % l e a s t squares parameters
y_fit = X*a ; % l e a s t squares f i t
if nargin < 5
% estimate data
    noise_sq = sum((y-y_fit).^2)/(Ny-Np);
    P = eye(Ny)/noise_sq ;
    C = inv(X'*P*X + b*eye(Np));
end
%c o v a r i a n c e from t h e curve− f i t
% sum o f s q u a r e d e r r o r s
% data covariance ( i n v e r s e )
% e s t i m a t e d parameter c o v a r i a n c e
% re−compute parameter c o v a r i a n c e f o r b  ̃= 0
if b == 0
% no r e g u l a r i z a t i o n
    Va = C ;
% s i m p l e e x p r e s s i o n f o r parameter c o v a r i a n c e
else
    Va = C*( X'*P*X + b^2*C*X'*P*y*y'*P*X*C)*C ; % . . . more c o m p l i c a t e d !
end

Sa= sqrt(diag(Va)); % s t a n d a r d e r r o r o f t h e p a r a m e t e r s
Sa= Sa(:);



% s t a n d a r d e r r o r o f t h e curve− f i t
Sy_fit = sqrt(diag(X*Va*X'));
% Vy = [ dy / da ] Va [ dy / da ] ’ = X Va X’

R2 = 1 - sum((y-y_fit).^2)/sum((y-sum(y)/Ny).^2);
% R−s q u a r e d

Ca = Va./(Sa*Sa');
% parameter c r o s s −c o r r e l a t i o n m a t r i x

disp ( 'P   a       +/ -    da          (percent)')
disp ( '_________________________________________')
for i=1:Np
    if rem(p,1) == 0
        fprintf ('a[%2d] = %11.3e;  +/- %10.3e  (%5.2f %%)\n', ...
                        p(i) , a(i) , Sa(i) , 100*Sa(i)/abs(a(i)));
    else
        fprintf(' %8.2f : %11.3e +/- %10.3e     (%5.2f%%)\n', ...
                        p(i) , a(i) , Sa(i) , 100*Sa(i)/abs(a(i)));
    end
end

% −−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−−− m y p o l y f i t
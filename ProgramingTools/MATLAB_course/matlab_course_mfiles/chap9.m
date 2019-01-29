% CHAPTER 9
echo on
%% Vectors
a=[5;2;4];
b=[8;2;7];
dot(a,b)
dot(b,a)
cross(a,b)
cross(b,a)
norm(a)
norm(b)
acos(dot(a, b)/(norm(a)*norm(b)))
acosd(dot(a, b)/(norm(a)*norm(b)))
norm(a)*norm(b)*sind(acosd(dot(a, b)/(norm(a)*norm(b))))
norm(cross(a,b))
%% Matrixes
A=[7, 7, 6; 1, 9, 4; 5, 4, 0];
B=[0 ,6, 0; 7, 5, 9; 8, 6, 2];
3*A
A*3
3*A==A*3
A+B
B+A
A+B==B+A
A*B
B*A
A*B==B*A
A.'
A'
A.'==A'
sc=[1 i; i 1];
sc.'==sc'
(A*B)'==B'*A'
det(A)
det(B)
det(A*B)
det(B*A)
det(A*B)==det(A)*det(B)
inv(A)
inv(B)
inv(A)*A
inv(A*B)
inv(B)*inv(A)
inv(A*B)==inv(B)*inv(A)
chop(inv(A*B),10)==chop(inv(B)*inv(A),10)
det(inv(A))
1/det(A)
A^3
A*A*A
A^3==A*A*A
A^(-3)
(inv(A))^3
A^(-3)==(inv(A))^3
chop(A^(-3),10)==chop((inv(A))^3,10)
s2=[0 pi; -pi 0];
expm(s2)
s2=[1 0; 0 -1];
expm(-i*pi*s2)
expm(A)
expm(A+B)
expm(A)*expm(B)
expm(A+A)
expm(A)*expm(A)
expm(A+A)==expm(A)*expm(A)
trace(A)
trace(B)
trace(A*B)
trace(B*A)
trace(A)*trace(B)
%% Linear systems
A1=[1 1; 1 -2];
b1=[1;2];
x=A1\b1
x=inv(A1)*b1
b=[6;3;1];
A\b
inv(A)*b
c=[6 3 1];
x=c/A
x=c*inv(A)
s2=[0 pi; -pi 0];
expm(s2)
%% Eigen properties
s1=[1,i; -i, -1]
[V,D]=eig(s1)
s1*V
V*D
[V,D]=eig(A)
D(2,2)
V(:,2)
echo off
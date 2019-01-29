% CHAPTER 2
echo on
%%
disp('****   PARAGRAPH 2.1   ****')
a1=[2, 7, 71, 8, 9]
a2=[3 8; 4 5]
a2=[3 8
4 5]
a1(3)=11
a2(2, 1)=13
size(a1)
size(a2)
length(a1)
length(a2)
numel(a1)
numel(a2)

%%
disp('****   PARAGRAPH 2.2   ****')
d1=1:2:10
d11=1:9
d2=[1:1:5; 2:2:10; 1:.5:3]
linspace(1,4,5)
zeros(2,3)
zeros(3)
ones(2,3)
ones(3)
eye(3)
c=diag([1,2,3,4])
diag(c)
magic(4)
rand(2,3)
rand(3)
randn(2,3)
randn(3)

%%
disp('****   PARAGRAPH 2.3   ****')
a1=12:20;
a1([1,3,7])
a=magic(5)
a([1,2,4], 2)
a([1, 3], [2, 4])
a(1:3,2)
a(2,2:end)
a(2, :)
a2 =[ 1 3; 4 2]
a2(:)
a2(3)
a2(end)
b=1:10;
b(b>5)
a=magic(4);
a(a>8)
a=magic(4)
a(2:3,1:2)
a1=[11 7; 8 5]
a(2:3,1:2)=a1
a(3,:)=[]
a(:,2)=[]
%
%%
disp('****   PARAGRAPH 2.4   ****')
A1=[1 3;8 4];
A2=[3 7 2;9 4 6];
S=[A1 A2]
B1=[1 7 9; 5 8 4];
B2=[3 8 6; 6 9 4; 4 9 6];
S=[B1; B2]
C1=[1 4; 7 8];
C2=[3 8 7; 8 7 3];
C3=[7 9 6; 9 5 7; 8 5 4];
C4=[8 6; 6 1; 7 5];
S=[C1 C2; C3 C4]

%%
disp('****   PARAGRAPH 2.5   ****')
A=[7,7,6; 1,9,4; 5,4,1];
B=[11,6,5; 7,5,9; 8,6,2];
A+2
A-3
A+2==2+A
3*A
A/3
3\A
A+B
A-B
A+B==B+A
A.*B
B.*A
A./B
B.\A
A.^2
A.^(-1)
1./A==A.^(-1)
A.'
B.'
sin([0:pi/4:pi])
a=10*rand(3,4)
log(a)
%%
disp('****   PARAGRAPH 2.6   ****')
a=11:20;
A=[7,7,6; 1,9,4; 5,4,1];
find(a>16)
find(A>6)
[i j]=find(A>6)
min(A)
min(A(:))
max(A)
max(A(:))
sum(A)
sum(A(:))
prod(A)
prod(A(:))
sort(A,'ascend')
sort(A,'descend')

%%
echo off
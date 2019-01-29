% Find the values and indices of the first consecutive even numbers in a
% set of 100 integers.
n = 100;
A = round(19.*(rand(1,n))+1);
pos=[];
values=[];
i = 1;

while i < n-1   %n-1 so it does not overrun he array indices
    if mod(A(i),2) == 0
        if mod(A(i+1),2) == 0
            pos([1 2]) = [i, i+1];
            values([1,2]) = [A(i),A(i+1)];
            break
        end
    end
    i = i +1;
end

if i ~= n-1
    pos
    values
else
    disp('No consecutive even numbers found!')
end
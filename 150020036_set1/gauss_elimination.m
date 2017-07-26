%Gauss Elimination

clear all
clc
A = [10 -1 2 0 5 7;-1 11 -1 3 8 9;2 -1 10 -1 3 7;0 3 -1 8 3 4;8 7 6 3 2 3;1 3 2 7 9 11]
b = [6 25 11 15 13 14]';
n = length(A);
A = [A b];

for i = 1:n
    A(i,:) = A(i,:)/A(i,i);
    for j = i+1:n
        A(j,:) = A(j,:) - A(i,:)*A(j,i);
    end
end

for i = n:-1:1
    for j = i-1:-1:1
        A(j,:) = A(j,:) - A(i,:)*A(j,i);
    end
end

A(:,n+1)
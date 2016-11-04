clear all
clc

A = [1 2 0 0;3 4 5 0;0 6 7 8;0 0 5 1]
d = [1 2 3 4]';
n = length(A);

for i = 1:n-1
    c(i) = A(i,i+1);
    a(i+1) = A(i+1,i);
    b(i) = A(i,i);
end
b(n) = A(n,n);

C(1) = c(1)/b(1);
for i = 2:n-1
    C(i) = c(i)/(b(i)-a(i)*C(i-1));
end

D(1) = d(1)/b(1);
for i = 2:n
    D(i) = (d(i)-a(i)*D(i-1))/(b(i)-a(i)*C(i-1));
end

x(n) = D(n);
for i = n-1:-1:1
    x(i) = D(i) - C(i)*x(i+1);
end

x
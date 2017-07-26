clear all 
clc

n = 11;
L = 0.8;
dx = L/(n-1);
A = zeros(n-2,n-2);
c(1) = 1.0;
c(n-2) = 0.2;
for i = 1:n-3
    A(i,i) = -1*(2+dx*dx);
    A(i,i+1) = 1;
    A(i+1,i) = 1;
end
A(1,1) = 1;
A(1,2) = 0;
A(n-2,n-3) = 0;
A(n-2,n-2) = 1;

A = [A c']
n = length(A) - 1;
d = A(:,n+1);

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
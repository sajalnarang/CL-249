clear all;
clc;

X = xlsread('gasoline');
X1 = X(:,1);
X2 = X(:,2);

[mean(X1) mean(X2)];
[median(X1) median(X2)];
[mode(X1) mode(X2)];
[var(X1) var(X2)];

cov(X1,X2);
corr(X1,X2);

n = 1000;
V = zeros(1000,n);
M = zeros(10,1);
Var = zeros(10,1);

for j = 1:n
    U = rand(1000,j);
    V(:,j) = mean(U,2);
    M(j) = mean(V(:,j));
    Var(j) = var(V(:,j));
    plot(1/j,Var(j),'x');
    hold on;
end
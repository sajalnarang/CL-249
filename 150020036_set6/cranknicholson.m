clear all;
clc;

r = 0.25;
m = 10000;
n = 100;
T = zeros(m,n);
T(1,:) = 25;
T(:,1) = 0;
T(:,n) = 100;
X = zeros(n);

for i = 2:n-1
    X(i,i) = 2*r + 1;
    X(i,i-1) = -r;
    X(i,i+1) = -r;
end
X(1,1) = 1;
X(n,n) = 1;

for i = 1:m-1
    Y(n,1) = T(i,n);
    Y(1,1) = T(i,1);
    for j = 2:n-1
        Y(j,1) = (1-2*r)*T(i,j) + r*T(i,j+1) + r*T(i,j-1);
    end
    T(i+1,:) = (X\Y)';
    plot(1:n,T(i,:));
    hold on;
end
T
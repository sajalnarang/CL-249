clear all;
clc;

r = 0.25;
m = 10000;
n = 100;
T = zeros(m,n);
T(:,1) = 0;
T(:,n) = 100;
T(1,:) = 25;

for i = 1:m-1
    for j = 2:n-1
        T(i+1,j) = r*T(i,j+1) + (1-2*r)*T(i,j) +r*T(i,j-1);
    end
    if abs(T(i,:) - T(i+1,:)) < 0.0001
        break;
    end
    plot(1:n,T(i+1,:));
    hold on;
end
clear all;
clc;

h = 0.01;
s = 0.8;
n = 100;
y1 = zeros(n + 1);
y2 = zeros(n + 1);
zeta = zeros(n + 1);
eta = zeros(n + 1);
y1(1) = s;
y2(1) = 6*(s-1);
zeta(1) = 1;
eta(1) = 6;

for k = 1:10
    y2(1) = 6*(y1(1)-1);
    for i = 1:n
        y1(i+1) = y2(i)*h + y1(i);
        y2(i+1) = (6*y2(i) + 12*y1(i)*y1(i))*h + y2(i);
        zeta(i+1) = eta(i)*h + zeta(i);
        eta(i+1) = (6*eta(i) + 24*y1(i)*zeta(i))*h + eta(i);
    end
    s = s - (y2(i)/eta(i));
    y1(1) = s;
end 
s
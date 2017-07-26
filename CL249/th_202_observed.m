clear all;
clc;

x = [3.02 3.09 3.12 3.15 3.21]*0.001;
y = [6.61 6.39 6.28 6.18 5.94];
n = length(x);

b = (sum(x)*sum(y) - n*dot(x,y))/((sum(x))^2 - n*dot(x,x));
a = (sum(y) - b*sum(x))/n;

plot(x,y,'bo');
hold on;
plot(x,a+b*x,'r');
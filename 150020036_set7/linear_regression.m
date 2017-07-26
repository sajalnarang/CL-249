clear all;
clc;

x = [90 105 120];
y = [60.9 53.9 47.9];
n = length(x);

b = (sum(x)*sum(y) - n*dot(x,y))/((sum(x))^2 - n*dot(x,x))
a = (sum(y) - b*sum(x))/n

plot(x,y,'bo');
hold on;
plot(x,a+b*x,'r');
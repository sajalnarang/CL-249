clear all;
clc;

x = 5:5:40;
y = [0.530  0.716   0.806   0.869   0.943   1.013   1.096   1.16];
n = length(x);

b = (sum(x)*sum(y) - n*dot(x,y))/((sum(x))^2 - n*dot(x,x));
a = (sum(y) - b*sum(x))/n;

plot(x,y,'bo');
hold on;
plot(x,a+b*x,'r');
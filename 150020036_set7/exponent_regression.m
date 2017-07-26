clear all;
clc;

x = 10^4 * [1.79    2.03    2.22    2.47    2.97    3.39    4.95    7.37    9.01];
y = 10^2 * [0.28    0.32    0.36    0.40    0.49    0.59    0.99    1.55    2.00];
Y = log(y);
n = length(x);

b = (sum(x)*sum(Y) - n*dot(x,Y))/((sum(x))^2 - n*dot(x,x));
a = (sum(Y) - b*sum(x))/n;
A = exp(a);

y = exp(Y);
plot(x,y,'bo');
hold on;
plot(x,A*exp(b*x),'r');
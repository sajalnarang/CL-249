clear all;
clc;

x = 0:0.2:1;
y = [1.4982 1.4702 1.4422 1.4131 1.3862 1.3557];
n = length(x);

b = (sum(x)*sum(y) - n*dot(x,y))/((sum(x))^2 - n*dot(x,x));
a = (sum(y) - b*sum(x))/n;

plot(x,y,'bo');
hold on;
plot(x,a+b*x,'r');

RI = [1.3823 1.3777 1.3924 1.3854 1.4011 1.3936];
for i = 1:6
    y0 = RI(i);
    x0 = (y0 - a)/b;
    plot(x0,y0,'kx');
end
title('Refractive index of mixture vs mole fraction');
xlabel('x_{A}');
ylabel('\mu_{mix}');
legend('Data points','Best fit line','Readings');
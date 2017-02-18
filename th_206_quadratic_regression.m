clear all;
clc;

x = [0.85 0.78 0.71];
y = [-0.455 -0.489 -0.493];
n = length(x);
sigmax = zeros(4,1);
sigmax2y = 0;

for k = 1:4
    for i = 1:n
        sigmax(k) = sigmax(k) + x(i)^k;
    end
end

for i = 1:n
    sigmax2y = sigmax2y + x(i)^2 * y(i);
end

A = [sigmax(4) sigmax(3) sigmax(2)
     sigmax(3) sigmax(2) sigmax(1)
     sigmax(2) sigmax(1) n];

b = [sigmax2y ; dot(x,y) ; sum(y)];

c = A\b;

x0 = 0:0.01:1;
n0 = length(x0);
y0 = zeros(n0,1);
for j = 1:n0
    y0(j) = c(1)*x0(j)^2 + c(2)*x0(j) + c(3);
end

plot(x,y,'bo');
hold on;
plot(x0,y0,'r');
ax = gca;
ax.XAxisLocation = 'origin';
title('ln(\gamma_{A}/\gamma_{B}) vs mole fraction');
xlabel('x_{A}');
ylabel('ln(\gamma_{A}/\gamma_{B})');
legend('Data points','Best fit polynomial');

area = c(1)/3 + c(2)/2 + c(3);
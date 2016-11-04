clear all;
clc;

y0 = 1;
t0 = 0;
t = 5;
h = 0.001;

T = (t0:h:t)';
n = length(T) - 1;
Y = zeros(n+1);
Y(1) = y0;

for i = 1:n
    Y(i+1) = newton_raphson(T(i),Y(i),h);
end

plot(T,Y)
hold on
U = exp(T.^2);
plot(T,U)
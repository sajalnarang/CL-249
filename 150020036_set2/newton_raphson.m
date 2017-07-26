clear all
clc

%h = 0.00001;
%x = 0.12;

%while abs(f(x)) > h
%    der = (f(x+h) - f(x))/h;
%    x = x - f(x)/der;
%end

x = [4 1 -0.5];
xn = [0 0 0];
h = [0.000001 0.000001 0.000001];

for i = 1:100
    xn = x - (inv(jacobian(x,h))*v(x)')'
    x = xn;
end
x
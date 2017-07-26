clear all;
clc;

delx = 0.1;
x = 1:delx:2;
y = x.*log(x)
n = length(x) - 1;

%Trapezoid method
I = delx/2*(2*sum(y) - y(1) - y(n+1))

%Simpson's 1/3 rule
sumodd = 0;
sumeven = 0;
for i = 2:n
    if mod(i,2) == 0
        sumodd = sumodd + y(i);
    else
        sumeven = sumeven + y(i);
    end
end

I1 = delx/3*(y(1) + 4*sumodd + 2*sumeven + y(n+1))

%Gauss Quadrature method
z = [-0.9062    -0.5385 0   0.5385  0.9062];
w = [0.2369 0.4786  0.5689  0.4786  0.2369];
x = (z+3)/2;
y = x.*log(x)/2;

I2 = dot(w,y)
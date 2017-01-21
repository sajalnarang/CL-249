clear all;
clc;

m = 42;
n = 24;
Tw = 24;
Ti = 28.6;
delr = 2;
delt = 30;
T = zeros(m,n);
alpha = 0.039;

%Boundary conditions
T(1:m/2,1) = [48.8 51.1 52.6 53.6 54.3 54.8 55.1 55.3 55.5 55.6 55.8 55.8 55.8 55.9 55.9 56.0 56.0 56.0 56.0 56.0 56.0];
T(:,n) = Tw;
for i = m/2:-1:1
    T(2*i) = T(i);
end
for i = 2:m/2
    T(2*i - 1) = (T(2*i) + T(2*i -2))/2;
end

%Initial condition
T(1,:) = Ti;

for i = 1:m-1
    for j = 2:n-1
        T(i+1,j) = T(i,j) + alpha*delt*(T(i,j+1) - 2*T(i,j) + T(i,j-1))/(delr*delr) + alpha*delt*(T(i,j+1)-T(i,j))/((2*i+5)*delr);
    end
end
for i = 1:6
    plot(1:m,T(:,4*i-3));
    hold on;
end
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
T(1:m/2,1) = [26.8 31.8 35.9 38.9 40.9 42.3 43.2 43.9 44.4 44.8 45.1 45.2 45.4 45.5 45.6 45.7 45.7 45.8 45.9 45.9 45.9];
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
T
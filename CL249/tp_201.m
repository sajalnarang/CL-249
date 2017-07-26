clear all;
clc;

x = xlsread("tp_201_brass_15V.xlsx");

m = 51;
n = 8;
Tw = 40.0;
delx = 15;
delt = 30;
alpha = 3.5;
T = zeros(m,n);

% Boundary conditions
T(:,n) = Tw;
T(:,1) = x(:,7);

%Initial condition
T(1,:) = x(1,7:14);

for i = 1:m-1
    for j = 2:n-1
        T(i+1,j) = T(i,j) + alpha*delt*(T(i,j+1) - 2*T(i,j) + T(i,j-1))/(delx*delx);
    end
end
for i = 1:8
    plot((1:m)/2,T(:,i));
    hold on;
end

title('Theoretical Plot for Brass at 15V');
xlabel('Time (minutes)');
ylabel('Temperature (\circC)');
legend('T1','T2','T3','T4','T5','T6','T7','T8');
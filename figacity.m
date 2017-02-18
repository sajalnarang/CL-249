clear all;
clc;

P = [1 10 20 30 40 60 70 80 90 100];
V = [22.4 2.22 1.10 0.73 0.54 0.43 0.30 0.26 0.23 0.21];
n = length(P);

integrand = zeros(n,1);
integral = 0;
for i = 1:n
    integrand(i) = V(i) - 0.0821*273/P(i);
end

for i = 1:n-1
    integral = integral + (integrand(i) + integrand(i+1)) * (P(i+1) - P(i))/2;
end

disp(100*exp(integral/(0.0821*273)));
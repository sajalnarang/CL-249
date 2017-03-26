clear all;
clc;

c1 = 3.74 * 10^8;
c2 = 1.44 * 10^4;
lambdas = 0.001:0.001:100;
temps = [50 100 300 500 1000 2000];
n = length(lambdas);

E = zeros(n);
for temp = temps
    for i = 1:length(lambdas)
        lambda = lambdas(i);
        E(i) = c1/(lambda^5 * exp(c2/(lambda * temp)) - 1);
    end
    plot2d('ll',lambdas,E);
end

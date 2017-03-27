clear all;
clc;

c1 = 3.74 * 10^-16;
c2 = 1.44 * 10^-2;
lambdas = (0.1:0.1:100) * 10^-6;
temps = [50 100 300 500 1000 2000];
n = length(lambdas);

E = zeros(n);
for temp = temps
    for i = 1:length(lambdas)
        lambda = lambdas(i);
        E(i) = c1/(lambda^5 * (exp(c2/(lambda * temp)) - 1));
    end
    loglog(lambdas*10^6,E*10^-6);
    hold on;
    xlim([0 100]);
    ylim([10^-4 10^9]);
end

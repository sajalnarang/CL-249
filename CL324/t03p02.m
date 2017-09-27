clear all;
clc;

X = [0 0.1 0.2 0.4 0.6 0.7 0.8];
minusRa = [0.45 0.37 0.3 0.195 0.113 0.079 0.05];
V0 = 0.002;

plot(X,minusRa);
[P,S] = polyfit(X,minusRa,1);
slope = P(1);
CA0 = 
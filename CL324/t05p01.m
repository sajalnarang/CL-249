clear all;
clc;

% Part 1 : Calculation of k values
rT = [71 71.3 41.6 19.7 42 17.1 71.8 142 284 47 71.3 117 127 131 133 41.8]';
pT = [1 1 1 1 1 1 1 1 1 0.5 1 5 10 15 20 1]';
pH = [1 1 1 1 1 1 1 2 4 1 1 1 1 1 1 1]';
pB = [0 0 1 4 1 5 0 0 0 0 0 0 0 0 0 1]';

n = length(rT);
Y = rT;
X = ones(n,3);
X(:,1) = 1./pT./pH;
X(:,2) = pB./pT./pH;
X(:,3) = 1./pH;

beta = mvregress(X,Y);
k = 1 / beta(1);
kB = k * beta(2);
kT = k * beta(3);

% Part 2 : Calculation of weight of catalyst
FT0 = 50;
YT0 = 0.3;
YH0 = 0.45;
P0 = 40;
thetaT = YT0/YT0;
thetaH = YH0/YT0;
thetaB = 0;
vH = -1;
vT = -1;
vB = 1;
e = 0;
alpha = 9.8 * 10^-5;

f = @(w,X) [-k * YT0^2 * P0^2 * ((thetaH + vH * X(1)) / (1 + e * X(1))) * ((thetaT + vT * X(1)) / (1 + e * X(1))) * X(2)^2 / FT0 / (1 + kB * YT0 * P0 * ((thetaB + vB * X(1)) / (1 + e * X(1))) * X(2) + kT * YT0 * P0 * ((thetaT + vT * X(1)) / (1 + e * X(1))) * X(2))
            -alpha * (1 + e * X(1)) / 2 / X(2)];
        
for i = 1:1000000
    [w,Xa] = ode45(f, [0 i], [0 1]);
    [m1,n1] = size(Xa);
    if Xa(m1,2) <= 1/40
        break;
    end
end

wf = w(end);
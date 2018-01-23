clear all;
clc;

% Experimental Data
t = [0 7 10 15 20 30 45 60
     0 6 11 15 20 30 45 60
     0 5 10 15 20 30 45 60
     0 5 10 15 20 30 45 60];

Tt = [14.2 13.8 12.8 11.8 11.3 10 9.2 8.5
      15 14.8 13.7 12.1 11.2 11 10.2 8.8
      13.5 13.3 12.3 11.9 11.5 10.5 9.3 8.4
      14.4 13.9 13.8 13.7 13.4 13.1 12.7 12.3];
  
T = [86.78 69.4 81 61] + 273;

%Theoretical Data
rhoA = 1.049;
rhoB = 0.81;
MA = 60.05;
MB = 74.12;
R = 8.314;
delG0 = -8889;
delH0 = -3887;
T0 = 298;

% Calculations
K0 = exp(-delG0 / R / T0);
CA = Tt / 2;
CA0 = 100 * rhoA / MA / 0.25;
CB0 = 150 * rhoB / MB / 0.25;
X = (CA0 - CA)/CA0;
K = K0 * exp(delH0 / R * (1/T0 - 1./T));

% Function Calls
F1 = f1(X, CA0, CB0, K)';
F2 = f2(X, CA0, CB0, K)';

% Initialization
G1 = zeros(8,4);
G2 = zeros(6,4);
P1 = zeros(4,2);
P2 = zeros(4,2);
k1 = zeros(4,1);
k2 = zeros(4,1);
dXbydT = zeros(4,6);
hold on;

% Integral Analysis
for i = 1:4
    [P1(i,:),~] = polyfit(t(i,:)', F1(:,i), 1);
    G1(:,i) = polyval(P1(i,:),t(i,:)');
    plot(t(i,:)', F1(:,i), 'o', t(i,:)', G1(:,i));
    title(strcat('Integral Analysis for Bath ', num2str(i+1,'%d')));
    ylabel('f1(X)');
    xlabel('Time (in minutes)');
    legend('Data Points','Regression Model','Location','northwest')
    figure;
end
k1 = P1(:,1)';
k2 = k1./K;

% Central Difference Method
for j = 2:7
    dXbydT(:,j-1) = (X(:,j+1) - 2 * X(:,j) + X(:,j-1))./(t(:,j+1) - t(:,j-1));
end

% Differential Analysis
for i = 1:4
    [P2(i,:),~] = polyfit(F2(2:7,i), dXbydT(i,:)', 1);
    G2(:,i) = polyval(P2(i,:),F2(2:7,i));
    plot(F2(2:7,i), dXbydT(i,:)','o', F2(2:7,i), G2(:,i));
    title(strcat('Differential Analysis for Bath ', num2str(i+1,'%d')));
    ylabel('$\frac{dX}{dt}$','Interpreter','latex','fontsize',18);
    xlabel('f2(X)');
    legend('Data Points','Regression Model','Location','northwest')
    figure;
end

% Regression
Y1 = log(k1);
Y2 = log(k2);
X1 = 1./T;
[P3,~] = polyfit(X1,Y1,1);
[P4,~] = polyfit(X1,Y2,1);
G3 = polyval(P3,X1);
G4 = polyval(P4,X1);

% Plots
plot(X1,Y1,'o',X1,G3);
title('Determination of k_{1}^{0} and E_{a1}')
ylabel('ln(k_{1})')
xlabel('$\frac{1}{T}$','Interpreter','latex','fontsize',18)
legend('Data Points','Regression Model','Location','southwest')

figure;
plot(X1,Y2,'o',X1,G4);
title('Determination of k_{2}^{0} and E_{a2}')
ylabel('ln(k_{2})')
xlabel('$\frac{1}{T}$','Interpreter','latex','fontsize',18)
legend('Data Points','Regression Model','Location','southwest')

figure;
plot(t',X');
title('Dynamic Conversion Profile')
ylabel('X(t)')
xlabel('Time (in minutes)')
legend('Bath 2','Bath 3','Bath 4','Bath 5','Location','northwest')

% Results
K01 = exp(P3(2));
K02 = exp(P4(2));
Ea1 = -R * P3(1);
Ea2 = -R * P4(1);
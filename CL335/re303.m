clear all;
clc;

% Experimental Data
t = [0 1 2 3 6 9 12 15 18 21 24 27];
tC = [1 2 3 6 9 12 15 18 21 24];
A = [0.009 0.014 0.027 0.017 0.038 0.061 0.080 0.100 0.123 0.139 0.161 0.176];    %Without CTAB
AC = [0.101 0.118 0.155 0.190 0.243 0.275 0.280 0.297 0.323 0.394];   %With CTAB

% Theoretical Data
C0 = 0.1;               % Initial Concentration of HCl
DDEA = 6.625 * 10^-9;   % Diffusivity of DEA
DHCl = 2.5 * 10^-9;     % Diffusivity of HCl
Ar = 81.3 * 10^-4;      % Surface Area
V = 280 * 10^-6;        % Volume of Reacting Mixture
SDEA = 0.004;           % Solubility of DEA

% Calculations
Y = log(C0./(C0 - C(A)*50));
YC = log(C0./(C0 - C(AC)*50));

% Linear Regression
[P,~] = polyfit(t,Y,1);
[PC,~] = polyfit(tC,YC,1);
Yr = polyval(P,t);
YrC = polyval(PC,tC);

% Plot
plot(t,Y,'o',t,Yr,'-');
hold on;
plot(tC,YC,'o',tC,YrC,'-');
title('Determination of Enhancement Factor');
ylabel('log($\frac{[HCl]_{i}}{[HCl]}$)','Interpreter','latex','fontsize',16);
xlabel('Time (in minutes)')
legend('Experimental Data - Without CTAB','Regression Model - Without CTAB','Experimental Data - With CTAB','Regression Model - With CTAB','location','northwest');

% Results
q = (C0 - C(A)*50)/SDEA * (DHCl/DDEA)^1/2;
qC = (C0 - C(AC)*50)/SDEA * (DHCl/DDEA)^1/2;
KL = P(1) * V / Ar * (DHCl/DDEA)^1/2;
KLC = PC(1) * V / Ar * (DHCl/DDEA)^1/2;
E = KLC(1)/KL(1);
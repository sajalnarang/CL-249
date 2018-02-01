% Function to calculate Concentration of DEA-HCl given the Absorbance

function p = C(A)
    % Experimental Calibration Data
    Ac = [0.433 0.647 0.827 1.016];
    Cc = [0.002 0.003 0.004 0.005];

    % Linear Regression
    [P,~] = polyfit(Ac,Cc,1);
    p = P(1) * A + P(2);
end
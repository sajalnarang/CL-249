function p = u(x)
    p(1) = x(1)^3 - 3*x(1)^2 + x(1) - 5 + x(2);
    p(2) = x(2)^2 - 3*x(1) + exp(x(3));
    p(3) = x(1)^2 - sin(x(3)) + log(x(1));
return
function p = w(x)
    p(1) = x(1)*log(x(2)) + sin(x(3)) - 0.701353;
    p(2) = exp(x(2))*x(3) + 5*x(1) - 4.79744;
    p(3) = sin(x(1))*sin(x(2)) + cos(x(3)) + 0.274467;
return
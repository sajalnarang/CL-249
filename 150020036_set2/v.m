function p = v(x)
    p(1) = cos(x(1)) + cos(x(2)) + cos(x(3)) - 3/5;
    p(2) = cos(3*x(1)) + cos(3*x(2)) + cos(3*x(3));
    p(3) = cos(5*x(1)) + cos(5*x(2)) + cos(5*x(3));
return
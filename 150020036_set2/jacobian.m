function p = jacobian(x,h)
    n = length(x);
    jac = zeros(n,n);

    for i = 1:n
        h1 = zeros(1,n);
        h1(1,i) = h(i);
        x1 = x + h1;
        jac(:,i) = ((v(x1) - v(x))/sum(h1))';
    end
    p = jac;
return
function p = f1(X, CA0, CB0, K)
    a = CB0;
    b = CB0 + CA0 + 1./K;
    c = CA0;
    d = (b.^2 - 4 * a * c) .^ 1/2;
    N = zeros(4,8);
    D = zeros(4,1);
    p = zeros(4,8);
    for i = 1:4
        N(i,:) = (2 * c * X(i,:) + b(i) - d(i))./(2 * c * X(i,:) + b(i) + d(i));
        D(i) = (b(i) - d(i))/(b(i) + d(i));
        p(i,:) = 1/d(i) * log(N(i,:)./D(i));
    end
return
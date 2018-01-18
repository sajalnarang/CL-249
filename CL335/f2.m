function p = f2(X, CA0, CB0, K)
    p = zeros(4,8);
    for i = 1:4
        p(i,:) = (1 - X(i,:)) .* (CB0 - CA0 * X(i,:)) - 1 / K(i) * X(i,:);
    end
return
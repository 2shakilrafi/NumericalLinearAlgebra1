function [y] = forsub(L,b)

if size(L,1) ~= size(L,2)
    error('Input not a square matrix');
elseif prod(round(diag(L),5)) == 0
    error('Matrix is singular or very nearly singular');
else
    b(1) = b(1) / L(1,1);
    for i = 2 : size(L,1)
        b(i) = (b(i) - L(i,1:i-1) * b(1 : i - 1)) / L(i,i);
    end
    [y] = b;
end


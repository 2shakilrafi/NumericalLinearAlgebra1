function [A , u1] = housueqr(A)


[m,n] = size(A);
I = eye(n)
for j = 1:n
    [u1,beta] = house(A(j:m,j));
    A(j:m,j:n) = (eye(size(u1)) - beta * (u1 * u1'))*(A(j:m,j:n));
    if j < n
        A(j+1:m,j) = u1(2:m-j+1);
    end
end

end


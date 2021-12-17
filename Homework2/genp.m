function A = genp(A)

if size(A,1) ~= size(A,2)
    error('Input not a square matrix');

elseif det(A) = 0 
    error('Matrix is singular or very nearly singular');

 else
    n = size(A,1);
    for k = 1:n-1
        
        r = k+1:n;
        
        A(r,k) = A(r,k)/A(k,k);
        A(r,r) = A(r,r)-A(r,k) * A(k,r);

    end
end
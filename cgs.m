function [Q,R] = cgs(A)

%Program to calculate QR decomposition in classical Gram-Schmidt
%orthogonalization
%Input is an mxn matrix A
%Output is the Q,R factors concatenated

R(1,1) = norm(A(:,1));                      % We take the first entry in R as the norm of the first column in A   
Q(:,1) = A(:,1)/R(1,1);                     % The first column in Q is the first column of A divided (in the matrix sense) by the first entry in R
m = size(A,1);                              % set m to be the row length of A
n = size(A,2);                              % set n to be the column length of A

for k = 2:n                                 % loop from 2 to the number of columns of A
    R(1:k-1,k) = Q(1:m,1:k-1).' * A(1:m,k); % the super diagonal of R is the transpose of Q(1:m,1:k-1)^T times A(1:m,k)
    z = A(1:m,k)-Q(1:m,1:k-1) * R(1:k-1,k); % the matrix z is the A submatrix from the previos line minus the Q submatrix times the R submatrix calculated in the previous line
    R(k,k) = norm(z);                       % the k,k th entry in R is the norm of z from the previous line
    Q(1:m,k) = z / R(k,k);                  % the kth colums of Q is z divided by the k,kth entry in R
end

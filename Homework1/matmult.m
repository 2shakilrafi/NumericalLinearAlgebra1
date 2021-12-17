%====================================================================
%Shakil Rafi: Programming Assignment 1: 2.7.20

function C = matmult(A,B)

% function matmult
%
% Inputs: axb matrix A and bxc matrix B
%
% Outputs: C, the product of A and B
%
% Functions called: mdot.m (type >>help mdot)
%

if size(A,2) ~= size(B,1)                        % column size of A is compared to row size of B
    C = error('rows and columns incompatible');  % if there is a mismatch, an error message is shown 
else                                             % if not, we proceed with the multiplication
    C = zeros(size(A,1),size(B,2));              % the product matrix C is initialized to the zero matrix whose size is the outer dimensions of A and B  
    for i = 1:size(A,1)                          % index i is used for rows, we iterate across rows upto the row-size of A
        for j = 1: size(B,2)                     % within each row we use j to iterate across columns, upto the column-size of B
            C(i,j)=C(i,j)+mdot(A(i,:),B(:,j));   % the entry (i,j) of matrix C corresponds to row i of A dot product with column j of B, we call mdot to do the dot product operation
        end                                      %
    end                                          %
end                                              %

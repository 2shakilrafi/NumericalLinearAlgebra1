function [x] = backsub(U,y)

if size(U,1) ~= size(U,2)
    error('Input not a square matrix');
elseif prod(round(diag(U,5))) == 0
    error('Matrix is singular or very nearly singular');
else    
    y(size(U,1)) = y(size(U,1)) / U(size(U,1),size(U,1));
    for i = size(U,1) - 1 : - 1 : 1
        y(i) = (y(i) - U(i,i + 1 : size(U,1)) * b(i + 1 : size(U,1))) / U(i,i);
    end
    [x] = y;
end
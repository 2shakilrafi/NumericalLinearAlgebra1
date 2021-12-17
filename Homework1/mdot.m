function dotprd = mdot(X,Y)

% function mdot
% input: 1xn matrix X and nx1 matrix Y
%
% output: a scalar called dotprd that is the usual dot product of X and Y 
%

if size(X,2) ~= size(Y,1)                                  % size comparison between the columns of X and rows of Y
    dotprd = error('Matrices are not compatible');         % if there is a size mismath, and error message is shown 
else                                                       % if not, we proceed with computation
    dotprd = 0;                                            % we initialize dotprd to be zero
    for i=1:size(X,2)                                      % we iterate from 1 to the number of columns of X  
        dotprd = dotprd + X(1,i)*Y(i,1);                   % at each iteration of i we add to dotprd the product of cell 1,i of X and cell i,1 of Y
    end                                                    %
end                                                        %  
 

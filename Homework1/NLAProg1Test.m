%
% Put this file in yor Matlab work folder (the same place Matlab puts your
% m-files.  After you get your macheps.m and matmult.m working, go to the
% command window type (you don't type the   >>   it is the 'prompt').
%
% >> NLAProg1Test
% 
% If you are in the habit of using the 'Run' button in matlab (I think it is
% still a big green triangle), try to get out of the habit.  If you are new
% to Matlab, please just forget that button exists.  Instead, go into the
% command window and run your programs from there (as above).
%
% This will test your matmult routine.  myeps should be about 10^-16, and 
% err1,... ,err4 should be 0 or very close to zero (not be much larger
% than macheps).
%
% err5 tests your error checking for matrix sizes.
%

if exist('prog1run.txt','file'),
    delete('prog1run.txt')
	disp(' ')
	disp('deleting old prog1run file to make new one')
	disp(' ')
end
diary prog1run.txt


m = 17;  n = 3;  p = 5;  A = randn(m,n);  B = randn(n,p);  AB = A*B;
relerr1 = norm(AB - matmult(A,B),'fro')/norm(AB)

m = 17;  n = 1;  p = 3;  A = randn(m,n);  B = randn(n,p);  AB = A*B;
relerr2 = norm(AB - matmult(A,B),'fro')/norm(AB)

m = 1;  n = 4;  p = 1;  A = randn(m,n);  B = randn(n,p);  AB = A*B;
relerr3 = norm(AB - matmult(A,B),'fro')/norm(AB)

m = 13;  n = 1;  p = 11;  A = randn(m,n);  B = randn(n,p);  AB = A*B;
relerr4 = norm(AB - matmult(A,B),'fro')/norm(AB)

try,
    e5 = sum(sum(isnan(matmult(B',A)))),
catch ME,
	disp(ME.message),
end

diary off

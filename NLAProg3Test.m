%
% Test routine for program 3 assignment.  This routine generates random, but
% increasingly illconditions matrices and runs your cgs and mgs QR
% factorization routines.
%
% If your code is working:
% The cgs_resid and mgs_resid should be near machine epsilon.
% You should notice cgs_unitary growing like (machine epsilon)* cond^2(A).
% You should notice mgs_unitary growing like (machine epsilon)* cond(A).
%
% Q_diff and R_diff are printed to remind you that while in real arithmetic
% they should be zero (uniqueness), they are quite sensitive to rounding errors.


diary off
if exist('prog3run.txt','file')==2, delete('prog3run.txt'); end
  diary prog3run.txt
m = 50;  n = 30;
I = eye(n);
for j=1:4,

    A = ones(m,n) + 10^(-2*j)*randn(m,n);

    [Qm,Rm] = mgs(A);
    [Qc,Rc] = cgs(A);
    cA = cond(A);
    disp(' ')
    disp(['test ',int2str(j), '     eps*cond(A) = ',num2str(eps*cA), '     eps*cond^2(A) = ',num2str(eps*cA*cA)])
    disp(['cgs_resid: || A - QR || = ',num2str(norm(A-Qc*Rc))])
    disp(['mgs_resid: || A - QR || = ',num2str(norm(A-Qm*Rm))])
    disp(['cgs_unitary: || Q''Q - I || = ',num2str(norm(Qc'*Qc - I))])
    disp(['mgs_unitary: || Q''Q - I || = ',num2str(norm(Qm'*Qm - I))])
    disp(['R_diff: || Rc - Rm || = ',num2str(norm(Rm - Rc))])
    disp(['Q_diff: || Qc - Qm || = ',num2str(norm(Qm - Qc))])

end
diary off

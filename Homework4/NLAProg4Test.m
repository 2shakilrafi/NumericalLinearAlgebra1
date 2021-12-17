%This script will test your programs houseqr, houseqtact (and backsub)
%If you never got your backsub working, then replace the "x = " line with "alt"

diary off
if exist('prog4run.txt','file')==2, delete('prog4run.txt'); end
  diary prog4run.txt

%
%Prepare test example: random A with b=Ax+r, r orthogonal to ColSp(A)
m = 50;  n = 20;
A=2*rand(m,n)-1;  xtrue = 2*rand(n,1)-1;  nA = norm(A,2);
[q,r] = qr(A);
r = 2*rand(m,1)-1;  r = r - q*(q'*r);  r = r - q*(q'*r);
b = A*xtrue + r;

%
%Test your houseqr
[A,u1] = houseqr(A);
%mild test for qr:
disp('If houseqr is working, this should be close to macheps:'),
relnormchange = (nA - norm(triu(A(1:n,:))))/nA
disp(' ')

%solve LS (to test houseqtact):
bhat = houseqtact(A,u1,b);
x = backsub(triu(A(1:n,:)),bhat(1:n));  %alt:   x = triu(A(1:n,:))\bhat(1:n);
   
%
%strong test for qr/qtact/backsub:
%This should be around 1e-15 or less (because this is almost certainly very
%well-conditiond LS problem).
disp('If both houseqr and houseqtact are working, this also should be close to macheps:')
relerr = norm(x - xtrue)/norm(xtrue)

diary off

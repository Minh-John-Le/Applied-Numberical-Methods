function [J] = temp_jacobian(Ti,T0,TL,Tinf,sig,h,L)
n = length(Ti);
dx = L/(n+1);
dfdTdiag = @(T) -(2+dx^2*h) -4*dx^2*sig*T.^3; 
%diagonal
J_diag = dfdTdiag(Ti);
off_diag = ones(n,1);
J = spdiags(J_diag,0,n,n)+spdiags(off_diag,-1,n,n)+spdiags(off_diag,1,n,n);
%Alternate
%J = zeros(n,n);
%for d = 1:n;
%    J(d,d) = dfdTdiag(Ti(d));
%end
%for k = 2:n-1
%    J(k,k-1)=1;
%    J(k-1,k)=1;
%end


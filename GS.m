function [x, iter] = GS(A,b,xi,es,max_it)
%[x, iter] = GS(A,b,xi,es,max_it)
%
%Gauss-Seidel iteration to solve a linear system, Ax = b
%
%Inputs
%   A:  Coefficient matrix A
%   b:  Right hand side vector b 	
%   xi: column vector of initial guesses
%   es: optional stopping criterion, default is es = 1E-6
%   max_it: optional maximum iterations, default is max_it = 50
%
%Outputs
%   x:  solution vector
%   iter:   number of iterations required for convergence
if nargin < 3, error('Two few inputs, read help comments'), end
if nargin<4||isempty(es), es=1e-6;end
if nargin<5||isempty(max_it), max_it=50;end
[m,n] = size(A);  
if m~=n, error('Matrix A must be square'); end
C = A;
d = b./diag(A);
for i = 1:n  
  C(i,1:n) = A(i,1:n)/A(i,i);
  C(i,i) = 0;
end
ea = ones(n,1);
x = xi;
for iter = 1:max_it
    x_old = x;
    for i = 1:n
        x(i) = d(i)-C(i,:)*x;
    end
    if all(x ~= 0), ea = (x - x_old)./x; end
    if max(abs(ea)) <= es, break, end 
end



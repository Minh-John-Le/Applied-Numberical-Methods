function [x,res, ea,iter] = NRsys(f,J,xi,es,max_it,varargin)
%[x,res, ea,iter] = NRsys(f,J,xi,es,max_it,varargin)
%
%Newton-Raphson method for the solution of a nonlinear system of equations
%
%Inputs
%   f:      function that returns a column vector of function evaluations 
%           for a vector of x-values
%   J:      function that returns the Jacobian matrix for the system
%           evaluated for a column vector of x-values
%   xi:     Column vector of initial guessses
%   es:     optional stopping criterion, default is es = 1E-6
%   max_it: optional maximum iterations, default is max_it = 50
%   p1,p2,...   optional parameter inputs for function evaluation
%
%Outputs
%   x:      vector fo solution estimates
%   res:      vector of residual values
%   ea:     approximate relative error in solution
%   iter:   number of iterations required for convergence

if nargin < 3, error('Two few inputs, read help comments'), end
if nargin<4||isempty(es), es=1e-6;end
if nargin<5||isempty(max_it), max_it=50;end
  
x_old = xi; %initial guesses
for iter = 1:max_it
    dx = J(x_old,varargin{:})\(-f(x_old, varargin{:}));
    x_new = x_old + dx;
    if all(x_new ~= 0), ea = (dx)./x_new; end
    if max(abs(ea)) <= es, break, end  
    x_old = x_new;
end
x = x_new;
res = f(x,varargin{:});




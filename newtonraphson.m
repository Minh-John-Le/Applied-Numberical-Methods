function [xroot,ea,iter] = newtonraphson(fun,dfdx,xi,es,max_it,varargin)
%[xroot,es,iter] = newtonraphson(fun,dfdx,xi,es,max_it,p1,p2,...)
%
%Newton-Raphson Method for the solution of a roots problem
%
%Inputs
%   fun:    user defined function that defines the roots problem
%   dfdx:   derivative of input function 
%   xi:     initial guess
%   es:     optional stopping criterion, default is es = 1E-6
%   max_it: optional maximum iterations, default is max_it = 50
%   p1,p2,...   optional parameter inputs for function evaluation
%
%Outputs
%   xroot:  root estimate 
%   ea:     approximate relative error in root estimate
%   iter:   number of iterations required for convergence

if nargin < 3, error('Two few inputs, read help comments'), end
if nargin<4||isempty(es), es=1e-6;end
if nargin<5||isempty(max_it), max_it=50;end
  
xroot = xi; %initial guesses
for iter = 1:max_it
    xr_old = xroot;
    xroot = xr_old - fun(xr_old,varargin{:})/dfdx(xr_old,varargin{:});
    if xroot ~= 0, ea = (xroot-xr_old)/xroot; end
    if abs(ea) <= es, break, end 
end



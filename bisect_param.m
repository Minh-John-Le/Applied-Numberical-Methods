function [xroot,ea,iter] = bisect_param(fun,xl,xu,es,max_it,varargin)
%[xroot,ea,iter] = bisect_param(fun,xl,xu,es,max_it,p1,p2,...)
%
%Bisection Method for the solution of a roots problem
%
%Inputs
%   fun:    user defined function that defines the roots problem
%   xl:     lower bound of initial bracket
%   xu:     upper bound of initial bracket
%   es:     optional stopping criterion, default is es = 1E-6
%   max_it: optional maximum iterations, default is max_it = 50
%   p1,p2,...   optional parameter inputs for function evaluation
%
%Outputs
%   xroot:  root estimate 
%   ea:     approximate relative error in root estimate
%   iter:   number of iterations required for convergence

if nargin < 3, error('Two few inputs, read help comments'), end
test = fun(xl,varargin{:})*fun(xu,varargin{:});
if test >= 0, error('No sign change in initial bracket'), end
if nargin<4||isempty(es), es=1e-6;end
if nargin<5||isempty(max_it), max_it=50;end

ea = 1;
xroot = xl; %initial guesses
for iter = 1:max_it
    xr_old = xroot;
    xroot = (xl+xu)/2;
    if xroot ~= 0, ea = (xroot-xr_old)/xroot; end 
    test = fun(xl,varargin{:})*fun(xroot,varargin{:});
    if test < 0
        xu = xroot;
    elseif test > 0 
        xl = xroot;
    else
        ea = 0; %test = 0 means we hit the root exactly
    end
    if abs(ea) <= es, break, end 
end



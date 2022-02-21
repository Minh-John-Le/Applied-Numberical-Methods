function [xroot,ea,iter] = bisect_basic(fun,xl,xu)
%[xroot,ea,iter] = bisect_basic(fun,xl,xu)
%
%Bisection Method for the solution of a roots problem
%
%Inputs
%   fun:    user defined function that defines the roots problem
%   xl:     lower bound of initial bracket
%   xu:     upper bound of initial bracket
%
%Outputs
%   xroot:  root estimate 
%   ea:     approximate relative error in root estimate
%   iter:   number of iterations required for convergence

es = 1e-6; %stopping tolerance
xroot = xl; %initial guesses
for iter = 1:50
    xr_old = xroot;
    xroot = (xl+xu)/2;
    ea = (xroot-xr_old)/xroot; 
    test = fun(xl)*fun(xroot);
    if test < 0
        xu = xroot;
    elseif test > 0 
        xl = xroot;
    else
        ea = 0; %test = 0 means we hit the root exactly
    end
    if abs(ea) <= es, break, end
end



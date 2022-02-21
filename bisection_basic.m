%Bisection Method
%
%This script uses the bisection method to solve the roots problem:
%
%     exp(x) - 2 - x = 0
%
fun = @(x) exp(x)-2-x;
es = 1e-6; %stopping tolerance
xl = 0; xu = 2; xroot = xl; %initial guesses
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
%Display results
display('Bisection Converged at')
display(xroot)
display('Iterations')
display(iter)
display('Approx Relative Error')
display(ea)


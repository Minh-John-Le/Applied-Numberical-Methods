%This script uses the bisection method 
%to solve the roots problem:
%
%     exp(x) - 2 - x = 0
%
fun = @(x) exp(x)-2-x;
[xr,ea,iter] = bisect_basic(fun,0,2);
%Display results
display('Bisection Converged at')
display(xroot)
display('Iterations')
display(iter)
display('Approx Relative Error')
display(ea)


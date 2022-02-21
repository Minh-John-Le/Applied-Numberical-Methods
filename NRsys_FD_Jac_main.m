%Example Implementation of Newton-Raphson for a system of equations
%using finite difference derivative approximations
f = @(x) [sin(x(1))+x(2)^2+log(x(3))-7;3*x(1)+2^x(2)-x(3)^3+1;sum(x)-5];
xi = [10;10;10];
[x,res, ea,iter] = NRsys(f,@J_FD,xi,1e-8)



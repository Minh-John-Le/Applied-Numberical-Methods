%Example Implementation of Newton-Raphson for a system of equations
f = @(x) [x(1)^2+x(1)*x(2)-10;x(2)+3*x(1)*x(2)^2-57];
xi = [1; 1];
[x,res, ea,iter] = NRsys(f,@J_analytical,xi,1e-8,100)



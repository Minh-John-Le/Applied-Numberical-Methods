%This script uses the bisection method 
%to solve the roots problem:
%
%     exp(x) - 2 - x = 0
%
%and looks at how the stopping criterion effects the iteration count
fun = @(x) exp(x)-2-x;
es = 10.^(-3:-1:-8);
xr = ones(length(es), 1);
ea = xr;  iter = xr;
for ndx = 1:length(es)
    [xr(ndx),ea(ndx),iter(ndx)] = bisect_defaults(fun,0,2,es(ndx));
end
figure(1)
semilogx(es,iter,'bo--')
axis([10^-10 10^-2 0 30])
xlabel('Stopping Criterion \epsilon_s')
ylabel('Iteration Count')
title('Convergence Behavior of Bisection Method')
text(10^-8,10,'Roots problem: e^x - 2 - x = 0')



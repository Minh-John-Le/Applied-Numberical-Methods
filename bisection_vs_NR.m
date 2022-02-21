%This script compares the convergence behavior of bisection 
%and newton raphson for the roots problem:
%
%     exp(x) - 2 - x = 0
%
fun = @(x) exp(x)-2-x;
dfdx = @(x) exp(x)-1;
es = 10.^(-3:-1:-8);
xrb = ones(length(es), 1);
eab = xrb;  iterb = xrb;
xrn = xrb; ean = xrb; itern = iterb;
for ndx = 1:length(es)
    [xrb(ndx),eab(ndx),iterb(ndx)] = bisect_defaults(fun,0,2,es(ndx));
    [xrn(ndx),ean(ndx),itern(ndx)] = newtonraphson(fun,dfdx,2,es(ndx));
end
figure(1)
semilogx(es,iterb,'bo--',es,itern,'rp--')
axis([10^-10 10^-2 0 30])
legend('Bisection','Newton-Raphson')
xlabel('Stopping Criterion \epsilon_s')
ylabel('Iteration Count')
title('Convergence Behavior of Bisection and Newton Raphson')
text(10^-8,10,'Roots problem: e^x - 2 - x = 0')


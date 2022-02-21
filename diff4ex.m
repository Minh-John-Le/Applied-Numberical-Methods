function dfdx = diff4ex(f,x)
%dfdx = diff4ex(f,x)
%Calculates first derivative of vector f with respect to x using a fourth
%order accurate centered difference approximation.
h = x(2)-x(1);
n = length(x);
dfdx = ones(n,1);
%2nd order forward difference for first two values
dfdx(1) = (-f(3)+4*f(2)-3*f(1))/(2*h);
dfdx(2) = (-f(4)+4*f(3)-3*f(2))/(2*h);
for k = 3:n-2;
    %4th order centered difference
    dfdx(k) = (-f(k+2)+8*f(k+1)-8*f(k-1)+f(k-2))/(12*h);
end
%2nd order backward difference for last two values
dfdx(n-1) = (3*f(n-1)-4*f(n-2)+f(n-3))/(2*h);
dfdx(n) = (3*f(n)-4*f(n-1)+f(n-2))/(2*h);



function [f] = temp_function(Ti,T0,TL,Tinf,sig,h,L)
n = length(Ti);
dx = L/(n+1);
C = h*Tinf+sig*Tinf^4;
f1 = @(T1,T2) -(2+dx^2*h)*T1 - dx^2*sig*T1.^4 + T2 + dx^2*C + T0;
fint = @(T1,T2,T3) T1 - (2+dx^2*h)*T2 - dx^2*sig*T2.^4 + T3 + dx^2*C;
fn = @(Tnm1,Tn) Tnm1 - (2+dx^2*h)*Tn - dx^2*sig*Tn.^4 + dx^2*C + TL;
f = zeros(n,1);
f(1) = f1(Ti(1),Ti(2));
for k = 2:n-1
    f(k) = fint(Ti(k-1),Ti(k),Ti(k+1));
end
f(n) = fn(Ti(n-1),Ti(n));


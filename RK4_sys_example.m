%System of ODEs example
tspan = [0 4];
h = 0.1; 
y0 = [1 0];
yprime = @(t,y) [y(2);-9*y(1)];
[t_E, y_sys] = eulersys(yprime,tspan,y0,h);
y_E = y_sys(:,1);
[t_H, y_sys] = heunsys(yprime,tspan,y0,h);
y_H = y_sys(:,1);
[t_RK, y_sys] = odeRK4sys(yprime,tspan,y0,h);
y_RK = y_sys(:,1);
t_exact = linspace(tspan(1),tspan(2));
y_exact = @(t) cos(3*t);
figure(1)
%subplot(211)
plot(t_E,y_E,'rd',t_H,y_H,'bo',t_RK,y_RK,'gp',t_exact, y_exact(t_exact),'k')
legend('Euler','Heun','4^{th} Order R-K','Exact')
xlabel('t')
ylabel('y')
title('Solution to y"+9y=0 with h = 0.1')
grid
Error_RK = y_exact(t_RK)-y_RK;
Error_Heun = y_exact(t_H)-y_H;
%subplot(212)
%plot(t_RK,Error_RK,'g')
%grid
%title('True Error in RK4 Solutions')
%xlabel('t')
%ylabel('E_T')



%System of ODEs example
tspan = [0 4];
h1 = 0.1; h2 = 0.01;
y0 = [1 0];
yprime = @(t,y) [y(2);-9*y(1)];
[t_eul1, y_sys] = eulersys(yprime,tspan,y0,h1);
y_num1 = y_sys(:,1);
[t_eul2, y_sys] = eulersys(yprime,tspan,y0,h2);
y_num2 = y_sys(:,1);
t_exact = linspace(tspan(1),tspan(2));
y_exact = @(t) cos(3*t);
figure(1)
plot(t_eul1,y_num1,'rd',t_eul2,y_num2,'b--',t_exact, y_exact(t_exact),'k')
legend('Euler, h = 0.1','Euler, h = 0.01','Analytical Solution')
xlabel('t')
ylabel('y')
title('Solution to y"+9y=0')
grid


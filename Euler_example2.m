%Euler's method example
dydt = @(t,y) (1+2*t).*sqrt(y);
y0 = 1;
time_span = [0 2];
h = [0.5 0.25 0.1 0.01];
figure(1)
hold on
[t1,y1] = euler(dydt,time_span,y0,h(1));
plot(t1,y1,'b-p')
[t2,y2] = euler(dydt,time_span,y0,h(2));
plot(t2,y2,'r--o')
[t3,y3] = euler(dydt,time_span,y0,h(3));
plot(t3,y3,'m-d')
[t4,y4] = euler(dydt,time_span,y0,h(4));
plot(t4,y4,'g--')
%analytical solution
tplot = linspace(0,2);
y_exact = (0.5*tplot.*(1+tplot)+1).^2;
plot(tplot,y_exact,'k-')
hold off
legend('h = 0.5','h = 0.25','h = 0.1','h = 0.01','exact')
xlabel('t')
ylabel('y')
title('Euler Method Solutions with Various Step Sizes')


%MATLAB solution for stiff systems 
[ta,ya] = ode45(@vanderpol_mu,[0 20],[1 1],[],1);
figure(1)
subplot(311)
plot(ta, ya(:,1),'b-',ta,ya(:,2),'r--')
xlabel('t')
legend('y','dy/dt')
title('\mu = 1')
%[tb,yb] = ode45(@vanderpol_mu,[0 6000],[1 1],[],1000);
[tb,yb] = ode23s(@vanderpol_mu,[0 6000],[1 1],[],1000);
subplot(312)
plot(tb, yb(:,1),'b-')
xlabel('t')
ylabel('y')
title('\mu = 1000')
subplot(313)
plot(tb, yb(:,2),'r--')
xlabel('t')
ylabel('dy/dt')



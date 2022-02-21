%Shooting Method for nonlinear ODE
L = 10;
T0 = 300;
ICguess_on_target = fzero(@(x) bar_res(x),-50);
[x,y] = ode45(@bar_temp,[0 L],[T0 ICguess_on_target]);
plot(x,y(:,1));
xlabel('x')
ylabel('T')
title('Temperature Distribution in a Heated Rod')


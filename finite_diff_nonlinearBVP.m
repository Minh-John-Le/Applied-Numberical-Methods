%Finite difference for nonlinear ode using Newton-Raphson
L = 10;
h_const = 0.05;
sigma = 2.7e-9;
T_inf = 200;
%set up nodes
n = 21;
x = linspace(0,L,n);
%BCs
T0 = 300;
TL = 400;
%initial guesses (assume linear distribution)
Ti = linspace(T0,TL,n);
%internal nodes
Tint = Ti(2:end-1)';
T = NRsys(@temp_function,@temp_jacobian,Tint,[],[],T0,TL,T_inf,sigma,h_const,L);
T = [T0; T;TL];
figure(1)
plot(x,T,'rp--')

hold on
tic
ICguess = fzero(@(x) bar_res(x),-50);
[x,y] = ode45(@bar_temp,[0 L],[T0 ICguess]);
toc
plot(x,y(:,1));
xlabel('x')
ylabel('T')
legend('Finite Difference','Shooting Method')
hold off
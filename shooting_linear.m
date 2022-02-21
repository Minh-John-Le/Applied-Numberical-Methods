%Shooting Method example for linear BVP
E = 200 * 10^9; %Pa
I = 30000 * (1/100)^4; %m4
w = 15000; %N/m
L = 3; %m
yp = @(x,y) [y(2);1/(E*I)*((w*L*x/2)-(w*x^2)/2)];
y0 = 0; yL = 0;
ICguesses = [0 -1];
[x1,y1] = ode45(yp,[0 L],[y0 ICguesses(1)]);
shot1 = y1(end,1);
[x2,y2] = ode45(yp,[0 L],[y0 ICguesses(2)]);
shot2 = y2(end,1);
shots = [shot1 shot2];
newIC = interp1(shots,ICguesses,yL,'linear','extrap');
[x3,y3] = ode45(yp,[0 L],[y0 newIC]);
%Analytical solution
xx = linspace(0,L);
y_analytical = w/(24*E*I)*(2*L*xx.^3-xx.^4-L^3*xx);
figure (1)
plot(xx,y_analytical,'b-',x3,y3(:,1),'ro')
xlabel('x(m)')
ylabel('y(m)')
legend('Analytical Solution','Shooting Method')
title('Beam Deflection')


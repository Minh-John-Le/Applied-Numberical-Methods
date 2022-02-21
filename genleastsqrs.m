%General Linear Least-Squares with Left Division
R = 82.05; %mL atm/gmol K
T = 303; %K
P = [0.985 1.108 1.363 1.631]; %atm
V = [25000 22200 18000 15000]; %mL
y = P.*V/(R*T)-1;

%Basis functions
Z0 = @(x) 1./x;
Z1 = @(x) 1./x.^2;
Z = [Z0(V)',Z1(V)'];

%Solve for coefficients
A = Z\y'
A1=A(1);A2=A(2);
P_model=@(V) R.*T./V.*(1+A1./V+A2./V.^2);
figure(1)
plot(V,P,'rd')
hold on
Vplot = linspace(min(V),max(V),100);
yplot = A(1)*Z0(Vplot)+A(2)*Z1(Vplot);
Pplot = (yplot+1)*R*T./Vplot;
plot(Vplot,Pplot,'b-')
legend('data','model')
hold off
St = sum((P-mean(P)).^2);
Sr = sum((P-P_model(V)).^2);
r2 = 1-Sr/St;
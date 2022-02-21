%This analysis explores the sensitivity of the contaminant decay model to 
%the decay rate of contaminant B.  The model is defined by 
%
%  p(t) = A0*exp(-kA*t) + B0*exp(-kB*t)
%
%Variable definitions
%   p = total contaminant concentration in ppm
%   t = time in days
%   A0 = initial concentration of contaminant A in ppm
%   B0 = initial concentration of contaminant B in ppm
%   kA = decay rate of contaminant A in d^-1
%   kB = decay rate of contanimant B in d^-1

A0 = 200;
B0 = 100;
kA = 1;
kB = [0.5 1 2 5];
t = linspace(0,6);
%first case
p1 = A0*exp(-kA*t) + B0*exp(-kB(1)*t);
%second case
p2 = A0*exp(-kA*t) + B0*exp(-kB(2)*t);
%third case
p3 = A0*exp(-kA*t) + B0*exp(-kB(3)*t);
%fourth case
p4 = A0*exp(-kA*t) + B0*exp(-kB(4)*t);

%Generate graph
figure(1)
plot(t,p1,t,p2,t,p3,t,p4)
hold on
title('Sensitivity of the Model to k_B when k_A = 1d^{-1}')
xlabel('Time (days)')
ylabel('Total Contaminant Concentration (ppm)')
legend('k_B = 0.5','k_B = 1.0','k_B = 2.0','k_B = 5.0')
%add dashed line to plot for 10 ppm standard
plot(t,10*ones(1,length(t)),'k--')
text(0.5,15,'10ppm Standard')
text(3,150,'p(t) = A_0*exp(-k_At) + B_0*exp(-k_Bt)')
hold off


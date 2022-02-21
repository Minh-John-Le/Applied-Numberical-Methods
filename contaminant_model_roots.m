%This script applies the bisection method to solve for the root of the contaminant model problem. 
%
%  A0*exp(-kA*t) + B0*exp(-kB*t) - p_standard = 0
%
%Variable definitions
%   p_standard = contaminant concentration standard in ppm
%   t = time in days it takes to meet the standard
%   A0 = initial concentration of contaminant A in ppm
%   B0 = initial concentration of contaminant B in ppm
%   kA = decay rate of contaminant A in d^-1
%   kB = decay rate of contanimant B in d^-1
A0 = 200; B0 = 100; kA = 1.0;kB = 0.5;
p_standard = 10; 
t = linspace(0,10);
%plot roots problem formulation
f = A0*exp(-kA*t) + B0*exp(-kB*t)-p_standard;
figure(1)
plot(t,f)
title('Contaminant Model Roots Problem: k_B = 0.5d^{-1}')
xlabel('Time (days)'), ylabel('Total Contaminant Concentration (ppm)')
grid on
%Define anonymous function for bisection method
fun = @(t) A0*exp(-kA*t) + B0*exp(-kB*t)-p_standard;
xl = 4; xu = 6; %initial guesses
[t_standard,ea,iter] = bisect_basic(fun,xl,xu);
%Display results
display('Bisection Converged at')
display(t_standard)
display('Iterations')
display(iter)
display('Approx Relative Error')
display(ea)



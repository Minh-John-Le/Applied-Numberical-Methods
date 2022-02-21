%This script applies the bisection method to solve for the root of the 
%contaminant model problem. 
%
%  A0*exp(-kA*t) + B0*exp(-kB*t) - p_standard = 0
%
%And generate a plot of the time it takes to reach the standard as a
%function of kB
%
%Variable definitions
%   p_standard = contaminant concentration standard in ppm
%   t = time in days it takes to meet the standard
%   A0 = initial concentration of contaminant A in ppm
%   B0 = initial concentration of contaminant B in ppm
%   kA = decay rate of contaminant A in d^-1
%   kB = decay rate of contanimant B in d^-1
A0 = 200; B0 = 100; p_standard = 10;
kB = linspace(0.5,4);
fun = @(t,kA,kB) A0*exp(-kA*t) + B0*exp(-kB*t)-p_standard;
%preallocate vectors for solutions
t_standard = ones(length(kB),1);
iter = ones(length(kB),1);
ea = ones(length(kB),1);
options = optimset('TolX',1e-6);
for ndx = 1:length(kB) 
    %Call fzero with parameterized function
    [t_standard(ndx)]=fzero(@(x) fun(x,1.0,kB(ndx)),[1 20],options);
end
%Plot result
figure(2)
plot(kB, t_standard)
title('Sensitivity of "Time to Standard" to k_B')
xlabel('Decay Rate of Species B, k_B (d^{-1})')
ylabel('Time to Reach Standard (days)')
grid on  


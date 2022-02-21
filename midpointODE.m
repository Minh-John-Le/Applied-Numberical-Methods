function [t,y] = midpointODE(dydt,tspan,y0,h,varargin)
% [t,y] = Midpoint(dydt,tspan,y0,h,p1,p2,...):
%           uses Midpoint method to integrate an ODE
% inputs
%   dydt = name of the funciton that evaluates the ODE 
%   tspan = [ti, tf] where ti and tf = initial and
%           final values of independent variable
%   y0 = initial value of dependent variable
%   h = step size
%   p1,p2,... = additional parameters used by dydt
% outputs
%   t = vector of independent variable
%   y = vector of solution for dependent variable

if nargin<4,error('at least 4 input arguments required'),end
ti = tspan(1);tf = tspan(2);
if ~(tf>ti),error('upper limit must be greater than lower'),end
t = (ti:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf  
  t(n+1) = tf;
  n = n+1;
end
y = y0*ones(n,1); 
for i = 1:n-1  
    %predict midpoint value
    y_mid = y(i) + dydt(t(i),y(i),varargin{:})*h/2;
    %use predicted midpoint to calculate slope for next time step
    y(i+1) = y(i) + dydt(t(i)+h/2,y_mid,varargin{:})*h;
end


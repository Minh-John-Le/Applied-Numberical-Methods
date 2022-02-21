function [t,y] = eulersys(dydt,tspan,y0,h,varargin)
% Euler method for a system of ODEs 
%   [t,y] = eulersys(dydt,tspan,y0,h,p1,p2,...):
%           
% inputs
%   dydt =  name of function that defines ODE system (dydt = f(t,y)).  
%           Returns a column vector of derivative values. 
%   tspan = [t0, tf] initial and final values of independent variable
%   y0 = row vector of initial values of solution
%   h = step size
%   p1,p2,... = additional parameters used by dydt
% 
% outputs
%   t = vector of independent variable
%   y = matrix of solutions for y_i(t).  Each column has one y solution.

if nargin<4,error('at least 4 input arguments required'),end
t0 = tspan(1);tf = tspan(2);
t = (t0:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
n_eqn = length(y0);
if t(n)<tf  
  t(n+1) = tf;
  n = n+1;
end
%initial conditions
y = ones(n,n_eqn); 
y(1,:)=y0;
for i = 1:n-1  
    dydt_i = dydt(t(i),y(i,:),varargin{:});
    y(i+1,:) = y(i,:) + dydt_i'*h;
end



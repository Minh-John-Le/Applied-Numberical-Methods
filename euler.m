function [t,y] = euler(dydt,tspan,y0,h,varargin)
% Euler method for ODEs 
%   [t,y] = euler(dydt,tspan,y0,h,p1,p2,...):
%           
% inputs
%   dydt = name of function that defines ODE (dydt = f(t,y)) 
%   tspan = [t0, tf] initial and final values of independent variable
%   y0 = initial value of dependent variable
%   h = step size
%   p1,p2,... = additional parameters used by dydt
% 
% outputs
%   t = vector of independent variable
%   y = vector of solution for y(t)

if nargin<4,error('at least 4 input arguments required'),end
t0 = tspan(1);tf = tspan(2);
t = (t0:h:tf)'; n = length(t);
if t(n)<tf  %add one more t value if h increments don't end at tf 
  t(n+1) = tf;
  n = n+1;
end
y = y0*ones(n,1); 
for i = 1:n-1  
      
    y(i+1) = y(i) + dydt(t(i),y(i),varargin{:})*h;

end


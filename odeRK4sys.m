function [t,y] = odeRK4sys(dydt,tspan,y0,h,varargin)
% fourth-order Runge-Kutta for a system of ODEs
%   [t,y] = oderk4sys(dydt,tspan,y0,h,p1,p2,...): integrates a
%                  system of ODEs with classical fourth-order Runge-Kutta
% inputs
%   dydt = name of the function that evaluates the ODEs 
%   tspan = [ti, tf]; initial and final times with output
%                     generated at interval of h, or
%   y0 = initial values of dependent variables (row vector)
%   h = step size
%   p1,p2,... = additional parameters used by dydt
% outputs
%
%   t = vector of independent variable
%   y = vector of solution for dependent variables

if nargin<4,error('at least 4 input arguments required'),end
t0 = tspan(1);tf = tspan(2);
t = (t0:h:tf)'; n = length(t);
% if necessary, add an additional value of t
% so that range goes from t = ti to tf
if t(n)<tf  
  t(n+1) = tf;
  n = n+1;
end
%initial conditions
n_eqn = length(y0);
y = ones(n,n_eqn); 
y(1,:) = y0;
for i = 1:n-1
    k1 = dydt(t(i),y(i,:),varargin{:})';   
    ymid2 = y(i,:) + k1*h/2;
    k2 = dydt(t(i)+h/2,ymid2,varargin{:})';   
    ymid3 = y(i,:) + k2*h/2;
    k3 = dydt(t(i)+h/2,ymid3,varargin{:})';   
    yend = y(i,:) + k3*h;
    k4 = dydt(t(i)+h,yend,varargin{:})';   
    phi = (k1+2*k2+2*k3+k4)/6;
    y(i+1,:) = y(i,:) + phi*h;
end
  


function [t,y] = odeABM2sys(dydt,tspan,y0,h,es,varargin)
% 2nd Order Adams-Bashforth-Moulton with corrector iteration for a system of ODEs 
%   [t,y] = odeAB2(dydt,tspan,y0,h,p1,p2,...):
%           
% inputs
%   dydt =  name of function that defines ODE system (dydt = f(t,y)).  
%           Returns a column vector of derivative values. 
%   tspan = [t0, tf] initial and final values of independent variable
%   y0 = row vector of initial values of solution
%   h = step size
%   es = stopping criterion for corrector iteration
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
if t(n)<tf  
  t(n+1) = tf;
  n = n+1;
end
%initial conditions
n_eqn = length(y0);
y = ones(n,n_eqn); 
y(1,:)=y0;
%start integration with Heun 
dydt_p = dydt(t(1),y(1,:),varargin{:})';
yp = y(1,:) + dydt_p*h;
dydt_c = dydt(t(2),yp,varargin{:})'; 
y(2,:) = y(1,:) + (dydt_p+dydt_c)/2*h;
for i = 2:n-1  
    %predictor AB-2
    dydt_im1 = dydt(t(i-1),y(i-1,:),varargin{:})';
    dydt_i = dydt(t(i),y(i,:),varargin{:})';
    ypre = y(i,:) + h/2*(3*dydt_i-dydt_im1);
    %corrector iteration with AM-2
    ea = ones(1,n_eqn);
    while max(abs(ea)) > es
        dydt_ip1 = dydt(t(i+1),ypre,varargin{:})';  
        yc_new = y(i,:) + h/2*(dydt_ip1+dydt_i);
        ea = (yc_new-yp)./yc_new;
        yp = yc_new;
    end
    y(i+1,:) = yc_new; 
end



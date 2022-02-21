function nperiods = waveplot(trigfun,time,varargin)
%function nperiods = waveplot(trigfun,time,varargin)
%
%Plots the input trig function over the input time vector and counts the 
%number of periods that are plotted.
%
% trigfun can be f(t,w), f(t,w,A), f(t,w,phi) or f(t,w,A,phi) where
%   t = time
%   w = frequency in rad/s
%   A = amplitude
%   phi = phase angle
%   A and phi can be defined in any order in the argument list of trigfun
%     
%
if nargin < 3
    error('Input function must include the frequency as the second argument.')
end

freq = varargin{1};
period = 2*pi/freq;
nperiods = (time(end)-time(1))/period;
plot(time,trigfun(time,varargin{:}))
xlabel('t[sec]')
ylabel('f(t)')
title('Wave Plot')

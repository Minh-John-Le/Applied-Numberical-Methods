%Numerical Integration of Data Example
t = [1 2 3.25 4.5 6 7 8 8.5 9.3 10];
v = [5 6 5.5 7 8.5 8 6 7 7 5];
%using composite trapezoid rule directly on data
s = cumtrapz(t,v);

%curve fit of cubic to integrate analytically
v_coeff = polyfit(t,v,3);
s_coeff = v_coeff./(4:-1:1); %integrate the polynomial
s_coeff = [s_coeff, -polyval([s_coeff,0],1)];

%spline fit to integrate interpolated data
tt = min(t):0.1:max(t);
v_spline = spline(t,v,tt);
s_spline = cumtrapz(tt,v_spline);

tplot = linspace(t(1), t(end));
figure(1)
subplot(211)
plot(t,v,'bp',tplot,polyval(v_coeff,tplot),'g-',tt,v_spline,'r--');
xlabel('time'); ylabel('velocity')
axis([min(t), max(t), 0, max(v)+1])
legend('data','cubic curve fit','spline')
subplot(212)
plot(t,s,'bp',tplot,polyval(s_coeff,tplot),'g-',tt,s_spline,'r--');
xlabel('time'); ylabel('position')
axis([min(t), max(t), 0, max(s)+10])
legend('integrated data','integrated cubic curve fit','integrated spline')


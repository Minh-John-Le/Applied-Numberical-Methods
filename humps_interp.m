x = (0:0.1:1);
fx = humps(x);
xx = (0:.01:1);
%Piecewise Linear
yy_lin = interp1(x,fx,xx,'linear');
%10th Degree polynomial
yy_poly_coeff = polyfit(x,fx,10);
yy_poly_values = polyval(yy_poly_coeff,xx);
%Splines
yy_spline_nk = interp1(x,fx,xx,'spline'); %not-a-knot
fx_clamp = [0, fx, 0];
yy_spline_clamped = spline(x,fx_clamp,xx);
figure(1)
hold on
plot(x,fx,'bp')
plot(xx,yy_lin,'k:')
plot(xx,yy_poly_values,'r:')
plot(xx,yy_spline_nk,'g--')
plot(xx,yy_spline_clamped,'c-.')
plot(xx,humps(xx),'m-')
xlabel('x')
ylabel('f(x)')
title('Interpolation Example using Humps Function')
legend('Data','Piecewise Linear','10^{th} Order Polynomial','Spline (not-a-knot)','Spline (clamped)','Humps')
hold off


function dTdx = bar_temp(x,y)
h_const = 0.05;
sigma = 2.7e-9;
T_inf = 200;
dTdx = [y(2);-h_const*(T_inf-y(1))-sigma*(T_inf^4-y(1)^4)];


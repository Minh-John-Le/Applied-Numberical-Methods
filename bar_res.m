function r = bar_res(IC_guess)
T0 = 300; 
TL = 400;
L = 10;
[x,y] = ode45(@bar_temp,[0 L],[T0 IC_guess]); 
r = y(end,1)-TL;



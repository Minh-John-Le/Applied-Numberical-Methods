function [J] = J_FD(xi)
f1 = @(x,y,z) sin(x)+y^2+log(z)-7;
f2 = @(x,y,z) 3*x+2^y-z^3+1;
f3 = @(x,y,z) x+y+z-5;
%Finite difference approximation for J
del = 1e-6;
df1dx1 = (f1(xi(1)+del*xi(1),xi(2),xi(3))-f1(xi(1),xi(2),xi(3)))/(del*xi(1));
df1dx2 = (f1(xi(1),xi(2)+del*xi(2),xi(3))-f1(xi(1),xi(2),xi(3)))/(del*xi(2));
df1dx3 = (f1(xi(1),xi(2),xi(3)+del*xi(3))-f1(xi(1),xi(2),xi(3)))/(del*xi(3));
df2dx1 = (f2(xi(1)+del*xi(1),xi(2),xi(3))-f2(xi(1),xi(2),xi(3)))/(del*xi(1));
df2dx2 = (f2(xi(1),xi(2)+del*xi(2),xi(3))-f2(xi(1),xi(2),xi(3)))/(del*xi(2));
df2dx3 = (f2(xi(1),xi(2),xi(3)+del*xi(3))-f2(xi(1),xi(2),xi(3)))/(del*xi(3));
df3dx1 = (f3(xi(1)+del*xi(1),xi(2),xi(3))-f3(xi(1),xi(2),xi(3)))/(del*xi(1));
df3dx2 = (f3(xi(1),xi(2)+del*xi(2),xi(3))-f3(xi(1),xi(2),xi(3)))/(del*xi(2));
df3dx3 = (f3(xi(1),xi(2),xi(3)+del*xi(3))-f3(xi(1),xi(2),xi(3)))/(del*xi(3));
%put results in matrix form
J=[df1dx1 df1dx2 df1dx3;df2dx1 df2dx2 df2dx3;df3dx1 df3dx2 df3dx3];



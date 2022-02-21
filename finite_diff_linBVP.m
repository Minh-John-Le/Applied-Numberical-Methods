%Example finite difference solution for liner BVP
%Parameters
E = 200 * 10^9; %Pa
I = 30000 * (1/100)^4; %m4
w = 15000; %N/m
L = 3; %m
%Boundary conditions
y1 = 0; yn = 0;
%Solution nodes
n = 7; %number of nodes
x = linspace(0,L,n)';
dx = x(2)-x(1);
x_int = x(2:end-1);
%set up coefficient matrix
n_mat = n-2;
diag_vals = [1*ones(n_mat,1) -2*ones(n_mat,1) 1*ones(n_mat,1)];
A = spdiags(diag_vals, -1:1, n_mat, n_mat);
RHS = w*dx^2/(2*E*I)*(L*x_int-x_int.^2);
y_int = A\RHS;
y = [y1; y_int; yn];
%figure
plot(x,y,'gd')

%Alternative for setting up matrix
%A = zeros(n_mat,n_mat);
%diagonal
%for ndx = 1:n_mat
%    A(ndx,ndx) = -2;
%end
%off diagonals
%for ndx = 1:n_mat-1  %step through n-2 internal rows
%    A(ndx,ndx+1) = 1;
%    A(ndx+1,ndx) = 1;
%end
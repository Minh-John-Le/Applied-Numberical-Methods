function [ J ] = J_analytical( x )
%Calculates the Jacobian fo the 2x2 Newton-Raphson example
J = ones(2,2);
J(1,1) = 2*x(1)+x(2);
J(1,2) = x(1);
J(2,1) = 3*x(2)^2;
J(2,2) = 1+6*x(1)*x(2);
end


function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
temp = ones(length(theta),1);
temp(1) = 0;

J = sum(-y.*log(sigmoid(X*theta))-(1-y).*log(1-sigmoid(X*theta)))/m + ...
    sum(theta.^2.*temp ) * lambda/(2*m);

grad = sum((sigmoid(X*theta) - y).*X)' /m + theta.*temp .* lambda/m;
% seem that i didn't understand how to cal grad, the dimension somehow not
% correct 
% here's other people's code which extinguished the sum using matrix multiplication
% grad = ( X' * (sigmoid(X*theta) - y ) )/ m + lambda/m * theta.*temp ;


% =============================================================

end

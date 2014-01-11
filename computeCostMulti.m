function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = size(X,1); % number of training examples

% You need to return the following variables correctly 
J = 0;

%disp("X in CostFunction");
%disp(size(X));

%disp("y in CostFunction");
%disp(size(y));

%disp("theta in costFunction");
%disp(size(theta));
% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

H = X * theta;

difference = H - y;

sqDiff = difference .^ 2;
sumColumn = sum(sqDiff,2);
sumColumn = sqrt(sumColumn);


J = sum(sumColumn)/(m);



% =========================================================================

end


%% Initialization

%% ================ Part 1: Feature Normalization ================

%% Clear and Close Figures
clear ; close all; clc

fprintf('Loading data ...\n');

%% Load Data
[X,y] = imgProcess(12000,53);
m = length(y);
disp("X and y");
disp(size(X));
disp(size(y));

y(:,1:1) = [];

% Print out some data points
fprintf('First 10 examples from the dataset: \n');
fprintf('  y = %.0f \n', [ y(1:10,1:1)]');

fprintf('Program paused. Press enter to continue.\n');
pause;

% Scale features and set them to zero mean
fprintf('Normalizing Features ...\n');

[X mu sigma] = featureNormalize(X);

% Add intercept term to X
X = [ones(size(X,1), 1) X];


%% ================ Part 2: Gradient Descent ================

% ====================== YOUR CODE HERE ======================
% Instructions: We have provided you with the following starter
%               code that runs gradient descent with a particular
%               learning rate (alpha). 
%
%               Your task is to first make sure that your functions - 
%               computeCost and gradientDescent already work with 
%               this starter code and support multiple variables.
%
%               After that, try running gradient descent with 
%               different values of alpha and see which one gives
%               you the best result.
%
%
% Hint: At prediction, make sure you do the same feature normalization.
%

fprintf('Running gradient descent ...\n');

% Choose some alpha value
alpha = 0.01;
num_iters = 400;

% Init Theta and Run Gradient Descent 
theta = zeros(size(X,2), size(y,2));
[theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters);



% Plot the convergence graph
figure;
plot(1:numel(J_history), J_history, '-b', 'LineWidth', 2);
xlabel('Number of iterations');
ylabel('Cost J');

% Display gradient descent's result
fprintf('Theta computed from gradient descent: \n');
%fprintf(' %f \n', theta);
disp(size(theta));
fprintf('\n');


%% Load Data
%% Load Data
[X,y] = imgProcess(12,53);
m = length(y);
disp("X and y");
disp(size(X));
disp(size(y));

y(:,1:1) = [];

% Add intercept term to X
X = [ones(size(X,1), 1) X];

% Calculate the parameters from the normal equation
theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
%fprintf(' %f \n', theta);
disp(size(theta));
fprintf('\n');



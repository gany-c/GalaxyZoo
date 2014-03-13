
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
% fprintf('First 10 examples from the dataset: \n');
% fprintf('  y = %.0f \n', [ y(1:10,1:1)]');

headerRow = "GalaxyID,Class1.1,Class1.2,Class1.3,Class2.1,Class2.2,Class3.1,Class3.2,Class4.1,Class4.2,Class5.1,Class5.2,Class5.3,Class5.4,Class6.1,Class6.2,Class7.1,Class7.2,Class7.3,Class8.1,Class8.2,Class8.3,Class8.4,Class8.5,Class8.6,Class8.7,Class9.1,Class9.2,Class9.3,Class10.1,Class10.2,Class10.3,Class11.1,Class11.2,Class11.3,Class11.4,Class11.5,Class11.6";


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
normal_theta = normalEqn(X, y);

% Display normal equation's result
fprintf('Theta computed from the normal equations: \n');
%fprintf(' %f \n', normal_theta);
disp(size(normal_theta));
fprintf('\n');

applyResults(theta, 53, headerRow);


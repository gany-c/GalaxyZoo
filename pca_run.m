
%  Before running PCA, it is important to first normalize X by subtracting 
%  the mean value from each feature
% X is mxn
[X_norm, mu, sigma] = featureNormalize(X);

%  Run PCA
% U, S are nxn
[U, S] = pca(X_norm);

%first 100 eigen vectors, change this to what u want
K = 100;
%Project data
% X is (mxn)*(nxk) = (mxk) => reduction
Z = X*U(:, 1:K);

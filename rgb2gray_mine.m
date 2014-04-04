function [Xgray] = rgb2gray_mine(X)

step = size(X,1);

J = reshape(X, size(X,1),size(X,2)*3);
J = J/255;

R = J(: , 1:step);
G = J(: , step+1: 2*step);
B = J(: , 2*step+1: 3*step);

Xgray = 0.21*R + 0.71*G + 0.07*B;

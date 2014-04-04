function [] = applyResultsPCA(theta, compF, headerRow)

X = [];
galaxyIdColumn = [];

filelist = readdir ("images_test_rev1");
disp(numel(filelist));
for ii = 1:numel(filelist)
  ## skip special files . and ..
  if (regexp (filelist{ii}, "^\\.\\.?$"))
    continue;
  endif

  fileName = strtok(filelist{ii},".");
  fileId = str2num(fileName);
  galaxyIdColumn = [galaxyIdColumn; fileId];
  I = imread (["images_test_rev1/" filelist{ii}]);
  J = rgb2gray_mine(I);

  J = double(J);
  z = pca_mine(J,compF);

  z = reshape(z, 1, size(z,1) * size(z,2));

  X = [X; z];	


endfor

% Add intercept term to X
X = [ones(size(X,1), 1) X];

disp("size of test set X");
disp(size(X));

disp("size of theta");
disp(size(theta));

resultSet = X * theta;
resultSet = [galaxyIdColumn resultSet];
save results.csv headerRow;
dlmwrite("results.csv",resultSet,"-append","delimiter",",")

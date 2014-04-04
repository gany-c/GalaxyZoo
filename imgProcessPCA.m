function [X,y] = imgProcessPCA(numRead, compF)

y  = csvread("training_solutions_rev1.csv");
disp("size of y = ");
disp(size(y));


y = y(1:numRead, :);


X = [];
filelist = readdir ("images_training_rev1");
disp(numel(filelist));
for ii = 1:numel(filelist)
  ## skip special files . and ..
  if (regexp (filelist{ii}, "^\\.\\.?$"))
    continue;
  endif
  I = imread (["images_training_rev1/" filelist{ii}]);
  J = rgb2gray_mine(I);

  J = double(J);
  z = pca_mine(J,compF);

  z = reshape(z, 1, size(z,1) * size(z,2));

  X = [X; z];
  if (ii >= (numRead + 2))
	ii = 0;
	break;
  endif
endfor

disp(size(X));



function [] = applyResults(theta, compF, headerRow)



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
  J = reshape(I, size(I,1),size(I,2)*3);
  J = J/255;	
  csq = compF * compF; 

  K = zeros((size(J,1)/compF),(size(J,2)/compF));

  for i = 1:size(K,1)

	rowtop = compF *(i-1) + 1;
        rowbottom = compF  * i;
        if(rowbottom > size(J,1))
                continue;
        endif

        for j = 1:size(K,2)
                columntop = compF  *(j-1) +1;
                columnbottom = compF  * j;

                if(columnbottom > size(J,2))
                        continue;
                endif

                K(i,j) =sum(sum(J(rowtop:rowbottom, columntop:columnbottom)))/(csq);
        endfor
  endfor

  J = reshape(K,1,size(K,1)*size(K,2));
  X = [X; J];
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

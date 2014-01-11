function [X,y] = imgProcess(numRead, compF)

y  = csvread("solutions_training.csv");
disp(size(y));
y = y(1:numRead, :);


X = [];
filelist = readdir ("images_training");
disp(numel(filelist));
for ii = 1:numel(filelist)
  ## skip special files . and ..
  if (regexp (filelist{ii}, "^\\.\\.?$"))
    continue;
  endif
  I = imread (["images_training/" filelist{ii}]);
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
  if (ii >= (numRead + 2))
	ii = 0;
	break;
  endif
endfor

disp(size(X));



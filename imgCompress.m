 I = imread ("images_training/100008.jpg");
 disp(size(I));
 imshow(I);
 pause;
J = reshape(I, size(I,1),size(I,2)*3);
 disp("brightness in J");
 disp(sum(sum(J)));

imshow(J);
pause;

compF = 21;

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

		K(i,j) =sum(sum(J(rowtop:rowbottom, columntop:columnbottom)))/(compF * compF * 255);  
		%imshow(J(rowtop:rowbottom, columntop:columnbottom)); title(K(i,j));pause;
	endfor

endfor

disp(size(reshape(K,1,size(K,1)*size(K,2))));
imshow(K);

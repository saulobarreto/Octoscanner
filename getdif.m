function getdif(path1,path2)
  
  close all;
  img1 = imread(path1);
  img2 = imread(path2);
  img3 = img2.-img1;
  
  figure(1);
  grid on;
  hold on;
  imshow(img1);
    
  figure(2);
  grid on;
  hold on;
  imshow(img2);
  
  figure(3);
  grid on;
  hold on;
  imshow(img3);
  
  imwrite(img3,"diff.png");

endfunction

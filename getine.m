function rgb_line(line)
  
  img = imread("Obj002/pic005.png");
  liner = img(line,:,1);
  lineg = img(line,:,2);
  lineb = img(line,:,3);
  figure(1);
  hold on;
  plot(liner,"color","r");
  plot(lineg,"color","g");
  plot(lineb,"color","b");

endfunction

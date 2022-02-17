function getrgbline(line,path)
  
  img = imread(path);
  liner = img(line,:,1);
  lineg = img(line,:,2);
  lineb = img(line,:,3);
  figure(1);
  hold on;
  plot(liner,"color","r");
  plot(lineg,"color","g");
  plot(lineb,"color","b");
  grid on;

endfunction

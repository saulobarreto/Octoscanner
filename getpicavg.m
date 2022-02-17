function getpicavg(num_pics)
  
  close all;
  
  img_acc = zeros(480,640);
  
  for counter = 2:num_pics
    
  file_tag = "dif";
  file_counter= sprintf("%03d",counter);
  file_extension = ".png";
  file_name = strcat(file_tag,file_counter,file_extension);
   
  img = imread(file_name);
  img_double = double(img);
  img_acc = img_acc+img_double;
  img_avg = img_acc./(counter-1);
  img_avg = uint8(img_avg);
  
  liner = img_avg(300,:,1);
  lineg = img_avg(300,:,2);
  lineb = img_avg(300,:,3);
  
  file_tag = "avg";
  file_counter= sprintf("%03d",counter);
  file_extension = ".png";
  file_name = strcat(file_tag,file_counter,file_extension);
  imwrite(img_avg,file_name);
  
  figure(counter);
  hold on;
  plot(liner,"color","r");
  plot(lineg,"color","g");
  plot(lineb,"color","b");
  grid on;
  
  endfor

endfunction

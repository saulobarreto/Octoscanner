function getpeaks(num_pics)
  
  close all;
  
  norm_peaks = zeros(num_pics,2);
  avg_peaks  = zeros(num_pics,2);
  
  for counter = 2:num_pics
    file_tag = "dif";
    file_counter= sprintf("%03d",counter);
    file_extension = ".png";
    file_name = strcat(file_tag,file_counter,file_extension);
    img1 = imread(file_name);
    vector = img1(300,:,1);
    [a,b] = max(vector);
    norm_peaks(counter,1) = a;
    norm_peaks(counter,2) = b;
  endfor
  
  norm_peaks_value = norm_peaks(:,1)';
  norm_peaks_posi  = norm_peaks(:,2)';

  for counter = 2:num_pics
    file_tag = "avg";
    file_counter= sprintf("%03d",counter);
    file_extension = ".png";
    file_name = strcat(file_tag,file_counter,file_extension);
    img2 = imread(file_name);
    vector = img2(300,:,1);
    [a,b] = max(img2(300,:,1));
    avg_peaks(counter,1) = a;
    avg_peaks(counter,2) = b;
  endfor
  
  avg_peaks_value = avg_peaks(:,1)';
  avg_peaks_posi  = avg_peaks(:,2)';
  
  figure(1);
  axis([2 60 225 230]);
  hold on;
  plot(norm_peaks_value,"color","b",'marker','.');
  plot(avg_peaks_value,"color","g"),'marker','.';
  grid on;
  l= legend("Individual","Média");
  legend(l,"location","northeast");
  
  figure(2);
  axis([2 60 350 360]);
  hold on;
  plot(norm_peaks_posi,"color","r",'marker','.');
  plot(avg_peaks_posi,"color","k",'marker','.');
  grid on;
  l= legend("Individual","Média");
  legend(l,"location","northeast");

endfunction

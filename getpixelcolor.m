function colors_vector = getpixelcolor( pixel_distance , current_frame );
  
  global y_resolution;
  colors_vector = zeros(3,y_resolution);
  
  for line_index = 1:y_resolution
    
    column_index = pixel_distance(1,line_index);
    
    if(column_index != 0)
      
      colors_vector(1,line_index) = current_frame(y_resolution+1-line_index,column_index,1);
      colors_vector(2,line_index) = current_frame(y_resolution+1-line_index,column_index,2);
      colors_vector(3,line_index) = current_frame(y_resolution+1-line_index,column_index,3);
      
    endif
    
  endfor
  
endfunction

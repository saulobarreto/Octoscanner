function [pixel_vector output_mask] = getpixelvector2(input_image)
  
  output_mask = input_image;
  img_size = size(input_image);
  x_resolution=img_size(1,2);
  y_resolution=img_size(1,1);
  
  pixel_vector = zeros(1,y_resolution);
  
  # get vector of non zero pixels
  for line_counter = 1:y_resolution
    
    # scan for red x position
    for column_counter = 1:x_resolution
      
      if( input_image(line_counter,column_counter) > 0 )
       
        pixel(1,(y_resolution+1)-line_counter) = column_counter;
        break;
        
      endif
      
    endfor
   
  endfor

  output_mask(output_mask<255) = 0;
  output_mask(:,:,2) = output_mask(:,:,1);
  output_mask(:,:,3) = output_mask(:,:,1);
  
endfunction

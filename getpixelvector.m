function [position_vector intensity_vector output_mask] = getpixelvector(input_image)
  
  output_mask = input_image;
  
  [intensity_vector position_vector] = max(input_image(:,:,1),[],2);
  
  position_vector( intensity_vector < 10 ) = 1;
  position_vector = flip(position_vector');
  
  output_mask(output_mask(:,position_vector(:,1),1)>255) = 255;
  
  output_mask(output_mask<255)=0;
  output_mask(:,:,2)=output_mask(:,:,1);
  output_mask(:,:,3)=output_mask(:,:,1);
  
  
endfunction

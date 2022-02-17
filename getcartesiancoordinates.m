function [vec_x,vec_y,vec_z] = getcartesiancoordinates(distance_vector,angle)

  global y_resolution;
  
  vec_x = zeros(1,y_resolution);
  vec_y = zeros(1,y_resolution);
  vec_z = zeros(1,y_resolution);
  
  for column_counter = 1:y_resolution
   
    r = distance_vector(1,column_counter);
    s = sin(deg2rad(angle));
    c = cos(deg2rad(angle));
    vec_x(1,column_counter) = r * c;
    vec_y(1,column_counter) = r * s;
    vec_z(1,column_counter) = column_counter;
    
  endfor
  
endfunction

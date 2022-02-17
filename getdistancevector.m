function real_distance = getdistancevector(input_vector)

  global x_resolution;
  global y_resolution;
  global d;
  global D;
  global op_ang;
  global scale_factor;
  
  #calculate points distance
  real_distance = input_vector.*scale_factor;
  
endfunction

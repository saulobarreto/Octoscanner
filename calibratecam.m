function calibratecam()
  
  global x_resolution = 1280;
  global y_resolution =  960;
  half_screen = x_resolution/2;
  pkg load image-acquisition;
  pkg load image-acquisition;
  pkg load instrument-control;
  pkg load arduino;
  global ard = arduino;
  global laser_pin = "d5";
  writeDigitalPin (ard, laser_pin, 1);
  # Setting webcam
  cam = videoinput("v4l2","/dev/video1");
  get(cam);
  set(cam,"VideoFormat","RGB3");
  set(cam,"VideoResolution",[x_resolution y_resolution]);
  
  start(cam);
  
  figure(1);
  
  while(1)
  
  current_frame = getsnapshot(cam);
  
  # Separating layers
    red_layer   = current_frame(:,:,1);
    green_layer = current_frame(:,:,2);
    blue_layer  = current_frame(:,:,3);
    
    # Identifying laser and ploting mask
    #red_layer (red_layer > blue_layer & red_layer > green_layer & red_layer>220 ) = 255;
    #red_layer (red_layer   < rmin)  = 0;
    #red_layer (red_layer   > rmax)  = 0;
    red_layer   (:,half_screen) = 255;
    green_layer (:,half_screen) = 0;
    blue_layer (:,half_screen) = 0;
    #red_layer (green_layer > gmax)  = 0;
    #red_layer (blue_layer  < bmin)  = 0;
    #red_layer (blue_layer  > bmax)  = 0;
    #red_layer (red_layer  != 255  )  = 0;
    #red_layer++;
    current_frame(:,:,1) = red_layer;
    current_frame(:,:,2) = green_layer;
    current_frame(:,:,3) = blue_layer;
    imshow(current_frame);
    refresh;
    
    if( kbhit(1) == "q")
      
      writeDigitalPin (ard, laser_pin, 0);
      stop(cam);
      close all;
      break      
      
    endif
    
  endwhile
  
endfunction

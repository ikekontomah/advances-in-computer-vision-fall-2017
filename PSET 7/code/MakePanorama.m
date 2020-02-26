function [im] = MakePanorama(im1, im2, T)
%% Initialise dimensions to create panorama
t_form_matrix = projective2d(T');
identity_matrix= [1 0 0; 0 1 0; 0 0 1] ;
t_form_identity = projective2d(identity_matrix);
im1_size = size(im1);
[x_limits, y_limits] = outputLimits(t_form_matrix, [1 im1_size(2)], [1 im1_size(1)]);
x_minimum = min([1; x_limits(:)]);
x_maximum = max([im1_size(2); x_limits(:)]);
y_minimum = min([1; y_limits(:)]);
y_maximum = max([im1_size(1); y_limits(:)]);
%%%%% Create panoramic Image
panorama_width  = round(x_maximum - x_minimum); %%% panorama width
panorama_height = round(y_maximum - y_minimum); %%%%panorama height
empty_panorama = zeros([panorama_height panorama_width 3], 'like', im1); %%% Initialize an empty panorama
blend = vision.AlphaBlender('Operation', 'Binary mask','MaskSource', 'Input port');
x_limits = [x_minimum x_maximum];
y_limits = [y_minimum y_maximum];
panoramic_view = imref2d([panorama_height panorama_width], x_limits, y_limits);  %%% create the panorama's size
warpedImage = imwarp(im2,t_form_identity, 'OutputView', panoramic_view); %% warp to transform id matrix to panorama
mask = imwarp(true(size(im2,1),size(im2,2)),t_form_identity, 'OutputView', panoramic_view); %% mask the panorama view
panoImage= step(blend,empty_panorama, warpedImage, mask);  %%% add warped image to panorama
warpedImage = imwarp(im1,t_form_matrix, 'OutputView', panoramic_view);     %%%transform identity matrix into panoramic view
mask = imwarp(true(size(im1,1),size(im1,2)),t_form_matrix, 'OutputView', panoramic_view);    %%% create a new binary mask
im = step(blend, panoImage, warpedImage, mask);         %%% Add warped image to panoramic view
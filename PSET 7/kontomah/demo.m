% Hint: For debugging functions in MATLAB, it could be useful
% to use the command 'dbstop if error'. This will allow you 
% to use the terminal within the scope of a function when an 
% error occurs. You can remove this option by typing 'dbclear
% if error'. To continue from a debug stop, you can type 
% 'dbcont', or 'dbquit' to return to regular terminal.

% read in the images
im1 = imread('yosemite/img1.jpg');
im2 = imread('yosemite/img2.jpg');
im3 = imread('sift/data/landscape-a.jpg');
im4 = imread('sift/data/landscape-a.jpg');
im5 = imread('seoul/img1.jpg');
im6 = imread('seoul/img2.jpg');
panoramic_image1 = Photomerge(im1, im2);
panoramic_image2 = Photomerge(im3, im4);
panoramic_image3 = Photomerge(im5, im6);
figure(1); clf;
subplot(2,2,1); imshow(im1);
subplot(2,2,2); imshow(im2);
subplot(2,2,3:4);
imshow(panoramic_image1);

figure(2); clf;
subplot(2,2,1); imshow(im3);
subplot(2,2,2); imshow(im4);
subplot(2,2,3:4);
imshow(panoramic_image2);

figure(3); clf;
subplot(2,2,1); imshow(im5);
subplot(2,2,2); imshow(im6);
subplot(2,2,3:4);
imshow(panoramic_image3);
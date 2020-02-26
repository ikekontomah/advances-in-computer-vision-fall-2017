function [im] = Photomerge(im1, im2)
image_average1=im1/max(im1(:)) ;
image_average2=im2/max(im2(:)) ;
 
[frames1,descr1,~,~] = sift( image_average1(:,:,1), 'Verbosity', 1 ) ;
[frames2,descr2,~,~] = sift( image_average2(:,:,1), 'Verbosity', 1 ) ;
 
descriptor1=uint8(512*descr1) ;
descriptor2=uint8(512*descr2) ;
matches=siftmatch( descriptor1, descriptor2 ) ;
 
x1 = zeros(size(matches, 2),2);
x2 = zeros(size(matches, 2),2);
for ele=1:size(matches, 2)
     
    x1(ele, :) = frames1(1:2, matches(1, ele));
    x2(ele, :) = frames2(1:2, matches(2, ele));
     
end 
T = TransformRANSAC(x1, x2);
im = MakePanorama(im1, im2, T);


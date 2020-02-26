
%%%%pset 6  
%%% Collaborators : Devin Morgan , Khamoya Ikhofua , Andrew Zhang , Isaac
%%% Kontomah
%%%Problem 3


%%%Find corners 4 points and transform matrix to correct distorted image
% test_image=imread('IMG_1437.JPG');
% second_image=imread('ref.JPG');
% imshow(second_image) ;
% [x,y] = ginput(4) ;
% imshow(test_image) ;
% [x_prime,y_prime] = ginput(4) ;
% A_matrix=[x(1),y(1),1,0,0,0,-x_prime(1)*x(1),-x_prime(1)*y(1),-x_prime(1);0,0,0,x(1),y(1),1,-y_prime(1)*x(1),-y_prime(1)*y(1),-y_prime(1);
%          x(2),y(2),1,0,0,0,-x_prime(2)*x(2),-x_prime(2)*y(2),-x_prime(2);0,0,0,x(2),y(2),1,-y_prime(2)*x(2),-y_prime(2)*y(2),-y_prime(2);
%          x(3),y(3),1,0,0,0,-x_prime(3)*x(3),-x_prime(3)*y(3),-x_prime(3);0,0,0,x(3),y(3),1,-y_prime(3)*x(3),-y_prime(3)*y(3),-y_prime(3);
%          x(4),y(4),1,0,0,0,-x_prime(4)*x(4),-x_prime(4)*y(4),-x_prime(4);0,0,0,x(4),y(4),1,-y_prime(4)*x(4),-y_prime(4)*y(4),-y_prime(4)];
% square_matrix_to_transform=A_matrix'*A_matrix ;
% [eig_vec,eig_val]=eigs(square_matrix_to_transform,1,'SM') ;
% eig_v = reshape(eig_vec,[3,3]) ;
% transformed_matrix = projective2d(eig_v);
% outputImage = imwarp(second_image,transformed_matrix);
% 
% figure
% imshow(flip(outputImage));


%%  Problem 4 
%%  Plot z against d using the formula z=(dRB*box_size)/(d-dRB)
%% where dRB is the distance between the red and blue dots and d is the
%% distance the image comes out as and z is the distance of the image from
%% the camera
%%
%% Get image distance of black white paper to help scale distances of 5 images
white_paper_image = imread('IMG_1437.JPG');
imshow(white_paper_image) ;
[x0,y0] = ginput(2) ;
paper_distance=pdist([x0,y0],'euclidean') ;
rb_image1 = imread('z_17in_take_3.JPG');
imshow(rb_image1) ;
[x1,y1] = ginput(2) ;
rb_distance1=pdist([x1,y1],'euclidean') ;
rb_image2 = imread('z_34in.JPG');
imshow(rb_image2) ;
[x2,y2] = ginput(2) ;
rb_distance2=pdist([x2,y2],'euclidean') ;
rb_image3 = imread('z_51in.JPG');
imshow(rb_image3) ;
[x3,y3] = ginput(2) ;
rb_distance3=pdist([x3,y3],'euclidean') ;
rb_image4 = imread('z_68in.JPG');
imshow(rb_image4) ;
[x4,y4] = ginput(2) ;
rb_distance4=pdist([x4,y4],'euclidean') ;
rb_image5 = imread('z_85_take_2.JPG') ;
imshow(rb_image5) ;
[x5,y5] = ginput(2) ;
rb_distance5=pdist([x5,y5],'euclidean') ;

figure
%%%Use the five d values generated and plot against the corresponding z values
x=[ 436.0183,565.4167,420.1714,384.3332,356.0225] ;
y=[17,34,51,68,85] ;
scatter(x,y);
title("Plots of z against d using camera") ;
%%% From blank white paper , 11 inches=2720 image distance units , hence
%%% 1 inch is 247.2727 image distance units

%%% Take 5 known d values and calculate their corresponding z values
figure
d_RB=1.5 ;
box_distance=11.5 ;
convert_to_inches=247.2727 ;
x_inches=x./convert_to_inches ;
z_using_formula=(d_RB*box_distance)./(x_inches-d_RB) ;
scatter(x_inches,z_using_formula);
title("Plots of z against d using formula") ;
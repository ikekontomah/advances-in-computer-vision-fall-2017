%% Read images and set up parameters.
im = imread('image.png');
im_test=imread('camber_castle.jpeg');
read_einstein = imread('einsteinandwho.jpg');
read_musk=imread('musk.png') ;
read_musk=read_musk(1:750,1:750) ; % Slicing Image
read_tesla=imread('tesla.png') ;
read_tesla=read_tesla(1:740,1:620) ; % Slicing image
read_einstein1=imread('einstein_1.jpg');
read_einstein1=read_einstein1(1:740,1:620); % Slicing Image
read_einstein2=imread('einstein_2.jpg');
read_einstein2=read_einstein2(1:352,1:620) ; % Slicing Image

depth = imread('depth.png');
depth = im2double(depth);
focal_plane_depth = 0.77;
alpha = 13;
[h,w,~] = size(im);

%Problem1 Implementation
out = gaussblur(read_einstein1)+ ((read_tesla)-gaussblur(read_tesla)); 
%figure,imshow(out) ;
%title('Einstein-Tesla Hybrid')



%Problem 2 Implementation, 
len = 50;
theta = 15;
noise_mean = 0;
noise_var = 0.000001;
PSF = fspecial('motion',len,theta);
blurred = imfilter(im2double(convImage), PSF, 'conv', 'circular');
blurred_noisy = imnoise(blurred, 'gaussian',noise_mean, noise_var);
convImage = imgaussfilt(read_einstein,3) ;
x=im2double(convImage) ;
estimated_nsr=noise_var/var(x(:)) ;
wnr3 = deconvwnr(blurred_noisy, PSF, estimated_nsr);
%convImage2 = imboxfilt(im2double(read_einstein),13) ;
%separate1 = uint8(read_einstein) - uint8(convImage2) ;
%figure,imshow(uint8(intensityscale(convImage2))) % Box filter does not work as well as gaussfilter

separate_from_low_freq = uint8(read_einstein) - uint8(convImage) ;%Separating high freqquency image from low frequency image


figure,imshow(uint8(intensityscale(im2double(convImage))));
axis square
title('Low frequency Image')
colormap gray

figure,imshow(separate_from_low_freq)
axis square
title('high frequency Image')
colormap gray


%Problem 3 , Part  1 Implementation
%% Gaussian Filtering
use_matrix1=padarray(im2double(im),[10 10]) ;
result = zeros(h,w,3);
for i = 1:h
    for j=1:w
        dep = depth(i,j);
        % gussian sigma based on depth
        sigma_g = abs(dep-focal_plane_depth)*alpha;
        kern = fspecial('gaussian',[21 21],sigma_g) ;
        for ele = 1:3
            convl1=use_matrix1(i:i+20,j:j+20,ele).* kern ;
            result(i,j,ele)= sum(sum(convl1));
        end
    end
end
%figure,imshow(im2uint8(result))

%Problem 3 , Part 2 Implementation
% Binomial Filtering
result_binomial = zeros(h,w,3);
im=padarray(im2double(im),[10 10] );
for i = 1:h
    for j=1:w
            
        dep = depth(i,j);
        kern_size = round(abs(dep-focal_plane_depth)*alpha*10);
        for ele=1:kern_size
                binomial = conv([1 1],[1 1]) ;
                kern=binomial.*binomial';
                kern=kern-min(kern(:)) ;
                kern=kern./sum(sum(kern)) ;
                    
                for ele2=1:3
                    result_binomial(i,j,ele2)=sum(sum(kern));
                end
        end
    end
end

%figure,imshow(im2uint8(result_binomial)) ;

function [bl] = gaussblur(impImg) 
    bl= imgaussfilt(impImg,12);
end
% function binomial= binomialKernel(level)
%     if level==0 || level==1
%         binomial=[0.5 0.5] ;
%     else
%          binomial = conv(binomialKernel(level-1),[1 1]) ;
%     end
%         
% end

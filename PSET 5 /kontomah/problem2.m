%Problem2
%eigen_faces
input_matrix=load('faces.mat');
use_matrix = input_matrix.faces;
cov_matrix=cov(use_matrix') ;
[eigen_vectors,eigen_values]= eigs(cov_matrix,5) ;
%[i,j]= size(eigen_vectors) ;

%-----------Plotting Top 5 Images---------%
%Plot 1st image
figure 
eigen_v1 = reshape(eigen_vectors(:,1),[64,64]) ;
imagesc(eigen_v1) ;
title("Best 5 Image Plots 1") ;
colormap gray

%Plot 2nd image
figure 
eigen_v2 = reshape(eigen_vectors(:,2),[64,64]) ;
imagesc(eigen_v2) ;
title("Best 5 Image Plots 2") ;
colormap gray

%Plot 3rd image
figure 
eigen_v3 = reshape(eigen_vectors(:,3),[64,64]) ;
imagesc(eigen_v3) ;
title("Best 5 Image Plots 3") ;
colormap gray

%Plot 4th image
figure 
eigen_v4 = reshape(eigen_vectors(:,4),[64,64]) ;
imagesc(eigen_v4) ;
title("Best 5 Image Plots 4") ;
colormap gray

%Plot 5th image
figure 
eigen_v5 = reshape(eigen_vectors(:,5),[64,64]) ;
imagesc(eigen_v5) ;
title("Best 5 Image Plots 5") ;
colormap gray


%-------PART II--------%
%------Reconstructing The Image%
[best_20,eig_val]= eigs(cov_matrix,20) ; 
first_im=use_matrix(:,1);
x_matrix=mldivide(best_20,first_im);
reconstruct=best_20 * x_matrix;
figure
imagesc(reshape(reconstruct,[64,64]))
title('Image plots for best 20 Eigen Vectors') 
colormap gray



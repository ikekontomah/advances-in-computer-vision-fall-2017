function [T] = TransformRANSAC(x1, x2)
%%% define parameters to use
numIter = 10000;
max_inline_points= -1;
for i=1:numIter
    % sample 4 points from x1 and x2
    %% build your homographic matrix
    homographic_matrix = make_homography(x1, x2);
    x_of_ones = [x1 ones(size(x1, 1), 1)].';
    transform_x = homographic_matrix * x_of_ones;  %%% get a new matrix from homograpic and matrix of ones of size 1st row of x1
    transform_x_new = (transform_x(1:2,:)./transform_x(3,:)).';%%% divide first and second row by 3rd row
    inliners = zeros(size(x1,1),1);
    for ele=1:size(transform_x_new,1)
        inliners(ele,1) = (sqrt(sum((x2(ele,:) - transform_x_new(ele,:)).^2)) < 0.6);
    end
    inline_value = sum(inliners);
    if max_inline_points < inline_value
        max_inline_points = inline_value;
        points_inline = find(inliners);
         
        for k = 1:size(points_inline)
            optimal_x1(k,:) = x1(points_inline(k), :);
            optimal_x2(k,:) = x2(points_inline(k), :);
        end
    end
end 
A=zeros(2*size(optimal_x1,1),9);
index=1;
for ele = 1:size(optimal_x1,1)
    x_1 = optimal_x1(ele,1);
    y_1 = optimal_x1(ele,2);
    x_prime = optimal_x2(ele,1);
    y_prime = optimal_x2(ele,2);
    A(index,:) = [x_1 y_1 1 0 0 0 -x_prime*x_1 -x_prime*y_1 -x_prime]; 
    A(index+1,:) = [0 0 0 x_1 y_1 1 -y_prime*x_1 -y_prime*y_1 -y_prime];
    index=index+2;
end 
matrix_for_homography=A.'*A;
[eig_vec, ~]=eig(matrix_for_homography);
T = reshape(eig_vec(:,1),[3,3]).';
end
function [H] = make_homography(x1, x2)
    num_points_to_use = 4;
    A_matrix=zeros(2*num_points_to_use,9);
    random_points = ceil(rand(1,num_points_to_use)*(size(x1,1)-1))';
    index=1;
    for ele = 1:length(random_points)
        x_1 = x1(random_points(ele),1);
        y_1 = x1(random_points(ele),2);
        x_prime = x2(random_points(ele),1);
        y_prime = x2(random_points(ele),2);
        A_matrix(index,:) = [x_1 y_1 1 0 0 0 -x_prime*x_1 -x_prime*y_1 -x_prime]; 
        A_matrix(index+1,:) = [0 0 0 x_1 y_1 1 -y_prime*x_1 -y_prime*y_1 -y_prime];
        index=index+2;
    end
    matrix_for_homography=A_matrix.'*A_matrix;
    [eig_vec, eig_val]=eig(matrix_for_homography);
    H = reshape(eig_vec(:,1),[3,3]).';
end
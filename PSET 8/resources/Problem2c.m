%%%Problem 2c
%%% Load image to use
image_to_use=load("pedestrian.mat") ;
im_x=image_to_use.x ;
im_y=image_to_use.y ;
figure
plot(im_x,im_y) ;
title("Pedestrian Belief Propagation") ;
hold on 
x_vals=size(im_x);
node_potential=[1 1];
for ele=2:x_vals-1
    angle_to_use = angle_calculator(im_x(ele-1), im_y(ele-1), im_x(ele), im_y(ele));
    first_angle = angle_to_use;
    angle_to_use= angle_calculator(im_x(ele), im_y(ele), im_x(ele+1), im_y(ele+1));
    second_angle= angle_to_use;
    new_angle = get_convexity(first_angle,second_angle);
    turn_right = (pi + new_angle)/2/pi;
    turn_left = (pi - new_angle)/2/pi;
    node_potential(1,1) = node_potential(1,1) * turn_right;
    node_potential(1,2) = node_potential(1,2) * turn_left;
    sum_nodes = node_potential(1,1) + node_potential(1,2);
    node_potential(1,1) = node_potential(1,1) / sum_nodes;
    node_potential(1,2) = node_potential(1,2) / sum_nodes;
end
turning_right = 0 ;
if node_potential(1,1) > node_potential(1,2)
    turning_right = 1 ;
end
for ele2 = 2:x_vals-1
    first_angle = angle_calculator(im_x(ele2-1), im_y(ele2-1), im_x(ele2), im_y(ele2));
    new_first_angle = first_angle;
    first_angle = angle_calculator(im_x(ele2), im_y(ele2), im_x(ele2+1), im_y(ele2+1));
    new_second_angle = first_angle;
    new_angle_convex = get_convexity(new_first_angle, new_second_angle);
    get_average = new_first_angle + pi - new_angle_convex/2.0;
    if new_angle_convex>= 0 && turning_right == 0
        get_average = get_average + pi;
    end
    if new_angle_convex <= 0 && turning_right == 1
        get_average = get_average+ pi;
    end
    quiver( im_x(ele2), im_y(ele2), cos(get_average),sin(get_average), 5);
end
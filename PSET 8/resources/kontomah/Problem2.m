%%Problem 2a.
im_flower=imread('flower.jpg') ;
im_hand=imread('Weiss_hand.png');
im_ped=imread('pedestrian.png') ;
flower_curve=load("flower.mat");
flower_x=flower_curve.x;
flower_y=flower_curve.y;
hand_curve=load('hand.mat');
hand_x=hand_curve.x;
hand_y=hand_curve.y;
pedestrian_curve=load('pedestrian.mat');
pedestrian_x=pedestrian_curve.x;
pedestrian_y=pedestrian_curve.y ;



%%% Problem 2a: Plotting Contours
figure
plot(flower_x,flower_y);
title("Flower Contours") ;
colormap gray

figure
plot(hand_x,hand_y);
title("Hand Contours") ;
colormap gray

figure
plot(pedestrian_x,pedestrian_y);
title("Pedestrian Contours") ;
colormap gray



%%Plotting x and y local beliefs of figures 
%%Problem 2b
figure
plot(flower_x,flower_y);
theta1=findForegroundAssignment(flower_x,flower_y);
theta2=findForegroundAssignment2(flower_x,flower_y);
hold on
quiver(flower_x,flower_y,[0; theta1 ; 0],[0; theta2; 0],0.4);
title("Flower plots") ;
colormap gray

figure
plot(hand_x,hand_y);
theta3=findForegroundAssignment(hand_x,hand_y);
theta4=findForegroundAssignment2(hand_x,hand_y);
hold on
quiver(hand_x,hand_y,[0; theta3; 0],[0; theta4; 0],0.4);
title("Hand plots") ;
colormap gray

figure
plot(pedestrian_x,pedestrian_y);
theta5=findForegroundAssignment(pedestrian_x,pedestrian_y) ;
theta6=findForegroundAssignment2(pedestrian_x,pedestrian_y) ;
hold on
quiver(pedestrian_x,pedestrian_y,[0 ; theta5 ; 0],[0 ; theta6; 0],0.4);
title("Pedestrian plots") ;
colormap gray



function [x,y] = DrawCurve(im)

% Allows the user to draw a curve on top of the given image (leave blank for
% empty palette. Returns the (ordered) 2d coordinates of the curve.
% NOTE: coordinates origin (0,0) is the upper left corner of the image.
% See documentation of impoly for drawing instructions.
%

DEFAULT_N = 250;

if nargin<1 || isempty(im)
    im = ones(DEFAULT_N);
end

fig1 = figure;
imshow(im,'Border','tight');
h = impoly('Closed',0);
pos = wait(h);
x = pos(:,1);
y = pos(:,2);

close(fig1);

fig2 = figure;
imshow(im,'Border','tight'); hold on;
plot(x,y,'r-','LineWidth',2);

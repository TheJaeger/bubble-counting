%% Siddhartha Dhiman
 
%% Clearing Workspace
clc;
clear all;
close all;

%% Read Image
I = imread('Q2.tif');
% figure, imshow(I), axis image, title('Original Image');

%% Segment Image with 4 Thresholds
thresh = 187;
seg_I = imquantize(I,thresh,[0 1]);
% figure, imshow(seg_I), axis image; title('Segmented Image Showing Only Bubbles');

%% Fill Holes to Obtain a Full Circle
close_I = imclose(seg_I, strel('disk',7));
fill_I = imfill(close_I,'holes');

%% Find Circles
[Cs, Rs] = imfindcircles(fill_I, [10 30], 'ObjectPolarity', ...
    'bright','Sensitivity',0.91, 'Method', 'TwoStage');
[Cl, Rl] = imfindcircles(fill_I, [32 70], 'ObjectPolarity', ...
    'bright','Sensitivity',0.965, 'Method', 'TwoStage');

%% Counting Bubbles and Area Computation
BubbleCount = numel(Rs) + numel(Rl);

%% Compute Area of Bubbles
AreaBubble = sum(pi.*(Rs.^2)) + sum(pi.*(Rl.^2));
[Length, Width] = size(I);
AreaFrame = Length * Width;
Ratio = (AreaBubble/AreaFrame)*100;

%% Plot All Results
figure, imshow(fill_I), axis image, title([num2str(BubbleCount) ' Bubbles were Found with Area Ratio ' num2str(Ratio) char(37)]);
viscircles(Cs, Rs,'EdgeColor','b');
hold on
viscircles(Cl, Rl,'EdgeColor','r');
hold off







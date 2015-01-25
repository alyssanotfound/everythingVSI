clc; clear all; close all;
%look at bottom of this image
A = imread('7.jpg');

%look at the tops of these images
srcFiles = dir('*.jpg');

%look at center of image
%c = [70];
%find color at bottom
%r = [200];
%rgb value of pixel at bottom
%a = impixel(A,c,r);

%get HSV value for one pixel at bottom of img 
HSV = rgb2hsv(A(200,70,:));

%get HSV value for one pixel at top of imgs
HSVtops = [];
for i = 1:length(srcFiles)
    B = imread(srcFiles(i).name);
    HSVtops = [HSVtops,rgb2hsv(B(20,70,:))];
end

HSV = HSV(:,:,1);
HSVtops = HSVtops(:,:,1);

[dist,index]=min(abs(HSVtops-HSV));

%disp(a);
disp(HSV);
disp(HSVtops);
disp(index);


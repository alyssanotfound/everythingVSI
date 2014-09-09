clc; clear all; close all;

srcFiles = dir('images/*.jpg');

set(gcf,'Color',[1,1,1]);
I = combinef(srcFiles);
imshow(I);
%pass a position number to look at bottom of that image
for j = 1:1:396
    swapf(srcFiles,j);
end
%filename = strcat('images/',srcFiles(S).name);

%after all images have been swapped, show new image
J = combinef(srcFiles);
figure,imshow(J);

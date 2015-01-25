clc; clear all; close all;

srcFiles = dir('images/*.jpg');



%{
I = combinef(srcFiles);
imshow(I);
%swap to create blended columns
for j = 1:1:396
    disp(j);
    swapf(srcFiles,j);
end
%}

%swap columns
%swapclmnsf(srcFiles);

%after all images have been swapped, show new image
%set(gcf,'Color',[1,1,1]);
J = combinef(srcFiles);
figure,imshow(J);

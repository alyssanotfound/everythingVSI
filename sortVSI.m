clc; clear all; close all;

srcFiles = dir('images/*.jpg');
set(gcf,'Color',[1,1,1]);

for i = 1 : 36
    filename = strcat('images/',srcFiles(i).name);
    I = imread(filename);
    %figure, imshow(I);
    %subaxis(12,36,i, 'Spacing', 0.03, 'Padding', 0, 'Margin', 0);
    subplot(3,12,i), subimage(I); 
    axis tight
    axis off

end
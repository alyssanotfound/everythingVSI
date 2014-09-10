clc; clear all; close all;

srcFiles = dir('images/*.jpg');

filename = strcat('images/34.jpg');
A = imread(filename);
Abottom = imcrop(A,[0 185 138 22]);
imshow(Abottom);
avgBottom = mean(mean(Abottom));
clor = roundn(avgBottom/255,-1);
avgTops=[];

for i = 1:length(srcFiles)
    fn = strcat('images/',srcFiles(i).name);
    B = imread(fn);
    Btop = imcrop(B,[0 0 138 22]);
    avgTop = mean(mean(Btop));
    avgTops = [avgTops,avgTop];
end

a1 = abs(avgTops(:,:,1)-avgBottom(:,:,1));
a2 = abs(avgTops(:,:,2)-avgBottom(:,:,2));
a3 = abs(avgTops(:,:,3)-avgBottom(:,:,3));
aF = a1+a2+a3;
[dist,index]=min( aF );

disp(dist);
disp(index);
clr = roundn(avgTops(:,index,:)/255,-1);
rectangle('Position',[0,0,20,20],'FaceColor',clor);
rectangle('Position',[20,0,20,20],'FaceColor',clr);

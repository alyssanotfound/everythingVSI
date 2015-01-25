clc; clear all; close all;

srcFiles = dir('images/*.jpg');
position = 3;
filename = strcat('images/',srcFiles(position).name);
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

srt = position+36;
subsample = aF(:,srt:length(srcFiles));

[dist,index]=min( subsample );

undersrc = position+36;

realindex = index+position+35;
disp(position);
disp(undersrc);
disp(realindex);


%matchfile = strcat('images/',int2str(realindex),'.jpg');
matchfile = strcat('images/',srcFiles(realindex).name);
%undersrcfile = strcat('images/',int2str(undersrc),'.jpg');
%undersrcfile2 = strcat('images/',srcFiles(undersrc).name);

disp(matchfile);
%disp(undersrcfile);

%disp(matchfile2);
%disp(undersrcfile2);
%disp(avgTops(:,index,:));
clr = roundn(avgTops(:,realindex,:)/255,-1);
rectangle('Position',[0,0,20,20],'FaceColor',clor);
rectangle('Position',[20,0,20,20],'FaceColor',clr);
figure, imshow(filename);
figure, imshow(matchfile);

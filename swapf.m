function swapf(srcFiles,position)
%look at bottom of this image
filename = strcat('images/',srcFiles(position).name);
A = imread(filename);
Abottom = imcrop(A,[0 185 138 22]);
%figure,imshow(Abottom);
avgBottom = mean(mean(Abottom));

%disp(avgBottom);

%HSV = rgb2hsv(avgBottom);
%disp(HSV);
%HSV = rgb2hsv(A(200,70,:));
%HSVtops = [];
avgTops = [];
%this will start comparing to only the imgs that havent been matched
%
for i = 1:length(srcFiles)
    fn = strcat('images/',srcFiles(i).name);
    B = imread(fn);
    Btop = imcrop(B,[0 0 138 22]);
    avgTop = mean(mean(Btop));
    avgTops = [avgTops,avgTop];
    %disp(avgTop);
    %HSVtops = [HSVtops,rgb2hsv(avgTop)];
end
%HSV = HSV(:,:,1);
%HSVtops = HSVtops(:,:,1);

a1 = abs(avgTops(:,:,1)-avgBottom(:,:,1));
a2 = abs(avgTops(:,:,2)-avgBottom(:,:,2));
a3 = abs(avgTops(:,:,3)-avgBottom(:,:,3));
aF = a1+a2+a3;

[dist,index]=min( aF );
%realindex = index+undersrc-1;
%disp(index);
%disp(HSVtops);
%disp(size(HSVtops));
%disp(size(HSV));
%disp(avgTops(1,index,:));
%disp(HSVtops(index));

%disp(index);
matchfile = strcat('images/',srcFiles(index).name);
undersrc = position+36;
undersrcfile = strcat('images/',srcFiles(undersrc).name);
tempfile = 'images/tempfile.jpg';
%disp(matchfile);
%disp(undersrcfile);
%disp(tempfile);


if ~strcmp(matchfile,undersrcfile) 
    movefile(undersrcfile,tempfile);
    movefile(matchfile,undersrcfile);
    movefile(tempfile,matchfile);
    delete(tempfile);
end
%figure, imshow(filename);
%figure, imshow(matchfile);





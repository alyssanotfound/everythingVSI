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
realindex = [];
index = [];
undersrc = [];
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
%disp(size(aF));
srt = position+36;
%disp(size(aF(:,srt:end)));
subsample = aF(:,srt:length(srcFiles));
[dist,index]=min( subsample );

%disp(index);
%disp(position);


undersrc = position+36;
realindex = index+position+35;
%disp(realindex);
%disp(undersrc);
%disp(size(HSVtops));
%disp(size(HSV));
%disp(avgTops(1,index,:));
%disp(HSVtops(index));

%disp(index);

%matchfile = strcat('images/',int2str(realindex),'.jpg');
matchfile = strcat('images/',srcFiles(realindex).name);

%undersrcfile = strcat('images/',int2str(undersrc),'.jpg');
undersrcfile = strcat('images/',srcFiles(undersrc).name);

tempfile = 'images/tempfile.jpg';
%figure,imshow(matchfile);
%disp(matchfile);
%figure,imshow(undersrcfile);
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





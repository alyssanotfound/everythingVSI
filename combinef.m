function stitched = combinef(srcFiles)
full = zeros(1,4969,3);

for ii = 0:11
    srt = ii*36+1;
    strip = zeros(207,1,3);

    for i = srt:srt+35
       filename = strcat('images/',srcFiles(i).name);
       I = imread(filename);
       I = I(1:207,1:138,:);
       strip = horzcat(strip,I);
    end
    
    full = vertcat(full,strip);
end



stitched = full;
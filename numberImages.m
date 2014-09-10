
for id = 1:length(srcFiles)
    movefile(fullfile('images',srcFiles(id).name), fullfile('imagesfresh',sprintf('%d.jpg', id)));
end

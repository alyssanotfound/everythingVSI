srcFiles = dir('images/*.jpg');
for id = 1:433
    movefile(fullfile('images',srcFiles(id).name), fullfile('images',sprintf('%04d.jpg', id)));
end

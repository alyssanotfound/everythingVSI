%{
for id = 1:length(srcFiles)
    movefile(fullfile('images',srcFiles(id).name), fullfile('images',sprintf('%d.jpg', id)));
end
%}
%# sample image mapped to Jet colormap
I = repmat(1:100, 100, 1);
C = jet(100);

figure
subplot(211), imagesc(I), colormap(C)
subplot(212), rgbplot(C)

%# shuffle colors
C = C(randperm(100), :);

%# rearrage according to HSV colorspace
C = rgb2hsv(C);
C = sortrows(C, [-1 -3 2]);  %# sort first by Hue, then by value
C = hsv2rgb(C);

figure
subplot(211), imagesc(I), colormap(C)
subplot(212), rgbplot(C)
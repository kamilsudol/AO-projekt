clear; clc;
dict = ['a';'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];
load ocr_final_LBP;
nn = ocr_final_LBP;
img = double(imread('TEST.jpg'))/255;
[rows, columns, channels] = size(img);
test = img(:,:,1);
test = ~imbinarize(test, 0.8);

l = bwlabel(test);
test_w=[];
a = regionprops(test, 'all');
for i = 1:length(a)
    tmp_img = ones(300, 300, channels);
    binary_image = a(i).Image;
    binary_image = padarray(binary_image, 0);
    binary_image = imresize(binary_image, [300, 300]);
    binary_image = tmp_img.*binary_image;
%     imshow(binary_image);
    test_w = [test_w; extractLBPFeatures(rgb2gray(binary_image))];
 end

out1 = nn(test_w');

 for i = 1:size(out1,2)
     dict(find(out1(:,i) == max(out1(:,i))))
end
clear; clc;
dict = ['a';'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];
load ocr_test_pojedyncze_a;
nn = ocr_test_pojedyncze_a;
% %  test_img = imread('test.jpg');
% grains = imread('test3.jpg');
img = double(imread('a.jpg'))/255;
[rows, columns, channels] = size(img);
tmp_img = ones(rows, columns, channels);
% grains = rgb2gray(grains);
test = img(:,:,1);
% test = imbinarize(rgb2gray(double(imread('test3.jpg')))/255);
test = ~imbinarize(test);
% 
test = imdilate(test, ones(1));
imshow(test);
% 
l = bwlabel(test);
% imshow(img.*(l==1));
% tmp_img = tmp_img.*(l==1);
% tmp_img = 1-tmp_img;
% imshow(1-tmp_img.*(l==1));
test_w=[];
% %  a = regionprops(test_img, 'all');
for i = 1:4
        binary_image = 1 - tmp_img.*(l==1);
        binary_image = padarray(binary_image, 100);
        binary_image = imresize(binary_image, [300, 300]);
        imshow(binary_image);
      test_w = [test_w; extractLBPFeatures(rgb2gray(binary_image))];
 end
%  
%  
out1 = nn(test_w')
% out1 = nn(extractLBPFeatures(rgb2gray(grains))')
% % %  for i = 1:length(out1)
% % % % %     out(:,i)
% % %      dict(find(out1(:,i) == max(out1(:,i))))
% % % end
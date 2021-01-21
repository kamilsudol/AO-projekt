clear;clc;

dict = ['a';'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];
load ocr_final_8;
nn1 = ocr_final_8;

test = ~imbinarize(double(imread('TEST.jpg'))/255, 0.8);
test = test(:,:,1);
a = regionprops(test,'all');
l = bwlabel(test);
fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
wtest = zeros(length(a), length(fun));

for i = 1:length(a)
    for j = 1:length(fun)
        binary_image = a(i).Image;
        binary_image = padarray(binary_image,0);
        binary_image = imresize(binary_image, [300, 300]);
        wtest(i,j) =  fun{j}(binary_image);
    end
end

out1 = nn1(wtest');

for i = 1:1:size(out1,2)
    dict(find(out1(:,i) == max(out1(:,i))))
end
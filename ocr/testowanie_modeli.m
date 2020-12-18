clear;clc;

dict = ['a';'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];
load ocr_model_dokladny_final2;

nn1 = ocr_model_dokladny_final2;

test = ~imbinarize(double(imread('test6.jpg'))/255);
test = test(:,:,1);
a = regionprops(test,'all');
l = bwlabel(test);
fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
wtest = zeros(length(a), length(fun));

for i = 1:length(a)
    for j = 1:length(fun)
        wtest(i,j) =  fun{j}(a(i).Image);
    end
end

out1 = nn1(wtest')

for i = 1:length(out1)
%     out(:,i)
    dict(find(out1(:,i) == max(out1(:,i))))
end
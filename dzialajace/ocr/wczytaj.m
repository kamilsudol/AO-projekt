% function w = wczytaj(ids)
%     len = get_length(ids);
%     fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
%     w = zeros(len, length(fun));
%     for x = 1:len
%         img = double(readimage(ids, x))/255;
%         img = img(:,:,1);
%         img = ~imbinarize(img, 0.8);
%         a = regionprops(img, 'all');
%         for i = 1:length(a)
%             for j = 1:length(fun)
%                 binary_image = a(i).Image;
%                 binary_image = padarray(binary_image,0);
%                 binary_image = imresize(binary_image, [300, 300]);
% %                 imshow(binary_image);
%                 w(x,j) =  fun{j}(binary_image);
%             end
%         end
%     end
% end

%%%%%%% wspolczynniki LBP
function w = wczytaj(ids)
    len = get_length(ids);
    w = [];
    for x = 1:len
        img = double(readimage(ids, x))/255;
        [rows, columns, channels] = size(img);
        tmp_img = ones(300, 300, channels);
        test = img(:,:,1);
        test = ~imbinarize(test,0.8);
        a = regionprops(test, 'all');
        binary_image = a(1).Image;
        binary_image = padarray(binary_image, 0);
        binary_image = imresize(binary_image, [300, 300]);
        binary_image = tmp_img.*binary_image;
        data = extractLBPFeatures(rgb2gray(binary_image));
        w = [w;data];
    end
end
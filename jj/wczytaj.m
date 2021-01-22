function w = wczytaj(ids)
    len = get_length(ids);
    fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
    w = zeros(len, length(fun));
%     w = [];
    for x = 1:len
        img = double(readimage(ids, x))/255;
% %         [rows, columns, channels] = size(img);
% %         tmp_img = ones(rows, columns, channels);
% %         test = img(:,:,1);
% %         test = ~imbinarize(test);
% %         l = bwlabel(test);
% % %         data = extractLBPFeatures(rgb2gray(img));
% %         data = extractLBPFeatures(rgb2gray(1 - tmp_img.*(l==1)));
% %         w = [w;data];
%         img = ~imbinarize(double(img)/255);
        img = img(:,:,1);
%         img = imopen(img, ones(5));
        img = ~imbinarize(img, 0.8);
%         img = imerode(img, ones(2));
%         for y = 1:100
%         img = imresize(img, losuj(0.9, 2));
%         img = imrotate(img, losuj(0, 360));
        a = regionprops(img, 'all');
        for i = 1:length(a)
            for j = 1:length(fun)
                binary_image = a(i).Image;
                binary_image = padarray(binary_image,0);
                binary_image = imresize(binary_image, [300, 300]);
%                 imshow(binary_image);
                w(x,j) =  fun{j}(binary_image);
            end
        end
%         end
    end
%     w = w( ~any( isnan( w ) | isinf( w ), 2 ),: );
end
% % % % % % % % % % % % function w = wczytaj(ids)
% % % % % % % % % % % %     len = get_length(ids);
% % % % % % % % % % % %     fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
% % % % % % % % % % % % %     w = zeros(len, length(fun));
% % % % % % % % % % % %     w = [];
% % % % % % % % % % % %     for x = 1:len
% % % % % % % % % % % %         img = double(readimage(ids, x))/255;
% % % % % % % % % % % %         [rows, columns, channels] = size(img);
% % % % % % % % % % % %         tmp_img = ones(rows, columns, channels);
% % % % % % % % % % % %         test = img(:,:,1);
% % % % % % % % % % % %         test = ~imbinarize(test);
% % % % % % % % % % % %         l = bwlabel(test);
% % % % % % % % % % % % % % %         data = extractLBPFeatures(rgb2gray(img));
% % % % % % % % % % % %         binary_image = 1 - tmp_img.*(l==1);
% % % % % % % % % % % %         imshow(binary_image)
% % % % % % % % % % % %         a = regionprops(binary_image, 'all');
% % % % % % % % % % % %         binary_image = a.Image;
% % % % % % % % % % % %         binary_image = padarray(binary_image, 100);
% % % % % % % % % % % %         binary_image = imresize(binary_image, [300, 300]);
% % % % % % % % % % % %         
% % % % % % % % % % % %         data = extractLBPFeatures(rgb2gray(binary_image));
% % % % % % % % % % % %         w = [w;data];
% % % % % % % % % % % % %         img = ~imbinarize(double(img)/255);
% % % % % % % % % % % % % %         img = img(:,:,1);
% % % % % % % % % % % % %         for y = 1:100
% % % % % % % % % % % % %         img = imresize(img, losuj(0.9, 2));
% % % % % % % % % % % % %         img = imrotate(img, losuj(0, 360));
% % % % % % % % % % % % %         a = regionprops(img, 'all');
% % % % % % % % % % % % %         for i = 1:length(a)
% % % % % % % % % % % % %             for j = 1:length(fun)
% % % % % % % % % % % % %                 w(x,j) =  fun{j}(a(i).Image);
% % % % % % % % % % % % %             end
% % % % % % % % % % % % %         end
% % % % % % % % % % % % %         end
% % % % % % % % % % % %     end
% % % % % % % % % % % % %     w = w( ~any( isnan( w ) | isinf( w ), 2 ),: );
% % % % % % % % % % % % end
% function w = wczytaj(ids)
%     len = get_length(ids);
%     fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
% %     w = zeros(len, length(fun));
%     w = [];
%     for x = 1:len
%         img = double(readimage(ids, x))/255;
%         [rows, columns, channels] = size(img);
%         tmp_img = ones(300, 300, channels);
%         test = img(:,:,1);
%         test = ~imbinarize(test,0.8);
%         a = regionprops(test, 'all');
%         l = bwlabel(test);
%         binary_image = a(1).Image;
%         binary_image = padarray(binary_image, 0);
%         binary_image = imresize(binary_image, [300, 300]);
% % % %         data = extractLBPFeatures(rgb2gray(img));
% %         binary_image = 1 - tmp_img.*(l==1);
%         binary_image = tmp_img.*binary_image;
% %         imshow(binary_image)
%         
%         
%         
%         data = extractLBPFeatures(rgb2gray(binary_image));
%         w = [w;data];
% %         img = ~imbinarize(double(img)/255);
% % %         img = img(:,:,1);
% %         for y = 1:100
% %         img = imresize(img, losuj(0.9, 2));
% %         img = imrotate(img, losuj(0, 360));
% %         a = regionprops(img, 'all');
% %         for i = 1:length(a)
% %             for j = 1:length(fun)
% %                 w(x,j) =  fun{j}(a(i).Image);
% %             end
% %         end
% %         end
%     end
% %     w = w( ~any( isnan( w ) | isinf( w ), 2 ),: );
% end
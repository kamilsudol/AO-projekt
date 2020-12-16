function w = wczytaj(ids)
    len = get_length(ids);
    fun = {@AO5RBlairBliss, @AO5RCircularityL, @AO5RCircularityS, @AO5RShape, @AO5RDanielsson, @AO5RFeret, @AO5RHaralick, @AO5RMalinowska};
    w = zeros(len, length(fun));
    for x = 1:len
        img = readimage(ids, x);
        img = ~imbinarize(double(img)/255);
        img = img(:,:,1);
        a = regionprops(img, 'all');
        for i = 1:length(a)
            for j = 1:length(fun)
                w(x,j) =  fun{j}(a(i).Image);
            end
        end
    end
end
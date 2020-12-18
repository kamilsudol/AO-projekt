clear; clc;

dict = ['a';'b'; 'c'; 'd'; 'e'; 'f'; 'g'; 'h'; 'i'; 'j'; 'k'; 'l'; 'm'; 'n'; 'o'; 'p'; 'q'; 'r'; 's'; 't'; 'u'; 'v'; 'w'; 'x'; 'y'; 'z'];

ids_a = imageDatastore('a');
ids_b = imageDatastore('b');
ids_c = imageDatastore('c');
ids_d = imageDatastore('d');
ids_e = imageDatastore('e');
ids_f = imageDatastore('f');
ids_g = imageDatastore('g');
ids_h = imageDatastore('h');
ids_i = imageDatastore('i');
ids_j = imageDatastore('j');
ids_k = imageDatastore('k');
ids_l = imageDatastore('l');
ids_m = imageDatastore('m');
ids_n = imageDatastore('n');
ids_o = imageDatastore('o');
ids_p = imageDatastore('p');
ids_q = imageDatastore('q');
ids_r = imageDatastore('r');
ids_s = imageDatastore('s');
ids_t = imageDatastore('t');
ids_u = imageDatastore('u');
ids_v = imageDatastore('v');
ids_w = imageDatastore('w');
ids_x = imageDatastore('x');
ids_y = imageDatastore('y');
ids_z = imageDatastore('z');

wa = wczytaj(ids_a);
wb = wczytaj(ids_b);
wc = wczytaj(ids_c);
wd = wczytaj(ids_d);
we = wczytaj(ids_e);
wf = wczytaj(ids_f);
wg = wczytaj(ids_g);
wh = wczytaj(ids_h);
wi = wczytaj(ids_i);
wj = wczytaj(ids_j);
wk = wczytaj(ids_k);
wl = wczytaj(ids_l);
wm = wczytaj(ids_m);
wn = wczytaj(ids_n);
wo = wczytaj(ids_o);
wp = wczytaj(ids_p);
wq = wczytaj(ids_q);
wr = wczytaj(ids_r);
ws = wczytaj(ids_s);
wt = wczytaj(ids_t);
wu = wczytaj(ids_u);
wv = wczytaj(ids_v);
ww = wczytaj(ids_w);
wx = wczytaj(ids_x);
wy = wczytaj(ids_y);
wz = wczytaj(ids_z);

trainin = [wa;wb;wc;wd;we;wf;wg;wh;wi;wj;wk;wl;wm;wn;wo;wp;wq;wr;ws;wt;wu;wv;ww;wx;wy;wz]';
% trainout = [repmat([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_a),1);
%     repmat([0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_b),1);
%     repmat([0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_c),1);
%     repmat([0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_d),1);
%     repmat([0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_e),1);
%     repmat([0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_f),1);
%     repmat([0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_g),1);
%     repmat([0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_h),1);
%     repmat([0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_i),1);
%     repmat([0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_j),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_k),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_l),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_m),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_n),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0], get_length(ids_o),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0], get_length(ids_p),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0], get_length(ids_q),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0], get_length(ids_r),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0], get_length(ids_s),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0], get_length(ids_t),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0], get_length(ids_u),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0], get_length(ids_v),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0], get_length(ids_w),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0], get_length(ids_x),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0], get_length(ids_y),1);
%     repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1], get_length(ids_z),1)]';
trainout = [repmat([1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wa),1);
    repmat([0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wb),1);
    repmat([0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wc),1);
    repmat([0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wd),1);
    repmat([0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(we),1);
    repmat([0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wf),1);
    repmat([0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wg),1);
    repmat([0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wh),1);
    repmat([0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wi),1);
    repmat([0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wj),1);
    repmat([0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wk),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wl),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0], length(wm),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0], length(wn),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0], length(wo),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0], length(wp),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0], length(wq),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0], length(wr),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0], length(ws),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0], length(wt),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0], length(wu),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0], length(wv),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0], length(ww),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0], length(wx),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0], length(wy),1);
    repmat([0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1], length(wz),1)]';
% trainin(isinf(trainin)|isnan(trainin)) = 0;
% trainin(isinf(trainin)) = 0;
    
nn = feedforwardnet(26,'trainbr');
nn.trainParam.epochs = 1000;
nn = train(nn,trainin,trainout);


test = ~imbinarize(double(imread('test2.jpg'))/255);
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

ocr_model_dokladny_final3 = nn;
save ocr_model_dokladny_final3;

out = nn(wtest');

for i = 1:length(out)
%     out(:,i)
    dict(find(out(:,i) == max(out(:,i))))
end

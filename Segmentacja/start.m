%%  Start projektu
clear; clc;

filename = 'znak.jpg';

% bin bo zbinaryzowany obiekt
% uzycie funkcji zdefiniowanej na dole programu
[gray,bin] = bin_im(filename);

%% Ta czesc opcjonalna, bo z obrazkiem o tytule powyzej nie daje zauwazalnych roznic
% 
% % przed zmiana:
% subplot(1,2,1);
% imshow(bin);
% 
% % zamkniecie sluzy do pozbycia sie szumu czarnych punktow z bialego obiektu
% bin = imclose(bin, ones(2)); 
% 
% % po zmianie:
% subplot(1,2,2);
% imshow(bin);
%% Nadanie etykiet

[l,count] = bwlabel(bin); 
imshow(label2rgb(l));

%% Segmentacja wododzialowa

% czarnemu px przypisujemy najblizsza odleglosc do bialego
d = bwdist(bin,'quasi-euclidean'); 
l = watershed(d);

% efekt segmentacji w kolorze
imshow(label2rgb(l));

% inne przyklady wyswietlenia jesli sie przydadza na kiedys
% imshow(label2rgb(bin.*(l==1)));
% imshow(gray.*(l==1));
% imshow(bin.*(l==1));


%% Funkcja przygotowujaca obraz do obrobki zwraca jeden w odcieniach szarosci i drugi zbinaryzowany
function [gray_im,bim] = bin_im(x)
    % wczytanie obrazu
    im = double(imread(x))/255;
    subplot(1,2,1);
    imshow(im);
    
    % przeksztalcenie do odcieni szarosci
    % rgb2gray nie dziala dla bialo-czarnego znaku drogowego
    gray_im = im2gray(im);
    subplot(1,2,2);
    
    % wyswietlenie histogramu dla sprawdzenia progu dla ktorego najlepiej
    % bedzie binaryzowac obraz
    imhist(gray_im); 
    
    % binaryzacja
    % zaprzeczenie tylda dla bialego obrazu
    bim = ~imbinarize(gray_im,.25); 
    
    subplot(1,2,2);
    imshow(bim);
end

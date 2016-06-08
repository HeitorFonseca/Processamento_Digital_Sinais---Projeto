[im, MAP] = imread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\doc1.bmp');

imContrast = im*1;

level = graythresh(imContrast);
level = 0.455;

bw = im2bw(im,level);
%bw2 = bwareaopen(bw, 15);  %Remove small objects from binary image
bc = imcomplement(bw); % gives you the inverted version of b


figure;
title('Imagem Original');
imshow(im);

%{
figure;
title('Imagem com Contraste');
imshow(imContrast);
%}

figure;
title('Imagem preto e branco');
imshow(bw);


figure;
title('Imagem cor invertida');
imshow(bc);

cc = bwconncomp(bc, 8)
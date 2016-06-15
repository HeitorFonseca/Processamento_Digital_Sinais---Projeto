[im, MAP] = imread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\doc1.bmp');

%% tentativa de obter o level ideal 
level = graythresh(im);

%% Level por tentativa e erro
level = 0.455;

%% Binariza a Imagem
bw = im2bw(im,level);
%% Inverte as cores da imagem binarizada
bc = imcomplement(bw);

%% Plota a Imagem Original
figure;
title('Imagem Original');
imshow(im);

%{
figure;
title('Imagem com Contraste');
imshow(imContrast);
%}

%% Plota a imagem binarizada
figure;
title('Imagem preto e branco');
imshow(bw);

%% Plota a imagem com a cor invertida 
figure;
title('Imagem cor invertida');
imshow(bc);

resultado = bwconncomp(bc, 8)
im = imread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\lena_rings.bmp');
%% plota imagem original
figure
imshow(im)
%% plotar fft da imagem
figure
imfourier = fftshift(fft2(im));
imshow(log(abs(imfourier)), []); 
%% Aplica o filtro gaussiano com mascara [20 20] e parametro = 1.1
h = fspecial('gaussian', [20 20], 1.1);
y = imfilter(im,h);
%% Aumenta o contraste
y = y*1.25;
%% Diminui o brilho
y = y-10;
%% plota imagem final
figure
imshow(y);

im = imread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\lena_rings.bmp');
figure
imshow(im)
figure
imfourier = fftshift(fft2(im));
imshow(log(abs(imfourier)), []); 
figure
h = fspecial('gaussian', [20 20], 1.1);
y = imfilter(im,h);
y = y*1.25;           %aumenta contraste
y = y-10;
imshow(y);

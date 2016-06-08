im = imread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\dalton.bmp');
figure
imshow(im*1.2);

hsv = rgb2hsv(im);
h = hsv(:, :, 1); % Hue image.
s = hsv(:, :, 2); % Saturation image.
v = hsv(:, :, 3); % Value (intensity) image.


hsv(:,:,2) = hsv(:,:,2)*3;
hsv(:,:,2) = hsv(:,:,2)*1.8;
t = hsv2rgb(hsv);

t = t*5;

R = t(:, :, 1);
G = t(:, :, 2);
B = t(:, :, 3);


t(:, :, 1) = t(:, :, 1)+3;
%t(:, :, 2) = t(:, :, 2);
%t(:, :, 3) = t(:, :, 3);

figure
imshow(t);


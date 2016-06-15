im = imread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\dalton.bmp');
figure
imshow(im*1.2);

%% Converte RGB em HSV
hsv = rgb2hsv(im);
h = hsv(:, :, 1); % Hue image.
s = hsv(:, :, 2); % Saturation image.
v = hsv(:, :, 3); % Value (intensity) image.

%% Multiplico o vetor saturação em 5.4
hsv(:,:,2) = hsv(:,:,2)*3;
hsv(:,:,2) = hsv(:,:,2)*1.8;

%% Converte pra RGB
t = hsv2rgb(hsv);

%$ Aumento o contraste
t = t*5;

R = t(:, :, 1);
G = t(:, :, 2);
B = t(:, :, 3);

%% Aumento em 3 no vetor R
t(:, :, 1) = t(:, :, 1)+3;
%t(:, :, 2) = t(:, :, 2);
%t(:, :, 3) = t(:, :, 3);

%% Plota imagm resultante
figure
imshow(t);


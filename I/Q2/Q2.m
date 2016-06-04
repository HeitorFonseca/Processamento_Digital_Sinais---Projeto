[x,Fs] = audioread('C:\Users\hfa2\Desktop\PDS\Arquivos\sp04.wav');

D=500;
%a = 0.25;
%a = 0.50;
a = 0.90;

%% Sinal Atrasado
%sinald = delayseq(x, D);
%x2 = z + 0.5*sinald;

y = x(D+1: end) + a * x([D+1:end]-D);

y(1:D-1) = 0;
x(501:end) = y;

%% Definicao do Filtro
numerador = 1;                 % Numerador
denominador = zeros(1, D + 1); % Denominador
denominador(1) = 1;
denominador(D + 1) = a;

y2 = filter(numerador, denominador, x);

%% Plot
subplot(3, 1, 1);
plot(x);
title('Entrada');

soundsc(x,Fs);
pause
subplot(3, 1, 3);
plot(y2);
title('Entrada com eco e filtro');
soundsc(y2,Fs);



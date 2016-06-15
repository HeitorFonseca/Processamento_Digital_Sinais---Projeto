clear;
[x,Fs] = audioread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\teste_de_som.wav')
fs = Fs;

% Taxa de amostragem = 8000 amostras/s

X = fft(x);
%% Manipulacao do sinal como instruído na questao
y = x .* 30;
n = (0:length(x) - 1);
z = y + (sin(2 * pi * 466.16*n))';

Z = fft(z);

figure
spectrogram(z, 256, 250, 1E3, 'yaxis');
title('Espectrograma');

%% Filtro butterworth

[B, A] = butter(7, [0.3125, 0.3375], 'stop');       %Cria o filtro 
filtrado = filter(B, A, z);                         %Aplica o filtro ao sinal
F = fft(filtrado);                                  %FFT do sinal resultante

figure; 
subplot(3, 2, 1);
plot(x);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Original no Tempo');

subplot(3, 2, 2);
stem(n*fs/length(X), abs(X), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Original');

subplot(3, 2, 3);
plot(z);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal com ruido no Tempo');

subplot(3, 2, 4);
stem(n*fs/length(Z), abs(Z), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - com ruido');
grid on;

subplot(3, 2, 5);
plot(filtrado);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Filtrado no Tempo');

subplot(3, 2, 6);
stem(n*fs/length(F), abs(F), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Filtrado');

sound(filtrado);
%pause

%% Filtro de cheby 
[b2,a2] = cheby1(10,1,[0.3125 0.3375],'stop');
filtrado = filter(b2,a2,z);
F = fft(filtrado);
figure;
subplot(3, 2, 1);
plot(x);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Original no Tempo');

subplot(3, 2, 2);

stem(n*fs/length(X), abs(X), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Original');

subplot(3, 2, 3);
plot(z);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal com ruido no Tempo');

subplot(3, 2, 4);
stem(n*fs/length(Z), abs(Z), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - com ruido');
grid on;

subplot(3, 2, 5);
plot(filtrado);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Filtrado no Tempo');

subplot(3, 2, 6);
stem(n*fs/length(F), abs(F), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Filtrado');

sound(filtrado);
%pause

%% Filtro FIR Blackman 
l = [0.3125 0.3375]/Fs;
w = blackman(301);
a2 = fir1(300,[0.30 0.35],'stop',w);  
filtrado = filter(a2,1,z);

F = fft(filtrado);
figure;
subplot(3, 2, 1);
plot(x);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Original no Tempo');

subplot(3, 2, 2);

stem(n*fs/length(X), abs(X), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Original');

subplot(3, 2, 3);
plot(z);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal com ruido no Tempo');

subplot(3, 2, 4);
stem(n*fs/length(Z), abs(Z), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - com ruido');
grid on;

subplot(3, 2, 5);
plot(filtrado);
xlabel('Tempo');
ylabel('Amplitude');
title('Sinal Filtrado no Tempo');

subplot(3, 2, 6);
stem(n*fs/length(F), abs(F), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Filtrado');


sound(filtrado);


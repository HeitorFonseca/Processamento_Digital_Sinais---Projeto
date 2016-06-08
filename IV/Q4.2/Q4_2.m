clear;
[x,Fs] = audioread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\teste_de_som.wav')
fs = Fs;


% Taxa de amostragem = 8000 amostras/s

X = fft(x);

y = x .* 30;

n = (0:length(x) - 1);
ruido = (sin(2 * pi * 466.16*n))';

z = y + ruido;
Z = fft(z);

beginfreq = 1250/(fs/2);
endfreq = 1350/(fs/2);
[B, A] = butter(7, [beginfreq, endfreq], 'stop');

filtrado = filter(B, A, z);
F = fft(filtrado);

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
title('Sinal Ruidoso no Tempo');

subplot(3, 2, 4);
stem(n*fs/length(Z), abs(Z), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia - Ruidoso');
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





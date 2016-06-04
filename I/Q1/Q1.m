%% Inicializacao do sinal - frequencia - periodo
n = 0 : 0.01 : 10;
len = length(n);
fs = 2 * len; % Freq de amostragem >= 2*fs -> Criterio de nyquist
Ts = 1/fs;  % Periodo de amostragem

%% Definicao do Sinal
y = sin(20*pi*n) + cos(30*pi*n);
z = sin(40*pi*n) + cos(60*pi*n);
w = [y z];                      %Concatena os sinais y e z

%% FFT dos 3 sinais
Y = fft(y);
Z = fft(z);
W = fft(w);

%% Plot Magnitude e Fase letra a)
figure
m = 0:length(Y) - 1;
subplot(2, 1, 1);
stem(m*fs/length(Y), abs(Y), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia');

subplot(2, 1, 2);
stem(m*fs/length(Y), angle(Y), 'b');
xlabel('Frequencia em Hz');
ylabel('Angulo');
title('Fase');

%% Plot Magnitude e Fase letra b)
figure
m = 0:length(Z) - 1;
subplot(2, 1, 1);
stem(m*fs/length(Z), abs(Z), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia');

subplot(2, 1, 2);
stem(m*fs/length(Z), angle(Z), 'b');
xlabel('Frequencia em Hz');
ylabel('Angulo');
title('Fase');

%% Plot Magnitude e Fase letra c)
figure
m = 0:length(W) - 1;
subplot(2, 1, 1);
stem(m*fs/length(W), abs(W), 'b');
xlabel('Frequencia em Hz');
ylabel('Magnitude');
title('Magnitude da Resposta em Frequencia');

subplot(2, 1, 2);
stem(m*fs/length(W), angle(W), 'b');
xlabel('Frequencia em Hz');
ylabel('Angulo');
title('Fase');

%% Plot Espectograma letra e)
figure
subplot(1, 1, 1);
spectrogram(w, 256, 250, 1E3, 'yaxis');
title('Espectrograma');

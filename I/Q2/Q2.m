[x,Fs] = audioread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\sp04.wav');
len = length(x);
D=500;
%a = 0.25;
%a = 0.50;
a = 0.90;

%% Sinal Atrasado
x2=[x', zeros(1,D)];
x2(D:D+len-1)=x2(D:D+len-1)+x'*a; 


%{
 %% Definicao do Filtro reverberador1
numerador = 1;                 
denominador = zeros(1, D + 1); 
denominador(1) = 1;
denominador(D + 1) = -a;

y2 = filter(numerador, denominador, x2);
%}

%%{
%% Definicao do Filtro reverberador2
numerador = 1;                 
denominador = zeros(1, D + 1); 
denominador(1) = 1;
denominador(D + 1) = a;


y2 = filter(numerador, denominador, x2);
%%}

%% Plot
subplot(3, 1, 1);
plot(x);
title('Sinal original');

subplot(3, 1, 2);
plot(x2);
title('Sinal original com eco');

subplot(3, 1, 3);
plot(y2);
title('Sinal com eco filtrado');

%soundsc(y2,Fs); Ouvir o som



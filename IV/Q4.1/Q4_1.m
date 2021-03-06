[x,Fs] = audioread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\dg105.wav');
[x2,Fs] = audioread('C:\Users\hfa2\Desktop\Processamento_Digital_Sinais---Projeto\Arquivos\or105.wav');



%% Plota sinal degradado
figure
plot(x), title('Sinal Degradado');
figure
plot(x2), title('Sinal original');

%%  
% step 1 - quebrar em frames de 0.1s
duracao = 0.1;
lenFrame = duracao*Fs;
N = length(x);
numFrames = floor(N/lenFrame);

%novoSinal = zeros(N,1);
novoSinal = zeros(1,N);

contador = 0;

for t = 1 : numFrames
    
       %% Parte do vetor que corresponde do frame de f-1 at� f
       frame = x((t-1)*lenFrame+1 : lenFrame*t);
       
       %% Verifica so valor de amplitude maximo do frame selecionado acima eh maior que o limiar
       if(max(frame) > 0.035) % se for -> adiciona ao novo sinal
           contador = contador+1;  
           novoSinal((contador-1)*lenFrame + 1 : lenFrame*contador) = frame;
       end
       
end

%% Plota sinal "filtrado" 
figure
plot(novoSinal), title('Sinal filtrado');

sound(novoSinal);

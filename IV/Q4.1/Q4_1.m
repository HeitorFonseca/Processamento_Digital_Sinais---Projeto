[x,Fs] = audioread('C:\Users\hfa2\Desktop\New folder\Processamento_Digital_Sinais---Projeto\Arquivos\dg105.wav');

plot(x), title('Degradado');



% step 1 - quebrar em frames de 0.1s
frame_duration = 0.1;
frame_len = frame_duration*Fs;
N = length(x);
num_frames = floor(N/frame_len);

new_sig = zeros(N,1);
count = 0;

for k = 1 : num_frames
    
       % extrai frame do sinal
       frame = x( (k-1)*frame_len +1 : frame_len*k);
       
       % step 2 - identificar os frames que nao sao silencio
       max_val = max(frame);
       
       if(max_val > 0.04)
           % frame nao silencioso
           count = count+1;
           new_sig( (count-1)*frame_len + 1 : frame_len*count) = frame;
       end
       
end
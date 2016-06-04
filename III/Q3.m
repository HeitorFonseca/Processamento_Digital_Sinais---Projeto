im101 = imread('saida_101.bmp');
im103 = imread('saida_103.bmp');
im109 = imread('saida_109.bmp');
im111 = imread('saida_111.bmp');
im117 = imread('saida_117.bmp');
im119 = imread('saida_119.bmp');

%%{
saida102 = (im101./2+im103./2);
saida110 = (im109./2+im111./2);
saida118 = (im117./2+im119./2);
%%}


h = fspecial('average',[5 5])
saida102 = imfilter(saida102,h);
saida110 = imfilter(saida102,h);
saida118 = imfilter(saida102,h);

imwrite(saida102,'saida_102.bmp');
imwrite(saida110,'saida_110.bmp');
imwrite(saida118,'saida_118.bmp');


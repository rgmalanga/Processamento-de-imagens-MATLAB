#somando imagens com ruidos aleatorios afim de chegar em uma media que diminui o ruido
%pkg load image
n=100;
x= imread("lena512.bmp");
for i=1:n
r(:,:,i)= imnoise(x, "gaussian"); #geraçao dos ruidos aleatorios 
endfor

z = zeros(512, 512); #variavel nula
for i = 1:n
  z += double(r(:,:,i));
  if (mod(i, 10) == 5)
     #figure;imshow(uint8(round(z/i)));
  endif
endfor
z = uint8(round(z/n));
figure;
subplot(1,3,3);imshow(z);title("tratada");
subplot(1,3,1);imshow(x);title("original");
subplot(1,3,2);imshow(r(:, :, 1));title("com ruidos");





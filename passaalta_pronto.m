
#pkg load image 
#pkg load signal
x= imread('blurrymoon.bmp');
p=padarray(x, [2,2]); #aumentar a matriz da imagem( adicionando duas linhas e duas colunas)
w= [1 1 1; 1 -8 1; 1 1 1]; #filtro passa alta, destaca bordas
#w=[0 1 0; 1 -4 1; 0 1 0]; #filtro passa alta, destaca bordas
[nlin, ncol] = size(x);
[wnlin, wncol] = size(w);
g= zeros(nlin,ncol);
p= double(p);
for i= 1:nlin 
  for j= 1:ncol 
    for k= 1: wnlin
      for l= 1:wncol
        g(i, j) +=  w(k,l)*p(i+k-1, j+l-1);
      endfor
    endfor
  endfor
endfor
g= uint8(round(g)); #se for filtro de media, tem q dividir por 9 (matriz 3x3)
z= imadd(x,g);
figure;
subplot(1,3,2);imshow(g);title("imagem filtrada");
subplot(1,3,3);imshow(z);title("aguçamento das bordas") 
subplot(1,3,1);imshow(x);title("imagem original")
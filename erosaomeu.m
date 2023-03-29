
pkg load image 
pkg load signal
#fit = erosao 
x= imread('bubbles.tif');
p=padarray(x, [2,2]); #aumentar a matriz da imagem( adicionando duas linhas e duas colunas)
w= [1 1 1; 1 1 1; 1 1 1]; #filtro strel('square, 3)  ###dilatação tem que transposta a matriz 
o= [2, 2];
n=0
[ol,oc] = size(o);
[nlin, ncol] = size(x);
[wnlin, wncol] = size(w);
g= zeros(nlin,ncol);
p= double(p);
for i= 1:nlin 
  for j= 1:ncol 
    for k= 1: wnlin
      for l= 1:wncol
        if (w(k,l)==1)
          if (p(i+k-1, j+l-1) == w(k,l))
              n = n +1
              if (n = sum(sum(w(k,l)))
                g (i+ol-1, j+oc-1) = 1 
              endif
          endif 
         endif
        endfor
    endfor
  endfor
endfor

figure
subplot(1,2,1);imshow(x);title('original');
subplot(1,2,2);imshow(g);title('erodida');

[nl,nc]=size(x);
#zerando a matriz resultado da aplica��o da mascara
masc=zeros(nl,nc);

#mascara passa-alta 1
#w=[0 1 0;1 -4 1;0 1 0];

#mascara passa-alta 2
w=[-1 -1 -1;-1 8 -1;-1 -1 -1];

w=fliplr(w);
[wl,wc]=size(w);

#adiciona duas linhas e duas colunas
p=zeros(nl+2,nc+2);
p=uint8(p);

#mascara 3x3 tem que adicionar 4 linhas e 4 colunas
for i=3:nl
  for j=3:nc
    p(i,j)=x(i-2,j-2);
  endfor
endfor

#figure;imshow(x)
#figure;imshow(p)

p=double(p);

for i=1:nl
  for j=1:nc
    for k=1:wl   #linha da mascara
      for l=1:wc #coluna da mascara
        masc(i,j)+=w(k,l)*p(i+k-1,j+l-1);
      endfor
    endfor     
  endfor
endfor

#realiza o agucamento da imagem
for j=1:nl
  for k=1:nc 
    adi(j,k)=uint8(double(x(j,k))+double(masc(j,k)));
  endfor  
endfor

figure;
subplot(1,2,1);imshow(x);title("Imagem Original")
subplot(1,2,2);imshow(adi);title("Imagem Filtrada - Passa-Alta 8 Vizinhos")


x=imread("lena512.bmp");
[nl,nc]=size(x);
p=zeros(nl+2,nc+2);
masc1=zeros(nl,nc);
masc2=masc1;
p=uint8(p);

for i=3:nl
  for j=3:nc
    p(i,j)=x(i-2,j-2);
  endfor
endfor
p=double(p);

w=[-1; 1]; #filtro vertical
[wl,wc]=size(w);

for i=1:nl
  for j=1:nc
    for k=1:wl #linha da mascara
      for l=1:wc  #coluna da mascara
        masc1(i,j)+=w(k,l)*p(i+k-1,j+l-1);
      endfor
    endfor     
  endfor
endfor

w=[-1 1];   #filtro horizontal
[wl,wc]=size(w);

for i=1:nl
  for j=1:nc
    for k=1:wl%linha da mascara
      for l=1:wc%coluna da mascara
        masc2(i,j)+=w(k,l)*p(i+k-1,j+l-1);
      endfor
    endfor     
  endfor
endfor
masc=uint8(round(masc1+masc2));%para o filtro da media divide pelo numero de pontos que a mascara pega

figure;
subplot(2,2,1);imshow(masc1);title("Filtro Vertical")
subplot(2,2,2);imshow(masc2);title("Filtro Horizontal")
subplot(2,2,3);imshow(masc);title("Filtro Total")
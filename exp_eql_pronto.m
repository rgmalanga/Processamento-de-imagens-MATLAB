
#expansao de histograma
#pkg load image -- só no prompt 
x= imread("sangue.jpg"); #lê a imagem
rmax= double(max(max(x))); # valor maximo da matriz
rmin= double(min(min(x))); # minimo da matriz
L=256;
[a,b]= size(x); # a = linhas / b= colunas

for i= 1:a
  for j= 1:b
    exphist(i,j)= uint8(round(((double(x(i,j))- rmin)/(rmax-rmin))*(L-1))); 
  end
end

   
# equalizaçao de histograma
y= exphist;
L=256;
[nlin, ncol]=size(y); #tamanho da matriz da imagem y

e= imhist(y); #histograma da imagem y

eql = zeros(nlin, ncol); #matriz de zeros
for i= 1:nlin
  for j= 1:ncol
    for k= 1:y(i,j) # faz o somatorio do histograma
      eql(i,j) += double(e(k));
    end
    eql(i,j) *= (L-1)/(nlin*ncol);
    eql(i,j) = round(eql(i,j));
  end
end
eql=uint8(eql);

figure
subplot(1, 3, 1);imshow(x);title("original");
subplot(1, 3, 2);imshow(y);title("imagem com histograma apenas expandido");
subplot(1, 3, 3);imshow(eql);title("imagem com histograma expandido e equalizado");
    

figure
subplot(1,3,1);imhist(x);title("histograma original");
subplot(1,3,2);imhist(y);title("histograma apenas expandido");
subplot(1,3,3);imhist(eql);title("histograma expandido e equalizado");







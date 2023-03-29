# gerar ruido
x=imread("cameraman.tif");
#y=imnoise(x,'gaussian');
#imshow(y)

n=10;
for m=1:n 
  tot(:,:,m)=imnoise(x,'gaussian'); #gera imagens com ruido da imagem em x
endfor

[nl,nc]=size(x);
dis=zeros(nl,nc);

for m=1:n 
  dis+=double(tot(:,:,m));
endfor
y=uint8(round(dis)/m);


figure;
subplot(1,3,1);imshow(x);title("Imagem Original")
subplot(1,3,2);imshow(y);title("Imagem com N Medias")
subplot(1,3,3);imshow(tot(:,:,1));title("Imagem com Ruidos")

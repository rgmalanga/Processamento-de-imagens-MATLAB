#subtraçao
clear all
x=imread("rx1.jpg");
y=imread("rx2.jpg");
[nlin,ncol]=size(x);

for j=1:nlin
  for k=1:ncol 
    sub(j,k)=uint8(double(x(j,k))-double(y(j,k)));    
  endfor  
endfor

figure;
subplot(1,3,1);imshow(x);title("Imagem 1")
subplot(1,3,2);imshow(y);title("Imagem 2")
subplot(1,3,3);imshow(sub);title("Imagem resultante")
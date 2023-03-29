#histograma
x=imread("sangue.jpg");
[nlin,ncol]=size(x);

his(1:256)=zeros;
l=0:255;

for i=1:nlin
  for j=1:ncol
    q=x(i,j);
      his(q)+=1;    
  endfor  
endfor




figure;subplot(1,2,1);bar(l, his, 'FaceColor', 'r');xlabel('escala de cinzas', 'FontSize', 10);ylabel('pixels', 'FontSize', 10);
title('Meu Histograma', 'FontSize', 11);
subplot(1,2,2);imhist(x);title("Funçao Pronta")
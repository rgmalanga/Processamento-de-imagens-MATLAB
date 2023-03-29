#adiçao
x=imread("rx1.jpg");
y= imread("rx2.jpg");
[nlin, ncol] = size(x);

for i= 1:nlin
  for j= 1:ncol    
    ad(i,j) = uint8(double(x(i,j)) + double(y(i,j)));
  endfor
endfor

figure;
subplot (1, 3, 1);imshow(x); title("exposiçao 1");
subplot (1, 3, 2);imshow(y); title("exposiçao 2");
subplot (1, 3, 3);imshow(ad); title("sobreposiçao das imagens");

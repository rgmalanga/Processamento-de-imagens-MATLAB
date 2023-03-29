#negativo da imagem
x= imread("breast01.bmp");
y= uint8(-1*(double(x)-255));
subplot(2, 4, 1) 
imshow(x)
 title("original")
subplot(2, 4, 2)
 imshow(y) 
title("negativa")

#binarizaçao da imagem

b= x>= 200;
subplot(2, 4, 3)
imshow(b)
title("binaria")

#aumentando o brilho

z= x+ 93;
subplot(2, 4, 4)
imshow(z)
title("mais brilho")

#diminuindo o brilho

w= x - 93;
subplot(2, 4, 5)
imshow(w)
title("menos brilho")

#aumento de contraste (limiares maiores)

limiarA= 193;
ui= double(x)/limiarA;
f= ui.^2;
uf= uint8(f*limiarA);
subplot(2, 4, 6)
imshow(uf)
title("mais contraste")

#diminuiçao de contraste (limiares menores)

limiarB= 50;
ki= double(x)/limiarB;
o=ki.^2;
kf=uint8(f*limiarB);
subplot(2, 4, 7)
imshow(kf)
title("menos contraste")

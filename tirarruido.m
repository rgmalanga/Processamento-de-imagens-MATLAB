#tirar ruido
##abre e fecha 
x = imread("digital.tif");
 se = strel('square', 3);
#abertura
     #erosao       
         x2 =imerode(x, se); 
     #dilataçao 
         x3 =imdilate(x2, se); 
#fechamento
     #dilata 
        A2 =imdilate(x3, se); 
     #erode
        A3 =imerode(A2, se); 

#figure
#subplot(2,2,1);imshow(x3);title("inicio da abertura(erodida)"); 
#subplot(2,2,2);imshow(x3);title("final da abertura(erodida e dilatada)"); 
#subplot(2,2,3);imshow(A2);title("inicio fechamento(dilatada)");
#subplot(2,2,4);imshow(A3);title("final do fechamento(dilatada e erodida)");
figure
subplot(1,2,1);imshow(x);title('original');
subplot(1,2,2);imshow(A3);title("sem ruidos");


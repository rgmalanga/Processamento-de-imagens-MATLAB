#extraçao de fronteiras
x = imread("digital.tif"); 
se = strel('square', 3);    
 
 #borda interna---->  A -(A*erodida*)
      #erosao
        x2 =imerode(x, se); 
        x3=(x -x2);

 #borda externa --> ## (A*dilatada*) - A
      #dilataçao 
        x4 =imdilate(x, se); 
        x5=(x4 - x);
figure
subplot(1,2,1);imshow(x3);title('borda interna');
subplot(1,2,2);imshow(x5);title('borda externa');
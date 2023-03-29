#segmentacao/binarizacao de uma imagem
x=imread( "cameraman.tif" );
limiar=120; #hardtrash/limiar duro,definido pelo meio da distribuicao do histograma
[nl nc]=size(x);

for i=1:nl
  for j=1:nc
    if x(i,j)<=limiar
      b(i,j)=0;  
    elseif
      b(i,j)=255;
    end
  end
end

figure;
subplot(1,2,1);imshow(x);title("Imagem Original")
subplot(1,2,2);imshow(b);title("Imagem Segmentada")
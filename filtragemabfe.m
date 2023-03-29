#Abertura da imagem

x=imread("quadradinhos.jpg");
x=im2bw(x);
w=[1 1 1 1];
[wl wc]=size(w);
[nl nc]=size(x);
dil= zeros(wl,wc);
xpad=padarray(x,[wl wc],1);

# erosao
for i=1:nl
  for j=1:nc
    aux=xpad(i:(i+wl-1),j:(j+wc-1));
    if (aux==w)
       ero(i,j)=1;
    end
  end
end

# dilatacao
for i=1:nl
  for j=1:nc
    if (ero(i,j)==1)
      for k=1:wl
        for l=1:wc
          if(w(k,l)==1)
          open(i+k,j+l)=1;
          end
        end
      end
    end
  end
end

#fechamento da imagem 
y=open;
y=im2bw(y);
w1=[1 1 1 1];
[w1l w1c]=size(w1);
[n1l n1c]=size(y);
dil1= zeros(w1l,w1c);

# dilatacao
for i=1:n1l
  for j=1:n1c
    if (y(i,j)==1)
      for k=1:w1l
        for l=1:w1c
          if(w1(k,l)==1)
          dil1(i+k,j+l)=1;
          end
        end
      end
    end
  end
end

# erosao
xpad1=padarray(dil1,[w1l w1c],1);
for i=1:n1l
  for j=1:n1c
    aux=xpad1(i:(i+w1l-1),j:(j+w1c-1));
    if (aux==w1)
       close(i,j)=1;
    end
  end
end
figure;
subplot(1,2,1);imshow(x);title('Imagem Original')
subplot(1,2,2);imshow(close);title('Imagem Processada com abertura e Fechamento')
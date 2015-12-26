function [imatge] = Indane(imag)

%imag=arxiu;
%imag=arxiu;
%figure, imshow(imag);
%Passem a escala de grisos
imag2=double(rgb2gray(imag));
%Convertim tot a valors del rang [0,1]
In=imag2/255;
%fase d'il·luminació-->In'=((In^0.24)+((1-In)*0.5)+(In^2))/2
Inprima=((In.^0.24)+((1-In)*0.5)+(In.^2))/2;
%figure, imshow(Inprima,[]), title('inprima');
%fase de contrast
cont1 = fspecial('gaussian',[8 8],5);
cont2 = fspecial('gaussian',[8 8],20);
cont3 = fspecial('gaussian',[8 8],240);
contrast = (cont1+cont2+cont3)/3;

%fem la convolució entre la imatge original sense normalitzar i la gaussiana
Iconv = imfilter(imag2,contrast,'conv');
%figure, imshow(Iconv,[]), title('Iconv');
%Iconv conté la informació per comparar amb el pixel central quan fem el contrast
%calculem l'exponent pel contrast
r=Iconv./imag2;
%contrast+il·luminacio-->R=255*In^r
R = 255*Inprima.^r;
%recuperem RGB amb la fòrmula, tenint en compte els canvis fets
im=double(imag);
imRGB(:,:,1)=R.*(im(:,:,1)./imag2);
imRGB(:,:,2)=R.*(im(:,:,2)./imag2);
imRGB(:,:,3)=R.*(im(:,:,3)./imag2);
imatge = uint8(imRGB);
%figure, imshow(imatge,[]), title('imatge final');

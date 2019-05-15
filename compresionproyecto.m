% -------------------------------------------------------------------------
% Nombre del programa: compresionproyecto.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 12 de 2016
% Breve descripcion del programa: Permite la comprensi�n de im�genes
% mediante la t�cnica SVD
% Datos de entrada:
% imagen: Imagen a ser evaluado por el m�todo SVD
% k: n�mero de valores singulares
% Datos de salida:
% U1: Matriz ortogonal de tama�o mxm para el color rojo
% S1: Matriz diagonal con los valores singulares de tama�o mxn para el
% color rojo
% V1: Matriz ortogonal de tama�o nxn para el color rojo
%..........................................................................
% U2: Matriz ortogonal de tama�o mxm para el color verde
% S2: Matriz diagonal con los valores singulares de tama�o mxn para el
% color verde
% V2: Matriz ortogonal de tama�o nxn para el color verde
%..........................................................................
% U3: Matriz ortogonal de tama�o mxm para el color azul
% S3: Matriz diagonal con los valores singulares de tama�o mxn para el
% color azul
% V3: Matriz ortogonal de tama�o nxn para el color azul
% -------------------------------------------------------------------------

function [U1,S1,V1,U2,S2,V2,U3,S3,V3]=compresionproyecto(imagen,k)
% Lectura de la imagen
colorimage = imread(imagen);
% Guarda la imagen en formato .mat
save('imagen.mat','colorimage');
% Mensaje para el usuario
fprintf('Generando las gr�ficas espere...\n\n'); 
%..........................................................................
% Utilizaci�n del color rojo de la matriz imagen
bwimage1 = colorimage(:, :, 1); 
% Imagen como ingreso, y retorna una imagen de clase double
original1 = im2double(bwimage1);
% Valores de U,S y V para la matriz de color rojo, utilizando el esquema
% SVD para valores singulares
[U1,S1,V1]=partial_SVD(original1,k);
% Descomposici�n parcial de la imagen en rojo
AN1 = U1*S1*V1';   
%--------------------------------------------------------------------------
%..........................................................................

%..........................................................................
% Utilizaci�n del color verde de la matriz imagen
bwimage2 = colorimage(:, :, 2); 
% Imagen como ingreso, y retorna una imagen de clase double
original2 = im2double(bwimage2); 
% Valores de U,S y V para la matriz de color verde, utilizando el esquema
% SVD para valores singulares
[U2,S2,V2]=partial_SVD(original2,k);
% Descomposici�n parcial de la imagen en verde
AN2 = U2*S2*V2'; 
%--------------------------------------------------------------------------
%..........................................................................

%..........................................................................
% Utilizaci�n del color azul de la matriz imagen
bwimage3 = colorimage(:, :, 3); 
% Imagen como ingreso, y retorna una imagen de clase double
original3 = im2double(bwimage3); 
% Valores de U,S y V para la matriz de color azul, utilizando el esquema
% SVD para valores singulares
[U3,S3,V3]=partial_SVD(original3,k);
% Descomposici�n parcial de la imagen en azul6
AN3 = U3*S3*V3'; 
%--------------------------------------------------------------------------
%..........................................................................

% Graficaci�n de la imagen real y la aproximaci�n de la imagen real
% concatenando sus tres colores (rojo,verde,azul)
figure
hold on
subplot(1,2,1) 
imshow(colorimage);
title('Imagen real')
subplot(1,2,2)
% Concatenaci�n de las tres aproximaciones de las matrices de los colores
% rojo, verde y azul
rgbImage = cat(3, AN1,AN2,AN3);
imshow(rgbImage);
title(['Aproximaci�n de la imagen con k= ' num2str(k)])
%--------------------------------------------------------------------------
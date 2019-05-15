% -------------------------------------------------------------------------
% Nombre del programa: error_relativo_SVD.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 12 de 2016
% Breve descripcion del programa: Permite encontrar los errores relativos y
% gr�fica respectiva de la imagen, con la descomposici�n SVD, con distintos
% valores de k (valores singulares)
% Datos de entrada:
% imagen: Imagen a ser evaluado por el m�todo SVD
% Datos de salida:
% kvector: N�mero de valores singulares utilizados en la aproximaci�n de la
% matriz
% errorR: Error relativo de la imagen con el color rojo
% errorV: Error relativo de la imagen con el color verde
% errorA: Error relativo de la imagen con el color azul
% Gr�fica del error relativo de la imagen 
% -------------------------------------------------------------------------

function [kvector,errorR,errorV,errorA]=error_relativo_SVD(imagen)
% Vector de los errores relativos de los diferentes colores de la imagen
errorR=[];
errorV=[];
errorA=[];
kvector=[];
% Lectura de la imagen
colorimage = imread(imagen);
% Guarda la imagen en formato .dat
save('imagen.dat','colorimage');
% Mensaje para el usuario
fprintf('Generando las gr�ficas espere...\n\n'); 

% Bucle que permite calcular el error relativo de la imagen a diferentes
% valores de k
%==========================================================================
for k=5:5:45
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
    hold on
    %Error relativo del color rojo de la imagen
    error_rojo=norm((original1-AN1),2)/norm(AN1,2);
    errorR=[errorR error_rojo];
    %Error relativo del color verde de la imagen
    error_verde=norm((original2-AN2),2)/norm(AN2,2);
    errorV=[errorV error_verde];
    %Error relativo del color azul de la imagen
    error_azul=norm((original3-AN3),2)/norm(AN3,2);
    errorA=[errorA error_azul];
    % Graficaci�n de los errores respectivos
    plot(k,error_rojo,'r*')
   
    % Valores de k usados
    kvector=[kvector k];
end
%==========================================================================
% Transposici�n de los errores, para tener obtener error tipo columna
errorR=errorR';
errorV=errorV';
errorA=errorA';
% Transposici�n del vector k, para tener obtener k tipo columna
kvector=kvector';
% A�adir leyenda y nombre a los ejes de la gr�fica
legend('E.R - Imagen Color Rojo')
xlabel('Valores de p usados')
ylabel('Error relativo del color rojo rojo de la imagen')
%--------------------------------------------------------------------------


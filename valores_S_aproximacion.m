% -------------------------------------------------------------------------
% Nombre del programa: valores_S_aproximacion.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 14 de 2016
% Breve descripcion del programa: Permite mostrar y graficar los valores 
% singulares de la matriz que representa cada imagen.
% Datos de entrada:
% imagen1: Imagen 1 a ser evaluado por el método SVD
% imagen2: Imagen 2 a ser evaluado por el método SVD
% k: número de valores singulares
% Datos de salida:
% puntos: número del valor singular calculado
% VSR1: Valores singulares de la primera imagen con el color rojo
% VSV1:Valores singulares de la primera imagen con el color verde
% VSA1:Valores singulares de la primera imagen con el color azul
%..........................................................................
% VSR2:Valores singulares de la segunda imagen con el color rojo
% VSV2:Valores singulares de la segunda imagen con el color verde
% VSA2:Valores singulares de la segunda imagen con el color azul
% -------------------------------------------------------------------------

function [puntos,VSR1,VSV1,VSA1,VSR2,VSV2,VSA2]=valores_S_aproximacion(imagen1,imagen2,k)
% Evaluación de la matrices de las imagenes por medio de la compresión SVD
[U1,S1,V1,U2,S2,V2,U3,S3,V3]=compresionproyecto(imagen1,k);
[U11,S11,V11,U22,S22,V22,U33,S33,V33]=compresionproyecto(imagen2,k);
% Número de los valores singulares
puntos=[];
% Valores singulares de la imagen 1
%==========================================================================
VSR1=diag(S1);
VSV1=diag(S2);
VSA1=diag(S3);
%==========================================================================

% Valores singulares de la imagen 2
%==========================================================================
VSR2=diag(S11);
VSV2=diag(S22);
VSA2=diag(S33);
%==========================================================================
figure
% Bucle que permite graficar los puntos de los valores singulares y los
% valores singulares de las matrices de las imagenes 1 y 2
%..........................................................................
for i=1:k
    puntos=[puntos; i];
    hold on
    plot(i,S1(i,i),'r*')
    plot(i,S2(i,i),'g*')
    plot(i,S3(i,i),'b*')
  
    
end
legend('Valor S. Rojo','Valor S. Verde','Valor S. Azul')
xlabel('Número del valor singular')
ylabel('Valores singulares de los diferentes colores de la imagen "chica"')
figure
for j=1:k
  
    hold on
    plot(j,S11(j,j),'ro')
    plot(j,S22(j,j),'go')
    plot(j,S33(j,j),'bo')
    
end
%..........................................................................
% Añadir leyenda y nombre a los ejes de la gráfica
legend('Valor S. Rojo','Valor S. Verde','Valor S. Azul')
xlabel('Número del valor singular')
ylabel('Valores singulares de los diferentes colores de la imagen "vegetales"')
%--------------------------------------------------------------------------

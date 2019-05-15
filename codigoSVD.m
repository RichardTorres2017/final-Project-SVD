% -------------------------------------------------------------------------
% Nombre del programa: codigoSVD.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 12 de 2016
% Breve descripcion del programa: Permite calcular la descomposición SVD
% Datos de entrada:
% A: matriz de orden n
% k: número de valores singulares
% Datos de salida:
% U1: Matriz ortogonal de tamaño mxm 
% S1: Matriz diagonal con los valores singulares de tamaño mxn 
% V1: Matriz ortogonal de tamaño nxn 
% -------------------------------------------------------------------------

function [U1,S1,V1]=codigoSVD(A,k)
% Vector que contiene las columnas de la matriz U, cuando aún no es
% ortogonalizada
vectoru1=[];
% Formar una matriz simétrica por medio de A'*A
A1=A'*A;
% Evalua el autopar de la matriz dependiendo del valor de k, usando el 
% método de Deflación de Hotelling
[AD1, autoval1, autovec1] = main_eig_def(A1,k);
% Bucle que permite calcular los valores singulares para la matriz 
%--------------------------------------------------------------------------
for j=1:k
    % Valores singulares, son las raíces de los autovalores de la matriz
    valores_singulares1=sqrt( autoval1(1:j));
end
%--------------------------------------------------------------------------
% Formación de la matriz diagonal S1 con los valores singulares
S1=diag(valores_singulares1);
% Ortonormalizar las columnas  de los autovectores calculados por medio de
%  Gram-Schmidt
[V1,R1]=gschmidt(autovec1);
% Bucle que permite calcular las columnas para la matriz U1 con la fórmula
% u1=A*v1/(valor singular)
%--------------------------------------------------------------------------
for i=1:k
u1=(A*V1(:,i))/((valores_singulares1(i)));
vectoru1=[vectoru1 u1];
end
%--------------------------------------------------------------------------
vectoru1;
%Ortonormalizar las columnas de la matriz U1
[U1,R]=gschmidt(vectoru1);
%..........................................................................
%--------------------------------------------------------------------------
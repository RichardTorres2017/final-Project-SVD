% -------------------------------------------------------------------------
% Nombre del programa: Def_Hotelling.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 10 de 2016
% Breve descripcion del programa: Evalua el autopar de módulo máximo de A
% de orden n, por medio del método de deflación de Hotelling
% Datos de entrada:
% A: Matriz simétrica de orden n
% Datos de salida:
% ADe: Matriz similar que representa una deflación de A por el método de
% Hotelling. Si el espectro de A es {l1,l2, ...,ln} tal que:
% |l1| > |l2| >= ....|ln| entonces el espectro de AD es % {0,l2,l3,...,ln}
% lambda: Autovalor
% v1: Autovector
% -------------------------------------------------------------------------

function [ADe,lambda,v1] = Def_Hotelling (A)
% Tamaño de la matriz
[m,n]= size(A);
% Evaluar que sea una matriz cuadrada
if n ~=m 
    disp('Matriz A debe ser cuadrada'); 
    return; 
end;
% Tolerancia para la convergencia
tol=1e-14; maxit=1000;
% Vector random de tamaño igual a las columnas de una matriz A
x0=randn(n,1);
% Utilización power method
[lambda,x]=Power_method_Z(A,tol,maxit,x0);
% Normaliza el vector v1
v1=x/norm(x);
% Proceso de deflacion
ADe = A-lambda*(v1*v1');
%--------------------------------------------------------------------------


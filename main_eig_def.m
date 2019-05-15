% -------------------------------------------------------------------------
% Nombre del programa: main_eig_def.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 10 de 2016
% Breve descripcion del programa: Evalua el autopar de A dependiendo del 
% valor de p, usando el método de Deflación de Hotelling
% Datos de entrada:
% A: Matriz simétrica de orden n
% p: Variable que determina el número de autopares mostrados
% Datos de salida:
% ADe: Matriz similar que representa una deflación de A por el método de
% Hotelling. Si el espectro de A es {l1,l2, ...,ln} tal que:
% |l1| > |l2| >= ....|ln| entonces el espectro de AD es % {0,l2,l3,...,ln}
% lambda: Autovalor
% v1: Autovector
% -------------------------------------------------------------------------

function [ADe, autoval, autovec] = main_eig_def(A,p)
% Tamaño de la matriz A
[m,n]=size(A); 
% Variable contenedoras de todos los autovalores y autovectores evaluados
autoval =[]; 
autovec=[];
% Bucle que permite calcular p autovalores y autovectores
%--------------------------------------------------------------------------
for i=1:p
% Uso del método de Deflación Hotelling 
[ADe,lambda,v1] = Def_Hotelling (A);
% Vector con todos los p lambdas evaluados
autoval = [autoval, lambda];
% Vector con todos los p autovectores
autovec = [autovec, v1];
% Intercambio de la matriz ADe  similar por la matriz A
A = ADe;
end
%--------------------------------------------------------------------------
end
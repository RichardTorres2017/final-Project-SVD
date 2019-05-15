% -------------------------------------------------------------------------
% Nombre del programa: Power_method_Z.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 10 de 2016
% Breve descripcion del programa: Evalua el autopar de m�dulo m�ximo con el
% m�todo de las potencias
% Datos de entrada:
% A: Matriz sim�trica de orden n
% tol: tolerancia, como criterio de parada
% maxit: n�mero m�ximo de iteraciones permitido
% x0: autovector supuesto inicial
% Datos de salida:
% lambda: aproximaci�n del autovalor de m�dulo m�ximo
% x: aproximaci�n al autovector asociado
% i: iteraciones requeridas para la convergencia
% -------------------------------------------------------------------------
function [lambda,x,i]=Power_method_Z(A,tol,maxit,x0)
% Tama�o de la matriz A
[m,n]=size(A); 
% Inicializar lamba en infinito
lambda0=inf; 
% Norma Frobenius 
naf=norm(A,'fro');
% Comprobaci�n que la matriz A es cuadrada
if m~=n
    disp('A no es cuadrada');
    return;
end;
% Inicializar la convergencia en 0
conv=0;
% Inicializar el n�mero de iteraciones requeridas para la convergencia
i=0;

% Bucle que continua hasta que el m�todo alcance su convergencia
%--------------------------------------------------------------------------
while conv==0 && i < maxit
    i=i+1;
    % Multipliaci�n sucesiva de la matriz A por x0
    y = A*x0;
    % Comprobar que la norma de y es menor a una tolerancia
    if norm(y) < 1e-10 
        lambda=0;
        return;
    end;
    % Normalizaci�n de x
    x = y/norm(y);
    % C�lculo del valor de lambda
    lambda=x'*A*x;
    % Condicional para comprobar que el m�todo converge o no
    if ((norm(x-x0)/naf < tol) || (abs(lambda-lambda0)/naf < tol)) 
        conv=1; 
    end
    % Reasignaci�n de la aproximaci�n del autovalor y del autovector
    x0=x;  
    lambda0=lambda;
end;
%--------------------------------------------------------------------------
if i==maxit
    %disp('Numero maximo de iteraciones alcanzado');
else
    %fprintf('it = %3i, lambda = %12.5e\n',i,lambda);
end;
%--------------------------------------------------------------------------
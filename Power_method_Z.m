% -------------------------------------------------------------------------
% Nombre del programa: Power_method_Z.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 10 de 2016
% Breve descripcion del programa: Evalua el autopar de módulo máximo con el
% método de las potencias
% Datos de entrada:
% A: Matriz simétrica de orden n
% tol: tolerancia, como criterio de parada
% maxit: número máximo de iteraciones permitido
% x0: autovector supuesto inicial
% Datos de salida:
% lambda: aproximación del autovalor de módulo máximo
% x: aproximación al autovector asociado
% i: iteraciones requeridas para la convergencia
% -------------------------------------------------------------------------
function [lambda,x,i]=Power_method_Z(A,tol,maxit,x0)
% Tamaño de la matriz A
[m,n]=size(A); 
% Inicializar lamba en infinito
lambda0=inf; 
% Norma Frobenius 
naf=norm(A,'fro');
% Comprobación que la matriz A es cuadrada
if m~=n
    disp('A no es cuadrada');
    return;
end;
% Inicializar la convergencia en 0
conv=0;
% Inicializar el número de iteraciones requeridas para la convergencia
i=0;

% Bucle que continua hasta que el método alcance su convergencia
%--------------------------------------------------------------------------
while conv==0 && i < maxit
    i=i+1;
    % Multipliación sucesiva de la matriz A por x0
    y = A*x0;
    % Comprobar que la norma de y es menor a una tolerancia
    if norm(y) < 1e-10 
        lambda=0;
        return;
    end;
    % Normalización de x
    x = y/norm(y);
    % Cálculo del valor de lambda
    lambda=x'*A*x;
    % Condicional para comprobar que el método converge o no
    if ((norm(x-x0)/naf < tol) || (abs(lambda-lambda0)/naf < tol)) 
        conv=1; 
    end
    % Reasignación de la aproximación del autovalor y del autovector
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
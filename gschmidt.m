% -------------------------------------------------------------------------
% Nombre del programa: gschmidt.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 10 de 2016
% Breve descripcion del programa: Permite ortonormalizar vectores por medio
% de Gram-Schmidt con la descomposición QR 
% Datos de entrada:
% V: Matriz de vectores 
% Datos de salida:
% Q: Matriz ortogonal (columnas ortonormales)
% R: Matriz triangular superior
% -------------------------------------------------------------------------
function [Q,R]=gschmidt(V)
% Tamaño de la matriz
[m,n]=size(V);
% Vector de ceros en R, con el mismo tamaño que las columnas V
R=zeros(n);
% Normaliza la primera columna de la matriz V
R(1,1)=norm(V(:,1));
Q(:,1)=V(:,1)/R(1,1);
% Bucle que permite ortonormalizar el resto de columnas de la matriz V
%--------------------------------------------------------------------------
for k=2:n
R(1:k-1,k)=Q(:,1:k-1)'*V(:,k);
% Substracción de la proyección
Q(:,k)=V(:,k)-Q(:,1:k-1)*R(1:k-1,k);
R(k,k)=norm(Q(:,k));
% Normaliza para el siguiente vector qj
Q(:,k)=Q(:,k)/R(k,k);
end
%--------------------------------------------------------------------------
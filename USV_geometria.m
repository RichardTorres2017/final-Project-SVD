% -------------------------------------------------------------------------
% Nombre del programa: USV_geometria.m
% Autores: Richard Torres - Karen Sanchez - Vanessa Hinojosa - Diana Pereira 
% Email de los autores: 
% richard.torres@yachaytech.edu.ec - karen.sanchez@yachaytech.edu.ec-
% vanessa.hinojosa@yachaytech.edu.ec - diana.pereira@yachaytech.edu.ec
% Fecha de elaboracion: Julio 13 de 2016
% Breve descripcion del programa: Permite visualizar el efecto geométrico 
% que tiene premultiplicar a la matriz V por A y a la matriz S por U, para
% matrices aleatorias de dimensión 2.
% Datos de entrada:
% No existen
% Datos de salida:
% A: Matriz aleatoria de orden 2
% Gráficas del efecto geométrico de permutiplicar las matrices V por A y la
% matriz S por U
% -------------------------------------------------------------------------

% Crea una matriz aleatoria de dimensión 2
A = rand(2); 
% Implementar la descomposición SVD, encontrar las matrices U,S,V
[U,S,V]=partial_SVD(A,2);
% Mensajes
fprintf('Generando las gráficas...\n\n'); 
fprintf('La matriz generada es: \n')
% Mostrar la matriz A
A
% Crear una figura, donde se ubicarán todas las gráficas correspondientes
% al efecto geométrico de premultiplicar las matrices anteriormente
% explicadas
        figure
%Generación de la gráfica  de la matriz A
        subplot(2,3,1)
        a1=A(:,1);
        a2=A(:,2);
        plot([0,a1(1)],[0,a1(2)],'b')
        hold on
        plot([0,a2(1)],[0,a2(2)],'b')
        title('Columnas de A')
        axis equal
% Generación de la gráfica de la matriz U
        subplot(2,3,4)
        u1=U(:,1);
        u2=U(:,2);
        plot([0,u1(1)],[0,u1(2)],'b')
        hold on
        plot([0,u2(1)],[0,u2(2)],'b')
        t=-pi:0.01:pi;
        x=cos(t);
        y=sin(t);
        hold on
        plot(x,y)
        title('Columnas de U')
        axis equal

% Generación de la gráfica de la matriz V
        subplot(2,3,2)
        v1=V(:,1);
        v2=V(:,2);
        plot([0,v1(1)],[0,v1(2)],'r')
        axis equal
        hold on
        plot([0,v2(1)],[0,v2(2)],'r')
        t=-pi:0.01:pi;
        x=cos(t);
        y=sin(t);
        hold on
        plot(x,y)
        title('Columnas de V')

% Generación de la gráfica de la matriz S
        subplot(2,3,5)
        s1=S(:,1);
        s2=S(:,2);
        plot([0,s1(1)],[0,s1(2)],'r')
        hold on
        plot([0,s2(1)],[0,s2(2)],'r')
        title('Columnas de S')
        axis equal
        m=size(x,2);
        X=zeros(2,m);
        for j=1:1:m
            X(1,j)=x(j);
            X(2,j)=y(j);
            F=S*X;
            plot(F(1,j),F(2,j))
        end	
        axis equal

        % Efecto de premultiplicar la matriz V por la matriz A 
        subplot(2,3,3)
        B=A*V;
        b1=B(:,1);
        b2=B(:,2);
        plot([0,b1(1)],[0,b1(2)],'m')
        hold on
        plot([0,b2(1)],[0,b2(2)],'m')
        title('Efecto de premultiplicar V por A')
        % Gráfica de la elipse, cuyos semiejes son b1 y b2
        m=size(x,2);
        X=zeros(2,m);
        for j=1:1:m
            X(1,j)=x(j);
            X(2,j)=y(j);
            E=A*X;
            plot(E(1,j),E(2,j))
        end	
        axis equal

        % Efecto de premultiplicar la matriz S por la matriz U 
        subplot(2,3,6)
        C=U*S;
        c1=C(:,1);
        c2=C(:,2);
        plot([0,c1(1)],[0,c1(2)],'m')
        hold on
        plot([0,c2(1)],[0,c2(2)],'m')
        title('Efecto de premultiplicar S por U')
        % Gráfica de la elipse cuyos semiejes son c1 y c2
        m=size(x,2);
        X=zeros(2,m);
        for j=1:1:m
            G=U*F;
            plot(G(1,j),G(2,j))
        end	
        axis equal
%--------------------------------------------------------------------------
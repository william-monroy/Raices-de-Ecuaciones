% Metodo de Newton Raphson
% Nos dice que Xi+1 = Xi- f(Xi)/f'(Xi)

% Limpiar todo
clear all
clc

syms x % Declaramos la variable simbolica x

% Pedimos los datos al usuario
funcion = input('Ingresa la funcion: ')
tolerancia = input('Ingresa la tolerancia admitida: ');
numeroAnt = input('Ingresa la primera aproximacion: ')

POLI = sym2poly(funcion)

% Inicializamos variables
% numeroAnt = 1;
errorCalculado = 100;
n = 1;

% Obtenemos la derivada de la funcion
derivada = diff(funcion)

% Enzabezado para el formato de la tabla en pantalla
fprintf('Iteracion    ValorAnt    ValorNuevo    ErrorNuevo  \n')

% Iteramos
while ((n<100) & (errorCalculado > tolerancia))

    % Xnueva = valorX - (f(x)/f'(x))
    numeroNuevo = numeroAnt - ((subs(funcion,numeroAnt)) / (subs(derivada,numeroAnt))) ;

    % Calculamos el error
    errorCalculado = abs(numeroAnt - numeroNuevo);
    % errorCalculado = abs(subs(funcion,numeroNuevo)); % Distancia al eje x de la funcion

    % Desplegamos nuevos valores
    fprintf('%4.0f      %5.5f      %5.5f        %3.3f \n',n,numeroAnt,numeroNuevo,errorCalculado)

    % Actualizamos
    numeroAnt = numeroNuevo;

    %Verificamos el error es menor al admitido
    if errorCalculado < tolerancia
        fprintf('\nLa raiz encontrada es: %5.4f \n', numeroAnt)
        fprintf('Numero de iteraciones: %4.0f \n\n', n)
        break;
    end
    n = n+1;
end

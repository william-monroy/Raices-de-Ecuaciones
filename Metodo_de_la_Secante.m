%Este program obtiene una raiz de una escuación
%aplicando el Método de la secante
%Que nos dice Xi+1 = Xi-1 - ((Xi - Xi-1)/(f(Xi) - f(Xi-1))) * f(Xi-1)


%Limpair todo
clear all
clc

disp('Metodo de la Secante')

%syms x %declaro la variable simbolica x

%Pedr datos al usuario
%funcion = input('Ingresa la primera funcion: ');
funcion = @(x) x.^3+8;

x0 = input('Ingresa la primera aproximacion: ');
x1 = input('Ingresa la primera aproximacion: ');
tolerancia = input('Ingresa la tolerancia admitida: ');

%inicializo las variables
errorCalculado = 100;
n=1;
Aproximaciones = [x0 x1];

%Encabezados para el formato de tabla en pantalla
fprintf('Iteracioin   x0   x1   x2   ErrorCalculado\n')


%Iteramos
while (n<25) & (errorCalculado > tolerancia)
    x2 = x0 - ((x1-x0)/(funcion(x1) - funcion(x0)))*funcion(x0);
    Aproximaciones = [Aproximaciones x2];

    %Calculando error
    errorCalculado = abs(x2-x1); % Diferencia entre el valor nuevo y el anterior
    %errorCalculado = abs(subs(funcion,x2)); Distancia al eje de la funcion

    %Desplegamos nuestros valores
    fprintf(' %4.0f    %5.5f    %5.5f    %3.3f    %5.9f \n',n,x0,x1,x2,errorCalculado)

    %Actualizamos
    x0 = x1;
    x1 = x2;

    %Verificamos el error es menor o igual al admitido
    if errorCalculado < tolerancia
        fprintf('\nLa raiz encontrada es: %5.4f \n',x2)
        fprintf('Numero de iteraciones: %4.0f \n\n',x2,n)
        break;
    end
    n=n+1;
end


